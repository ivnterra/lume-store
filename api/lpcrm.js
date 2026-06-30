// LP-CRM інтеграція — формує і надсилає замовлення у CRM-кабінет (rosydial.lp-crm.biz).
// Документація: https://rosydial.lp-crm.biz/api/addNewOrder.html
//
// Змінні оточення Vercel (Project Settings → Environment Variables):
//   LPCRM_KEY  — вхідний ключ API CRM-кабінету (тримати у секреті!)
//
// Якщо LPCRM_KEY не заданий — інтеграція тихо пропускається (замовлення все одно
// йде у Telegram і Supabase).

const LPCRM_URL = 'https://rosydial.lp-crm.biz/api/addNewOrder.html';

// ── Довідники CRM (зібрані з кабінету) ──────────────────────────────
// Доставка:  1 Нова Пошта · 2 Самовивіз · 3 Укрпошта
// Оплата:    2 Передоплата · 4 Післяплата · 7 Передоплата на картку
// Відділи:   1 Київ · 2 Харків · 3 Одеса
const DELIVERY_NP = '1';            // Нова Пошта (за замовчуванням)
const DEFAULT_OFFICE = '1';         // Відділ за замовчуванням: 1 Київ · 2 Харків · 3 Одеса
const PAY_MAP = {
  'Післяплата': '4',
  'Передплата за реквізитами': '2',
};
// Службовий товар для заявок з форми зв'язку (консультація)
const ZAYAVKA_PRODUCT_ID = '62';

// ── Маппінг артикул (sku) → product_id у CRM ────────────────────────
const SKU_TO_ID = {
  '51/31': '5',  '72/56': '6',  '72/58': '7',  '56/62': '8',  '56/66': '9',
  '56/51': '10', '72/15': '11', '51/34': '12', '79/60': '13', '50/49': '14',
  '51/37': '15', '51/41': '16', '56/57': '17', '55/26': '18', '79/58': '19',
  '50/98': '20', '51/28': '21', '72/59': '22', '50/95': '23', '72/47': '24',
  '50/65': '25', '56/59': '26', '72/65': '27', '51/18': '28', '56/56': '29',
  '51/44': '30', '79/56': '31', '56/50': '32', '56/68': '33', '72/46': '34',
  '50/42': '35', '50/18': '36', '56/63': '37', '56/52': '38', '56/70': '39',
  '72/60': '40', '50/10': '41', '50/30': '42', '13/10': '43', '13/11': '44',
  '13/12': '45', '13/14': '46', '13/15': '47', '13/16': '48', '13/24': '49',
  '13/27': '50', '13/29': '51', '13/31': '52', '13/32': '53', '13/33': '54',
  '13/17': '55', '13/18': '56', '13/20': '57', '13/21': '58', '13/22': '59',
  '13/23': '60', '13/28': '61',
  // нові товари (черв 2026)
  '72/62': '65', '72/63': '66', '72/49': '67',
};

// ── PHP serialize() для масиву товарів ──────────────────────────────
// LP-CRM очікує products = urlencode(serialize($products_list)).
function phpSerializeProducts(list) {
  const s = v => `s:${Buffer.byteLength(String(v), 'utf8')}:"${v}";`;
  let out = `a:${list.length}:{`;
  list.forEach((it, idx) => {
    out += `i:${idx};`;
    out += `a:3:{`;
    out += s('product_id') + s(it.product_id);
    out += s('price') + s(it.price);
    out += s('count') + s(it.count);
    out += `}`;
  });
  out += `}`;
  return out;
}

// PHP serialize() для асоціативного масиву (для поля sender — інфо про сайт)
function phpSerializeAssoc(obj) {
  const s = v => `s:${Buffer.byteLength(String(v), 'utf8')}:"${v}";`;
  const keys = Object.keys(obj);
  let out = `a:${keys.length}:{`;
  keys.forEach(k => { out += s(k) + s(obj[k]); });
  out += `}`;
  return out;
}

// 11+ значний унікальний код замовлення
function genOrderId() {
  return String(Math.floor(Date.now() / 100)) + String(Math.floor(10000 + Math.random() * 89999));
}

// Збирає масив товарів для CRM з позицій замовлення.
function buildProducts(items) {
  const list = [];
  (items || []).forEach(it => {
    const pid = SKU_TO_ID[String(it.sku || '').trim()];
    if (!pid) return; // немає у маппінгу — пропускаємо (деталі лишаться у коментарі)
    const qty = Number(it.qty) || 1;
    // ціна за одиницю з урахуванням акційної знижки (щоб сума в CRM збігалася з оплатою)
    const unitPrice = (Number(it.discount) > 0 && it.final != null)
      ? Math.round((Number(it.final) || 0) / qty)
      : Math.round(Number(it.price) || 0);
    list.push({
      product_id: pid,
      price: String(unitPrice),
      count: String(qty),
    });
  });
  return list;
}

