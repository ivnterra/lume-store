// Щоденна перевірка навантаження на Cloudflare Worker `talvyna-img` (віддача фото).
// Якщо за добу запитів близько до ліміту Free (100k) — шле попередження у Telegram.
// Викликається Vercel Cron (див. vercel.json) раз на добу. Тест: /api/img-usage-check?test=1
//
// Env (Vercel → Settings → Environment Variables):
//   TELEGRAM_BOT_TOKEN, TELEGRAM_CHAT_ID  — вже налаштовані (ті самі, що для замовлень)
//   CF_ANALYTICS_TOKEN                    — read-only токен Cloudflare (Account Analytics: Read)

const CF_ACCOUNT = '098d0918399cdaa029e96367f4020149';
const WORKER_NAME = 'talvyna-img';
const DAILY_LIMIT = 100000;   // ліміт Free Workers — запитів/добу
const THRESHOLD = 80000;      // поріг попередження

export default async function handler(req, res) {
  const TOKEN = process.env.TELEGRAM_BOT_TOKEN;
  const CHAT = process.env.TELEGRAM_CHAT_ID;
  const send = (text) => fetch(`https://api.telegram.org/bot${TOKEN}/sendMessage`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ chat_id: CHAT, text, disable_web_page_preview: true }),
  });

  if (!TOKEN || !CHAT) {
    res.status(500).json({ error: 'Telegram is not configured' });
    return;
  }

  // ── тестовий режим ──
  if (req.query && req.query.test) {
    await send('✅ Тест: моніторинг лімітів Cloudflare підключено.\nЯкщо добова кількість запитів до картинок наближатиметься до ліміту Free — сюди прийде попередження.');
    res.status(200).json({ ok: true, test: true });
    return;
  }

  // ── реальна перевірка через Cloudflare GraphQL ──
  const CF = process.env.CF_ANALYTICS_TOKEN;
  if (!CF) {
    res.status(200).json({ ok: false, reason: 'CF_ANALYTICS_TOKEN not set' });
    return;
  }

  const now = new Date();
  const start = new Date(Date.UTC(now.getUTCFullYear(), now.getUTCMonth(), now.getUTCDate() - 1, 0, 0, 0));
  const end = new Date(Date.UTC(now.getUTCFullYear(), now.getUTCMonth(), now.getUTCDate(), 0, 0, 0));
  const query = `query($acc:String!,$s:Time!,$e:Time!){viewer{accounts(filter:{accountTag:$acc}){workersInvocationsAdaptive(limit:10000,filter:{scriptName:"${WORKER_NAME}",datetime_geq:$s,datetime_lt:$e}){sum{requests}}}}}`;

  let requests = 0;
  try {
    const r = await fetch('https://api.cloudflare.com/client/v4/graphql', {
      method: 'POST',
      headers: { Authorization: 'Bearer ' + CF, 'Content-Type': 'application/json' },
      body: JSON.stringify({ query, variables: { acc: CF_ACCOUNT, s: start.toISOString(), e: end.toISOString() } }),
    });
    const j = await r.json();
    const rows = j.data.viewer.accounts[0].workersInvocationsAdaptive;
    requests = rows.reduce((a, x) => a + (x.sum?.requests || 0), 0);
  } catch (e) {
    res.status(200).json({ ok: false, reason: 'CF query failed: ' + (e && e.message) });
    return;
  }

  const pct = Math.round((requests / DAILY_LIMIT) * 100);
  if (requests >= THRESHOLD) {
    await send(
      `⚠️ Cloudflare (картинки) — наближення до ліміту\n\n` +
      `Учора: ${requests.toLocaleString('uk-UA')} запитів (${pct}% від ${DAILY_LIMIT.toLocaleString('uk-UA')}/добу).\n\n` +
      `Радимо перейти на Workers Paid ($5/міс) — інакше при перевищенні ліміту картинки можуть тимчасово не вантажитись.\n` +
      `Cloudflare → Workers & Pages → Plans.`
    );
  }
  res.status(200).json({ ok: true, requests, pct });
}
