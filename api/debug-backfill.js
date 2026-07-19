// ВРЕМЕННЫЙ — разова вигрузка існуючих заказів (id >= 535) у Google-таблицю
// менеджера. Видалити після успішного запуску.
import { writeOrderRows } from './gsheet.js';

export default async function handler(req, res) {
  if (req.query.t !== 'tlv-dbg-7031') return res.status(404).send('not found');
  const SB = process.env.SUPABASE_URL;
  const KEY = process.env.SUPABASE_SERVICE_ROLE_KEY;
  const fromId = req.query.from || '535';
  try {
    const r = await fetch(
      `${SB.replace(/\/$/, '')}/rest/v1/orders?select=id,created_at,name,email,items&type=eq.order&id=gte.${fromId}&order=id.asc&limit=1000`,
      { headers: { apikey: KEY, Authorization: 'Bearer ' + KEY } }
    );
    const orders = await r.json();

    const rows = [];
    for (const o of orders) {
      const dt = new Date(o.created_at);
      const dateStr = String(dt.getDate()).padStart(2, '0') + '.' +
        String(dt.getMonth() + 1).padStart(2, '0') + '.' + dt.getFullYear();
      const items = Array.isArray(o.items) && o.items.length ? o.items : [{}];
      items.forEach((it, i) => {
        rows.push([
          i === 0 ? String(o.id) : '',
          '',
          i === 0 ? dateStr : '',
          i === 0 ? (o.name || '') : '',
          '',
          i === 0 ? (o.email || '') : '',
          '', '', '',
          it.sku || '',
          it.title || '',
          it.color || '',
          it.size || '',
          '',
          it.price != null ? it.price : '',
          it.disc_pct ? it.disc_pct + '%' : '',
        ]);
      });
    }

    if (req.query.dry === '1') {
      return res.status(200).json({ dryRun: true, ordersCount: orders.length, rowsCount: rows.length, sample: rows.slice(0, 3) });
    }

    const result = await writeOrderRows('1DPZB24GYyzBfLQvEiAOiYSsuUdKYyQRa0Fo3pixVkLE', '1059855693', rows);
    res.status(200).json({ ok: true, ordersCount: orders.length, rowsCount: rows.length, result });
  } catch (e) {
    res.status(500).json({ ok: false, error: String(e && e.stack || e) });
  }
}
