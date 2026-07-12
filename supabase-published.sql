-- Приховування товару з сайту без видалення з бази.
-- published = true  → товар видно на сайті (стан за замовчуванням)
-- published = false → товар лишається в адмінці, але на сайті його немає
alter table public.products
  add column if not exists published boolean not null default true;
