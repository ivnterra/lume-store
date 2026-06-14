// Vercel Serverless Function — приймає замовлення/заявки і пересилає у Telegram.
// Токен бота та chat_id зберігаються у змінних оточення Vercel (Project Settings → Environment Variables):
//   TELEGRAM_BOT_TOKEN  — токен від @BotFather
//   TELEGRAM_CHAT_ID    — куди слати (ваш chat id або id групи)

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
    let text;

    if (body.type === 'contact') {
      // Заявка з форми "Маєте питання?"
      text =
        `📩 Нова заявка (форма зв'язку) — LUMÉ\n\n` +
        `👤 Ім'я: ${name}\n` +
        `📞 Телефон: ${phone}`;
    } else {
      // Замовлення з кошика
      const pay = String(body.pay || '').trim().slice(0, 120);
      const items = Array.isArray(body.items) ? body.items : [];
      if (!items.length) {
        res.status(400).json({ error: 'empty order' });
        return;
      }
      const lines = items
        .map(it => `• ${String(it.title || '').slice(0, 200)}${it.size ? ` (${it.size})` : ''} × ${Number(it.qty) || 1} — ${money(it.sum)} грн.`)
        .join('\n');
      text =
        `🛍️ Нове замовлення — LUMÉ\n\n` +
        `👤 Ім'я: ${name}\n` +
        `📞 Телефон: ${phone}\n` +
        `💳 Оплата: ${pay || '—'}\n\n` +
        `🧾 Товари:\n${lines}\n\n` +
        `💰 Разом: ${money(body.total)} грн.`;
    }

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
