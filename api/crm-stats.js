// Статистика LP-CRM (rosydial.lp-crm.biz) за період — ліди, викупи, невикупи по брендах.
// Один спільний CRM-кабінет на всі 3 сайти (Talvyna/Majestic/Legka), розділені по "відділу" (office).
//
// Змінні оточення Vercel (Project Settings → Environment Variables):
//   LPCRM_OUTPUT_KEY — вихідний API ключ CRM-кабінету (Налаштування → Система → Вихідний ключ API)
//   STATS_TOKEN       — довільний секрет для захисту цього ендпоінта (сам придумай і встав)
//
// Виклик:
//   GET /api/crm-stats?from=2026-08-01&to=2026-08-13&token=STATS_TOKEN
//   GET /api/crm-stats?from=...&to=...&brand=talvyna&token=...   (розбивка по одному бренду)
//
// ⚠️ Дзвінки/прозвони LP-CRM API не віддає — цих даних тут просто немає (немає IP-телефонії
// в цьому кабінеті). Рахуємо тільки те, що є в статусах замовлень: ліди, викупи, невикупи.

const LPCRM_BASE = 'https://rosydial.lp-crm.biz/api';

// office → бренд (з "Відділ" у CRM: Офис №1 (Talvyna), №2 (Majestic), №3 (Legka))
const OFFICE_TO_BRAND = { '1': 'talvyna', '2': 'majestic', '3': 'legka' };
const BRAND_TO_OFFICE = { talvyna: '1', majestic: '2', legka: '3' };

// Класифікація статусу за назвою (стабільніше за хардкод ID — CRM віддає ID+назву разом).
function classifyStatus(name) {
  if (/Викуп|Гроші отрима/i.test(name)) return 'buyout';
  if (/Поверн/i.test(name)) return 'nonBuyout';
  return 'other';
}

async function lpcrm(method, params) {
  const r = await fetch(`${LPCRM_BASE}/${method}`, {
    method: 'POST',
    body: new URLSearchParams(params),
  });
  const j = await r.json();
  if (j.status !== 'ok') throw new Error(j.message || `${method} failed`);
  return j.data;
}

export default async function handler(req, res) {
  res.setHeader('Cache-Control', 'no-store');

  const KEY = process.env.LPCRM_OUTPUT_KEY;
  const TOKEN = process.env.STATS_TOKEN;
  if (!KEY || !TOKEN) {
    res.status(500).json({ error: 'not configured' });
    return;
  }

  const token = String(req.query.token || req.headers['x-stats-token'] || '');
  if (token !== TOKEN) {
    res.status(401).json({ error: 'unauthorized' });
    return;
  }

  const from = String(req.query.from || '');
  const to = String(req.query.to || '');
  const brand = req.query.brand ? String(req.query.brand) : null;
  if (!/^\d{4}-\d{2}-\d{2}$/.test(from) || !/^\d{4}-\d{2}-\d{2}$/.test(to)) {
    res.status(400).json({ error: 'from/to потрібні у форматі YYYY-MM-DD' });
    return;
  }
  if (brand && !BRAND_TO_OFFICE[brand]) {
    res.status(400).json({ error: 'brand: talvyna | majestic | legka' });
    return;
  }

  try {
    if (req.query.debug) {
      const r = await fetch(`${LPCRM_BASE}/getOrdersIdByStatus.html`, {
        method: 'POST',
        body: new URLSearchParams({ key: KEY, status: '3', date_start: from, date_end: to }),
      });
      res.status(200).json({ httpStatus: r.status, body: await r.text() });
      return;
    }

    const statuses = await lpcrm('getStatuses.html', { key: KEY }); // { id: name }
    const statusIds = Object.keys(statuses);

    // ponytail: LP-CRM API не тримає паралельні запити (віддає HTML замість JSON
    // при одночасних викликах з одним ключем) — тому послідовно, не Promise.all.
    // Апгрейд: якщо CRM колись почне тримати паралель — повернути Promise.all.
    const byStatus = {};
    let leads = 0, buyouts = 0, nonBuyouts = 0;
    const allIds = [];

    for (const id of statusIds) {
      const ids = await lpcrm('getOrdersIdByStatus.html', { key: KEY, status: id, date_start: from, date_end: to })
        .catch(() => []);
      const name = statuses[id];
      byStatus[name] = ids.length;
      leads += ids.length;
      const kind = classifyStatus(name);
      if (kind === 'buyout') buyouts += ids.length;
      if (kind === 'nonBuyout') nonBuyouts += ids.length;
      if (brand) allIds.push(...ids.map((oid) => ({ oid, name })));
    }

    if (!brand) {
      res.status(200).json({ from, to, leads, buyouts, nonBuyouts, byStatus });
      return;
    }

    // Розбивка по бренду — тягнемо деталі замовлень (office) пачками по 100.
    const office = BRAND_TO_OFFICE[brand];
    let bLeads = 0, bBuyouts = 0, bNonBuyouts = 0;
    for (let i = 0; i < allIds.length; i += 100) {
      const chunk = allIds.slice(i, i + 100);
      const data = await lpcrm('getOrdersByID.html', { key: KEY, order_id: chunk.map((x) => x.oid).join(',') });
      const orders = chunk.length === 1 ? { [chunk[0].oid]: data } : data;
      chunk.forEach(({ oid, name }) => {
        const o = orders[oid];
        if (!o || String(o.office) !== office) return;
        bLeads++;
        const kind = classifyStatus(name);
        if (kind === 'buyout') bBuyouts++;
        if (kind === 'nonBuyout') bNonBuyouts++;
      });
    }

    res.status(200).json({ from, to, brand, leads: bLeads, buyouts: bBuyouts, nonBuyouts: bNonBuyouts });
  } catch (e) {
    res.status(502).json({ error: String((e && e.message) || e) });
  }
}

export { classifyStatus, OFFICE_TO_BRAND, BRAND_TO_OFFICE };
