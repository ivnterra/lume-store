// Запис рядків у Google Sheets через service account (без npm-залежностей — JWT
// підписуємо вбудованим node:crypto). Використовується api/order.js для live-синку
// заказів у робочу таблицю менеджера.
//
// Env: GOOGLE_SA_JSON — повний JSON-ключ service account (Vercel → Sensitive).
//
// НЕ використовуємо values:append — у таблиці менеджера вже є попередньо
// відформатовані порожні рядки з формулами в інших колонках (Маржа тощо), і
// евристика "автовизначення таблиці" в append мавпує зі зсувом колонок (перевірено
// емпірично: замість D:Q писало в B:O). Тому: знаходимо рядок одразу після
// останнього заповненого за колонкою K (Артикул) і пишемо в точну адресу через
// values:update — так номери заказів у таблиці завжди йдуть по зростанню, навіть
// якщо десь вище лишилась порожня "дірка" (напр. через товар без артикулу).
import crypto from 'node:crypto';

const SCOPE = 'https://www.googleapis.com/auth/spreadsheets';
const TOKEN_URL = 'https://oauth2.googleapis.com/token';

function b64url(input) {
  return Buffer.from(input).toString('base64').replace(/\+/g, '-').replace(/\//g, '_').replace(/=+$/, '');
}

async function getAccessToken(sa) {
  const now = Math.floor(Date.now() / 1000);
  const header = { alg: 'RS256', typ: 'JWT' };
  const claims = {
    iss: sa.client_email,
    scope: SCOPE,
    aud: TOKEN_URL,
    iat: now,
    exp: now + 3600,
  };
  const unsigned = b64url(JSON.stringify(header)) + '.' + b64url(JSON.stringify(claims));
  const signature = crypto.sign('RSA-SHA256', Buffer.from(unsigned), sa.private_key);
  const jwt = unsigned + '.' + signature.toString('base64').replace(/\+/g, '-').replace(/\//g, '_').replace(/=+$/, '');

  const r = await fetch(TOKEN_URL, {
    method: 'POST',
    headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
    body: new URLSearchParams({
      grant_type: 'urn:ietf:params:oauth:grant-type:jwt-bearer',
      assertion: jwt,
    }),
  });
  const j = await r.json();
  if (!j.access_token) throw new Error('Google OAuth: ' + JSON.stringify(j));
  return j.access_token;
}

async function resolveSheetTitle(token, spreadsheetId, gid) {
  const r = await fetch(
    `https://sheets.googleapis.com/v4/spreadsheets/${spreadsheetId}?fields=sheets.properties`,
    { headers: { Authorization: 'Bearer ' + token } }
  );
  const j = await r.json();
  const sheet = (j.sheets || []).find(s => String(s.properties.sheetId) === String(gid));
  if (!sheet) throw new Error('gsheet: вкладку з gid=' + gid + ' не знайдено: ' + JSON.stringify(j));
  return sheet.properties.title;
}

// Рядок одразу після ОСТАННЬОГО заповненого (за колонкою col), рахуючи з 2
// (1 — заголовок). Навмисно НЕ перший порожній: якщо десь вище лишилась
// порожня "дірка" (напр. товар без артикулу лишив K порожньою), новий заказ
// має йти строго після всіх наявних — інакше номери заказів у таблиці підуть
// не по зростанню, а новий рядок затре собою старі дані в цій дірці.
async function findNextRow(token, spreadsheetId, title, col) {
  const range = `'${title}'!${col}2:${col}2000`;
  const r = await fetch(
    `https://sheets.googleapis.com/v4/spreadsheets/${spreadsheetId}/values/${encodeURIComponent(range)}`,
    { headers: { Authorization: 'Bearer ' + token } }
  );
  const j = await r.json();
  const values = j.values || [];
  let lastUsed = -1;
  for (let i = 0; i < values.length; i++) if (values[i][0]) lastUsed = i;
  return 2 + lastUsed + 1;
}

// Пише рядки у точно вказаний рядок (для бекфілу/корекції вже записаних даних —
// на відміну від writeOrderRows не шукає першу порожню, а перезаписує задане місце).
export async function writeOrderRowsAt(spreadsheetId, gid, startRow, rows) {
  const sa = JSON.parse(process.env.GOOGLE_SA_JSON);
  const token = await getAccessToken(sa);
  const title = await resolveSheetTitle(token, spreadsheetId, gid);
  const endRow = startRow + rows.length - 1;
  const range = `'${title}'!B${startRow}:Q${endRow}`;

  const r = await fetch(
    `https://sheets.googleapis.com/v4/spreadsheets/${spreadsheetId}/values/${encodeURIComponent(range)}` +
      '?valueInputOption=USER_ENTERED',
    {
      method: 'PUT',
      headers: { Authorization: 'Bearer ' + token, 'Content-Type': 'application/json' },
      body: JSON.stringify({ range, values: rows }),
    }
  );
  const j = await r.json();
  if (!r.ok) throw new Error('gsheet update: ' + JSON.stringify(j));
  return j;
}

// rows — масив рядків, кожен рядок = 16 значень для колонок B..Q (порожні
// колонки C,F,H,I,J,O передавати як '').
export async function writeOrderRows(spreadsheetId, gid, rows) {
  const sa = JSON.parse(process.env.GOOGLE_SA_JSON);
  const token = await getAccessToken(sa);
  const title = await resolveSheetTitle(token, spreadsheetId, gid);
  // "зайнятість" рядка перевіряємо за колонкою K (Артикул), а не D (Дата):
  // при замовленні з кількома товарами дата стоїть лише в першому рядку
  // замовлення, а наступні рядки (2-й, 3-й товар) мають порожню D — тому
  // пошук "першої порожньої по D" знаходив ці рядки як вільні й затирав їх
  // наступним замовленням. Артикул зазвичай заповнений у кожному рядку, але
  // товар без артикулу (sku:'') все одно лишить K порожньою — тому пишемо
  // не в першу порожню K, а одразу після останньої заповненої (findNextRow).
  const startRow = await findNextRow(token, spreadsheetId, title, 'K');
  return writeOrderRowsAt(spreadsheetId, gid, startRow, rows);
}
