// Vercel Serverless Function — приймає замовлення/заявки, зберігає у Supabase і пересилає у Telegram.
// Змінні оточення Vercel (Project Settings → Environment Variables):
//   TELEGRAM_BOT_TOKEN         — токен від @BotFather
//   TELEGRAM_CHAT_ID           — куди слати (ваш chat id або id групи)
//   SUPABASE_URL               — URL проєкту Supabase (для збереження у базу замовлень)
//   SUPABASE_SERVICE_ROLE_KEY  — service_role / secret ключ (обходить RLS; тримати у секреті!)

import { sendToLpCrm, SKU_TO_ID } from './lpcrm.js';

// ISO-код країни (UA) -> повна назва (Україна). Якщо не вийде — повертаємо код.
function countryName(code) {
  if (!code) return '';
  try {
    return new Intl.DisplayNames(['en'], { type: 'region' }).of(code) || code;
  } catch (e) {
    return code;
  }
}

async function saveOrder(record) {
  const SB = process.env.SUPABASE_URL;
  const KEY = process.env.SUPABASE_SERVICE_ROLE_KEY;
  if (!SB || !KEY) return; // база не налаштована — пропускаємо, замовлення все одно піде у Telegram
  try {
    await fetch(`${SB.replace(/\/$/, '')}/rest/v1/orders`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'apikey': KEY,
        'Authorization': 'Bearer ' + KEY,
        'Prefer': 'return=minimal'
      },
      body: JSON.stringify(record)
    });
  } catch (e) {
    // не зриваємо замовлення через помилку запису у базу
    console.error('saveOrder failed:', e);
  }
}

