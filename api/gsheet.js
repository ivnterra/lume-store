// Запис рядків у Google Sheets через service account (без npm-залежностей — JWT
// підписуємо вбудованим node:crypto). Використовується api/order.js для live-синку
// заказів у робочу таблицю менеджера.
//
// Env: GOOGLE_SA_JSON — повний JSON-ключ service account (Vercel → Sensitive).
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

let cachedSheetTitle = null; // кешуємо назву вкладки на весь час життя функції

// Знаходить назву вкладки (sheet tab) за її числовим sheetId (gid з URL).
async function resolveSheetTitle(token, spreadsheetId, gid) {
  if (cachedSheetTitle) return cachedSheetTitle;
  const r = await fetch(
    `https://sheets.googleapis.com/v4/spreadsheets/${spreadsheetId}?fields=sheets.properties`,
    { headers: { Authorization: 'Bearer ' + token } }
  );
  const j = await r.json();
  const sheet = (j.sheets || []).find(s => String(s.properties.sheetId) === String(gid));
  if (!sheet) throw new Error('gsheet: вкладку з gid=' + gid + ' не знайдено: ' + JSON.stringify(j));
  cachedSheetTitle = sheet.properties.title;
  return cachedSheetTitle;
}

// rows — масив рядків (кожен рядок — масив значень для колонок у межах colRange,
// напр. colRange='D:Q' -> кожен рядок містить 14 значень D,E,F,...,Q; порожні
// колонки (F,H,I,J,O) передавати як '').
export async function appendRows(spreadsheetId, gid, colRange, rows) {
  const sa = JSON.parse(process.env.GOOGLE_SA_JSON);
  const token = await getAccessToken(sa);
  const title = await resolveSheetTitle(token, spreadsheetId, gid);
  const range = `'${title}'!${colRange}`;
  const r = await fetch(
    `https://sheets.googleapis.com/v4/spreadsheets/${spreadsheetId}/values/${encodeURIComponent(range)}:append` +
      '?valueInputOption=USER_ENTERED&insertDataOption=INSERT_ROWS',
    {
      method: 'POST',
      headers: { Authorization: 'Bearer ' + token, 'Content-Type': 'application/json' },
      body: JSON.stringify({ values: rows }),
    }
  );
  const j = await r.json();
  if (!r.ok) throw new Error('gsheet append: ' + JSON.stringify(j));
  return j;
}