// Головна функція. Повертає об'єкт відповіді CRM або null (якщо вимкнено).
// Помилки НЕ кидає назовні критично — обгорнути у try/catch на боці виклику.
async function sendToLpCrm(rec) {
  const KEY = process.env.LPCRM_KEY;
  if (!KEY) return null; // не налаштовано — пропускаємо

  const isContact = rec.type === 'contact';
  const items = Array.isArray(rec.items) ? rec.items : [];

  let products;
  let commentLines = [];
  if (isContact) {
    products = [{ product_id: ZAYAVKA_PRODUCT_ID, price: '0', count: '1' }];
    commentLines.push("Заявка з форми зв'язку (консультація)");
  } else {
    const list = buildProducts(items);
    if (!list.length) {
      products = [{ product_id: ZAYAVKA_PRODUCT_ID, price: String(Math.round(Number(rec.total) || 0)), count: '1' }];
    } else {
      products = list;
    }
    items.forEach(it => {
      const variant = [it.color ? `колір ${it.color}` : '', it.size ? `розмір ${it.size}` : ''].filter(Boolean).join(', ');
      const vlabel = variant ? ` (${variant})` : '';
      const sku = it.sku ? ` [${it.sku}]` : '';
      const disc = Number(it.discount) || 0;
      const priceStr = disc > 0
        ? `${Math.round(Number(it.sum) || 0)} → ${Math.round(Number(it.final) || 0)} грн. (акція -${Number(it.disc_pct) || 0}%: -${Math.round(disc)} грн.)`
        : `${Math.round(Number(it.price) || 0)} грн.`;
      commentLines.push(`• ${it.title || ''}${sku}${vlabel} × ${Number(it.qty) || 1} — ${priceStr}`);
    });
    if (Number(rec.discount) > 0) {
      commentLines.push(`Сума: ${Math.round(Number(rec.subtotal) || 0)} грн.`);
      commentLines.push(`Знижка за акцією: -${Math.round(Number(rec.discount))} грн.`);
    }
    if (rec.total) commentLines.push(`Разом: ${Math.round(Number(rec.total))} грн.`);
    if (rec.pay) commentLines.push(`Оплата: ${rec.pay}`);
  }

  const deliveryAddr = [rec.city, rec.np_branch].filter(Boolean).join(', ');
  const payment = PAY_MAP[rec.pay] || '';
  const utm = (rec.utm && typeof rec.utm === 'object') ? rec.utm : {};

  // ── тіло запиту (multipart, як у curl-прикладі документації) ──
  const fd = new FormData();
  fd.append('key', KEY);
  fd.append('order_id', genOrderId());
  fd.append('country', 'UA');
  fd.append('office', DEFAULT_OFFICE);
  fd.append('products', encodeURIComponent(phpSerializeProducts(products)));
  // sender — інформація про сайт покупця (обов'язкова для CRM)
  const host = rec.host || 'lume';
  const sender = {
    HTTP_HOST: host,
    SERVER_NAME: host,
    REQUEST_URI: rec.landing || '/',
    HTTP_REFERER: rec.referrer || ('https://' + host + '/'),
  };
  fd.append('sender', encodeURIComponent(phpSerializeAssoc(sender)));
  fd.append('bayer_name', String(rec.name || '').slice(0, 200));
  fd.append('phone', String(rec.phone || '').slice(0, 50));
  if (rec.email) fd.append('email', String(rec.email).slice(0, 200));
  if (commentLines.length) fd.append('comment', commentLines.join('\n').slice(0, 1500));
  if (!isContact) {
    fd.append('delivery', DELIVERY_NP);
    if (deliveryAddr) fd.append('delivery_adress', deliveryAddr.slice(0, 300));
    if (payment) fd.append('payment', payment);
  }
  if (utm.utm_source) fd.append('utm_source', utm.utm_source);
  if (utm.utm_medium) fd.append('utm_medium', utm.utm_medium);
  if (utm.utm_term) fd.append('utm_term', utm.utm_term);
  if (utm.utm_content) fd.append('utm_content', utm.utm_content);
  if (utm.utm_campaign) fd.append('utm_campaign', utm.utm_campaign);

  const r = await fetch(LPCRM_URL, { method: 'POST', body: fd });
  let data = null;
  try { data = await r.json(); } catch (e) { data = { status: 'error', message: 'non-JSON response' }; }
  return data;
}

export { sendToLpCrm, phpSerializeProducts, SKU_TO_ID };
