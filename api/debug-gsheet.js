// ВРЕМЕННЫЙ — прочитати D2:Q3 і прибрати тестові рядки. Видалити після перевірки.
import crypto from 'node:crypto';

const SCOPE = 'https://www.googleapis.com/auth/spreadsheets';
const TOKEN_URL = 'https://oauth2.googleapis.com/token';
const SS = '1DPZB24GYyzBfLQvEiAOiYSsuUdKYyQRa0Fo3pixVkLE';

function b64url(input) {
  return Buffer.from(input).toString('base64').replace(/\+/g, '-').replace(/\//g, '_').replace(/=+$/, '');
}
async function getAccessToken() {
  const sa = JSON.parse(process.env.GOOGLE_SA_JSON);
  const now = Math.floor(Date.now() / 1000);
  const header = { alg: 'RS256', typ: 'JWT' };
  const claims = { iss: sa.client_email, scope: SCOPE, aud: TOKEN_URL, iat: now, exp: now + 3600 };
  const unsigned = b64url(JSON.stringify(header)) + '.' + b64url(JSON.stringify(claims));
  const signature = crypto.sign('RSA-SHA256', Buffer.from(unsigned), sa.private_key);
  const jwt = unsigned + '.' + signature.toString('base64').replace(/\+/g, '-').replace(/\//g, '_').replace(/=+$/, '');
  const r = await fetch(TOKEN_URL, {
    method: 'POST', headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
    body: new URLSearchParams({ grant_type: 'urn:ietf:params:oauth:grant-type:jwt-bearer', assertion: jwt }),
  });
  const j = await r.json();
  if (!j.access_token) throw new Error('token: ' + JSON.stringify(j));
  return j.access_token;
}

export default async function handler(req, res) {
  if (req.query.t !== 'tlv-dbg-7031') return res.status(404).send('not found');
  try {
    const token = await getAccessToken();
    const range = `'Заказы'!D2:Q3`;
    const vals = await (await fetch(
      `https://sheets.googleapis.com/v4/spreadsheets/${SS}/values/${encodeURIComponent(range)}`,
      { headers: { Authorization: 'Bearer ' + token } }
    )).json();

    let cleared = null;
    if (req.query.clear === '1') {
      cleared = await (await fetch(
        `https://sheets.googleapis.com/v4/spreadsheets/${SS}/values/${encodeURIComponent(`'Заказы'!D2:Q3`)}:clear`,
        { method: 'POST', headers: { Authorization: 'Bearer ' + token } }
      )).json();
    }
    res.status(200).json({ values: vals.values || [], cleared });
  } catch (e) {
    res.status(500).json({ ok: false, error: String(e && e.stack || e) });
  }
}
