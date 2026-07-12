// Vercel Serverless Function — керування користувачами адмін-панелі (тільки для ролі admin).
// Дії: list / create / setRole / delete  (через Supabase Auth Admin API).
//
// Змінні оточення Vercel (Project Settings → Environment Variables):
//   SUPABASE_URL               — URL проєкту Supabase
//   SUPABASE_SERVICE_ROLE_KEY  — service_role / secret ключ (обходить RLS; тримати у секреті!)
//
// Авторизація: клієнт надсилає заголовок `Authorization: Bearer <access_token>`
// залогіненого користувача. Функція перевіряє цей токен і допускає лише роль admin.

const ROLES = ['admin', 'manager', 'content'];
// Власник магазину — допускається як admin навіть якщо app_metadata.role ще не проставлено.
const BOOTSTRAP_ADMIN_EMAIL = (process.env.BOOTSTRAP_ADMIN_EMAIL || 'ivnterra@gmail.com').toLowerCase();

function base() {
  return String(process.env.SUPABASE_URL || '').replace(/\/$/, '');
}

// Витягує роль користувача (з урахуванням bootstrap-власника).
function roleOf(user) {
  const r = user && user.app_metadata && user.app_metadata.role;
  if (r) return r;
  if (user && String(user.email || '').toLowerCase() === BOOTSTRAP_ADMIN_EMAIL) return 'admin';
  return null;
}

// Перевіряє токен викликача → повертає об'єкт користувача або null.
async function resolveCaller(token, KEY) {
  try {
    const r = await fetch(`${base()}/auth/v1/user`, {
      headers: { apikey: KEY, Authorization: 'Bearer ' + token }
    });
    if (!r.ok) return null;
    return await r.json();
  } catch (e) {
    return null;
  }
}

function publicUser(u) {
  return {
    id: u.id,
    email: u.email,
    role: (u.app_metadata && u.app_metadata.role) ||
          (String(u.email || '').toLowerCase() === BOOTSTRAP_ADMIN_EMAIL ? 'admin' : null),
    created_at: u.created_at,
    last_sign_in_at: u.last_sign_in_at || null
  };
}

// Єдина адмінка живе на обох доменах — дозволяємо крос-доменні виклики між магазинами.
const ALLOWED_ORIGINS = [
  'https://talvyna.com',
  'https://www.talvyna.com',
  'https://majestic.talvyna.com'
];
function applyCors(req, res) {
  const origin = String(req.headers.origin || '');
  if (ALLOWED_ORIGINS.includes(origin)) {
    res.setHeader('Access-Control-Allow-Origin', origin);
    res.setHeader('Vary', 'Origin');
    res.setHeader('Access-Control-Allow-Methods', 'POST, OPTIONS');
    res.setHeader('Access-Control-Allow-Headers', 'Content-Type, Authorization');
    res.setHeader('Access-Control-Max-Age', '86400');
  }
}

export default async function handler(req, res) {
  applyCors(req, res);
  if (req.method === 'OPTIONS') {
    res.status(204).end();
    return;
  }
  if (req.method !== 'POST') {
    res.status(405).json({ error: 'Method not allowed' });
    return;
  }

  const SB = base();
  const KEY = process.env.SUPABASE_SERVICE_ROLE_KEY;
  if (!SB || !KEY) {
    res.status(500).json({ error: 'Supabase is not configured' });
    return;
  }

  // ---- авторизація викликача ----
  const authHeader = String(req.headers['authorization'] || '');
  const token = authHeader.replace(/^Bearer\s+/i, '').trim();
  if (!token) {
    res.status(401).json({ error: 'No token' });
    return;
  }
  const caller = await resolveCaller(token, KEY);
  if (!caller || !caller.id) {
    res.status(401).json({ error: 'Invalid token' });
    return;
  }
  if (roleOf(caller) !== 'admin') {
    res.status(403).json({ error: 'Лише адміністратор може керувати користувачами' });
    return;
  }

  // service_role заголовки для Admin API
  const adminHeaders = {
    'Content-Type': 'application/json',
    apikey: KEY,
    Authorization: 'Bearer ' + KEY
  };

  try {
    const body = typeof req.body === 'string' ? JSON.parse(req.body || '{}') : (req.body || {});
    const action = String(body.action || '');

    // ---------- список користувачів ----------
    if (action === 'list') {
      const r = await fetch(`${SB}/auth/v1/admin/users?per_page=200`, { headers: adminHeaders });
      const j = await r.json();
      if (!r.ok) { res.status(502).json({ error: j.msg || j.error || 'Помилка отримання списку' }); return; }
      const arr = Array.isArray(j) ? j : (j.users || []);
      res.status(200).json({ users: arr.map(publicUser) });
      return;
    }

    // ---------- створення користувача ----------
    if (action === 'create') {
      const email = String(body.email || '').trim().toLowerCase();
      const password = String(body.password || '');
      const role = String(body.role || '');
      if (!email || !/.+@.+\..+/.test(email)) { res.status(400).json({ error: 'Некоректний email' }); return; }
      if (password.length < 8) { res.status(400).json({ error: 'Пароль має містити щонайменше 8 символів' }); return; }
      if (!ROLES.includes(role)) { res.status(400).json({ error: 'Невідома роль' }); return; }

      const r = await fetch(`${SB}/auth/v1/admin/users`, {
        method: 'POST',
        headers: adminHeaders,
        body: JSON.stringify({ email, password, email_confirm: true, app_metadata: { role } })
      });
      const j = await r.json();
      if (!r.ok) { res.status(502).json({ error: j.msg || j.error_description || j.error || 'Не вдалося створити користувача' }); return; }
      res.status(200).json({ user: publicUser(j) });
      return;
    }

    // ---------- зміна ролі ----------
    if (action === 'setRole') {
      const id = String(body.id || '');
      const role = String(body.role || '');
      if (!id) { res.status(400).json({ error: 'Не вказано id' }); return; }
      if (!ROLES.includes(role)) { res.status(400).json({ error: 'Невідома роль' }); return; }
      if (id === caller.id) { res.status(400).json({ error: 'Не можна змінювати власну роль' }); return; }

      const r = await fetch(`${SB}/auth/v1/admin/users/${id}`, {
        method: 'PUT',
        headers: adminHeaders,
        body: JSON.stringify({ app_metadata: { role } })
      });
      const j = await r.json();
      if (!r.ok) { res.status(502).json({ error: j.msg || j.error || 'Не вдалося змінити роль' }); return; }
      res.status(200).json({ user: publicUser(j) });
      return;
    }

    // ---------- видалення ----------
    if (action === 'delete') {
      const id = String(body.id || '');
      if (!id) { res.status(400).json({ error: 'Не вказано id' }); return; }
      if (id === caller.id) { res.status(400).json({ error: 'Не можна видалити власний акаунт' }); return; }

      const r = await fetch(`${SB}/auth/v1/admin/users/${id}`, { method: 'DELETE', headers: adminHeaders });
      if (!r.ok) {
        const j = await r.json().catch(() => ({}));
        res.status(502).json({ error: j.msg || j.error || 'Не вдалося видалити користувача' });
        return;
      }
      res.status(200).json({ ok: true });
      return;
    }

    res.status(400).json({ error: 'Невідома дія' });
  } catch (e) {
    res.status(500).json({ error: String((e && e.message) || e) });
  }
}
