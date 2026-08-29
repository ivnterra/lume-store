// Health-check реального стану бази (на відміну від api/order — той лише
// перевіряє, що функція жива, до Supabase не звертається).
// Для UptimeRobot: 200 = база відповідає, 500 = недоступна (квота/збій).
//
// Додатково шле у Telegram зрозуміле пояснення: 29.08.2026 UptimeRobot
// прислав о 01:43 лист «HTTP 500 - Internal Server Error», і на з'ясування
// того, що це означає, пішло 4 години. Лист лишається, але тепер поряд
// приходить повідомлення людською мовою — що саме зламалось, що працює
// далі й чи треба щось робити.

// ponytail: дедуплікація без стану — шлемо лише у перші 5 хвилин години.
// UptimeRobot пінгує раз на 5 хв, тож виходить ~1 повідомлення на годину.
// Якщо колись зробити інтервал частішим — повідомлень стане більше;
// тоді треба справжній стан (KV/Redis), а не вікно часу.
function shouldNotify() {
  return new Date().getUTCMinutes() < 5;
}

async function notify(text) {
  const TOKEN = process.env.TELEGRAM_BOT_TOKEN;
  const CHAT = process.env.TELEGRAM_CHAT_ID;
  if (!TOKEN || !CHAT || !shouldNotify()) return;
  try {
    await fetch(`https://api.telegram.org/bot${TOKEN}/sendMessage`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ chat_id: CHAT, text, disable_web_page_preview: true }),
    });
  } catch (e) {
    console.error('db-health: не вдалось надіслати у Telegram', e);
  }
}

const QUOTA_MSG =
  '🟡 Supabase закрито за вичерпаною квотою (egress).\n\n' +
  'Що це означає простими словами: закінчився безкоштовний ліміт на віддачу ' +
  'фотографій. Квота спільна на Talvyna і Legka.\n\n' +
  'Сайт talvyna.com ПРАЦЮЄ:\n' +
  '• товари й ціни — зі знімка static-catalog/products.json (оновлюється автоматично)\n' +
  '• фото — локальні, лежать поруч зі знімком\n' +
  '• замовлення — йдуть у Telegram, CRM і таблицю, база для цього не потрібна\n\n' +
  'Не працює: адмінка (змінити товар чи наявність зараз не вийде).\n\n' +
  'Що робити: нічого. Квота оновиться сама на початку нового циклу — ' +
  'дату видно в листі від Supabase. Рекламу зупиняти не треба.';

export default async function handler(req, res) {
  const SB = process.env.SUPABASE_URL;
  const KEY = process.env.SUPABASE_SERVICE_ROLE_KEY;
  res.setHeader('Cache-Control', 'no-store');

  if (!SB || !KEY) {
    res.status(500).json({ ok: false, reason: 'not configured' });
    return;
  }

  try {
    const r = await fetch(
      SB.replace(/\/$/, '') + '/rest/v1/products?select=id&limit=1',
      { headers: { apikey: KEY, Authorization: 'Bearer ' + KEY } }
    );
    if (!r.ok) {
      // 402 — вичерпано квоту організації; решта — інша поломка
      const quota = r.status === 402;
      await notify(quota ? QUOTA_MSG :
        `🔴 Supabase відповідає помилкою ${r.status}.\n\n` +
        'Сайт має працювати зі знімка каталогу, але причина не в квоті — ' +
        'варто подивитись статус на status.supabase.com.');
      res.status(500).json({ ok: false, status: r.status, reason: quota ? 'quota exceeded' : 'error' });
      return;
    }
    res.status(200).json({ ok: true });
  } catch (e) {
    const msg = String((e && e.message) || e);
    await notify(`🔴 Supabase не відповідає.\n\nПомилка: ${msg}\n\n` +
      'Сайт має працювати зі знімка каталогу. Перевірте status.supabase.com.');
    res.status(500).json({ ok: false, error: msg });
  }
}