export default async function handler(req, res) {
  if (req.method !== 'POST') {
    res.status(405).json({ error: 'Method not allowed' });
    return;
  }

  const TOKEN = process.env.TELEGRAM_BOT_TOKEN;
  const CHAT = process.env.TELEGRAM_CHAT_ID;
  if (!TOKEN || !CHAT) {
    res.status(500).json({ error: 'Telegram is not configured' });
    return;
  }

  try {
    const body = typeof req.body === 'string' ? JSON.parse(req.body || '{}') : (req.body || {});
    const name = String(body.name || '').trim().slice(0, 200);
    const phone = String(body.phone || '').trim().slice(0, 50);

    if (!name || !phone) {
      res.status(400).json({ error: 'name and phone are required' });
      return;
    }

    const money = n => (Number(n) || 0).toLocaleString('uk-UA');
    const utm = (body.utm && typeof body.utm === 'object') ? body.utm : {};
    const isContact = body.type === 'contact';
    const pay = String(body.pay || '').trim().slice(0, 120);
    const items = Array.isArray(body.items) ? body.items : [];
    const city = String(body.city || '').trim().slice(0, 160);
    const npBranch = String(body.np_branch || '').trim().slice(0, 200);
    const email = String(body.email || '').trim().slice(0, 200);

    if (!isContact && !items.length) {
      res.status(400).json({ error: 'empty order' });
      return;
    }

    // ---- геолокація за IP (заголовки Vercel) ----
    const dec = v => { try { return decodeURIComponent(v); } catch (e) { return v; } };
    const geoCountryCode = String(req.headers['x-vercel-ip-country'] || '').trim();
    const geoCountry = countryName(geoCountryCode); // повна назва, напр. "Україна"
    const geoRegion = String(req.headers['x-vercel-ip-country-region'] || '').trim();
    const geoCity = dec(String(req.headers['x-vercel-ip-city'] || '').trim());

    // ---- UTM рядками з підписами ----
    const utmKeys = ['utm_source', 'utm_medium', 'utm_campaign', 'utm_term', 'utm_content'];
    const utmLines = utmKeys.filter(k => utm[k]).map(k => `${k}: ${utm[k]}`);

    // ---- текст для Telegram ----
    let text;
    if (isContact) {
      text =
        `📩 Нова заявка (форма зв'язку) — Talvyna\n\n` +
        `👤 Ім'я: ${name}\n` +
        `📞 Телефон: ${phone}`;
    } else {
      const lines = items
        .map(it => {
          const variant = [it.color, it.size].filter(Boolean).join(', ');
          const sku = String(it.sku || '').trim();
          const url = String(it.url || '').trim();
          const skuStr = sku ? `\n   🔖 Артикул: ${sku}` : '';
          const urlStr = url ? `\n   🔗 ${url}` : '';
          const disc = Number(it.discount) || 0;
          const priceStr = disc > 0
            ? `${money(it.sum)} → ${money(it.final)} грн. (🎁 −${Number(it.disc_pct) || 0}%: −${money(disc)} грн.)`
            : `${money(it.sum)} грн.`;
          return `• ${String(it.title || '').slice(0, 200)}${variant ? ` (${variant})` : ''} × ${Number(it.qty) || 1} — ${priceStr}${skuStr}${urlStr}`;
        })
        .join('\n');
      const discountTotal = Number(body.discount) || 0;
      const totalsStr = discountTotal > 0
        ? `💵 Сума: ${money(body.subtotal)} грн.\n🎁 Знижка за акцією: −${money(discountTotal)} грн.\n💰 Разом: ${money(body.total)} грн.`
        : `💰 Разом: ${money(body.total)} грн.`;
      text =
        `🛍️ Нове замовлення — Talvyna\n\n` +
        `👤 Ім'я: ${name}\n` +
        `📞 Телефон: ${phone}\n` +
        `📧 Email: ${email || '—'}\n` +
        `🏙️ Місто: ${city || '—'}\n` +
        `🏤 Відділення НП: ${npBranch || '—'}\n` +
        `💳 Оплата: ${pay || '—'}\n\n` +
        `🧾 Товари:\n${lines}\n\n` +
        totalsStr;
    }
    const geoStr = [geoCountry, geoCity].filter(Boolean).join(', ');
    if (geoStr) text += `\n\n🌍 Гео (IP): ${geoStr}`;
    if (utmLines.length) text += `\n\n🔗 UTM:\n${utmLines.join('\n')}`;
    const refStr = String(body.referrer || '').trim();
    const landStr = String(body.landing || '').trim();
    if (refStr) text += `\n\n↩️ Реферер: ${refStr.slice(0, 300)}`;
    if (landStr) text += `\n🔗 Лендінг: ${landStr.slice(0, 300)}`;

    // ---- попередження: товар(и) без маппінгу в CRM (пішли як заглушка) ----
    if (!isContact && process.env.LPCRM_KEY) {
      const unmapped = items.filter(it => !SKU_TO_ID[String(it.sku || '').trim()]);
      if (unmapped.length) {
        const names = unmapped
          .map(it => `• ${String(it.title || '').slice(0, 80)}${it.sku ? ` [${it.sku}]` : ' [без артикулу]'}`)
          .join('\n');
        text += `\n\n⚠️ Не заведено в CRM (пішло як заглушка):\n${names}\nДодайте пару sku:id у api/lpcrm.js`;
      }
    }

    // ---- зберігаємо у базу (не блокуючи замовлення) ----
    await saveOrder({
      type: isContact ? 'contact' : 'order',
      name, phone,
      email: email || null,
      city: isContact ? null : (city || null),
      np_branch: isContact ? null : (npBranch || null),
      pay: isContact ? null : (pay || null),
      items: isContact ? [] : items,
      total: isContact ? 0 : (Number(body.total) || 0),
      utm_source: utm.utm_source || null,
      utm_medium: utm.utm_medium || null,
      utm_campaign: utm.utm_campaign || null,
      utm_term: utm.utm_term || null,
      utm_content: utm.utm_content || null,
      geo_country: geoCountry || null,
      geo_region: geoRegion || null,
      geo_city: geoCity || null,
      referrer: (body.referrer || '').toString().slice(0, 500) || null,
      landing_page: (body.landing || '').toString().slice(0, 500) || null
    });

    // ---- надсилаємо у LP-CRM (лише покупки, не заявки; не блокуючи замовлення) ----
    if (!isContact) {
      try {
        const crmRes = await sendToLpCrm({
          type: 'order',
          name, phone, email,
          city, np_branch: npBranch, pay,
          items, total: Number(body.total) || 0,
          subtotal: Number(body.subtotal) || 0,
          discount: Number(body.discount) || 0,
          utm,
          host: req.headers['host'] || '',
          referrer: body.referrer || '',
          landing: body.landing || ''
        });
        if (crmRes && crmRes.status !== 'ok') {
          console.error('LP-CRM error:', crmRes.message);
        }
      } catch (e) {
        console.error('LP-CRM send failed:', e && e.message);
      }
    }

    // ---- надсилаємо у Telegram ----
    const tg = await fetch(`https://api.telegram.org/bot${TOKEN}/sendMessage`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ chat_id: CHAT, text, disable_web_page_preview: true })
    });
    const tgj = await tg.json();
    if (!tgj.ok) {
      res.status(502).json({ error: 'Telegram error', detail: tgj.description });
      return;
    }

    res.status(200).json({ ok: true });
  } catch (e) {
    res.status(500).json({ error: String((e && e.message) || e) });
  }
}
