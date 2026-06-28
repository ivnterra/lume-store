-- ============================================================
--  Talvyna — лічильник переглядів товарів (унікальні за сесію/день)
--  Виконати один раз у Supabase → SQL Editor.
-- ============================================================

-- Таблиця переглядів. Один рядок = унікальна сесія, що переглянула товар у конкретний день.
create table if not exists public.product_views (
  id          bigint generated always as identity primary key,
  product_id  bigint not null,
  sku         text,
  session_id  text   not null,
  viewed_on   date   not null default ((now() at time zone 'utc')::date),
  created_at  timestamptz not null default now(),
  unique (product_id, session_id, viewed_on)   -- захист від накрутки в межах сесії/дня
);

create index if not exists product_views_day_idx on public.product_views (viewed_on);
create index if not exists product_views_prod_idx on public.product_views (product_id);

alter table public.product_views enable row level security;

-- Анонімний сайт може ЛИШЕ додавати перегляд (не читати чужі дані).
drop policy if exists "anon insert product_views" on public.product_views;
create policy "anon insert product_views"
  on public.product_views for insert to anon
  with check (true);

-- Читання — лише авторизованим (адмінка).
drop policy if exists "auth read product_views" on public.product_views;
create policy "auth read product_views"
  on public.product_views for select to authenticated
  using (true);

-- Агрегація переглядів за діапазоном дат (включно). Повертає кількість по кожному товару.
create or replace function public.product_view_stats(d_from date, d_to date)
returns table(product_id bigint, views bigint)
language sql stable as $$
  select product_id, count(*)::bigint as views
  from public.product_views
  where viewed_on >= d_from and viewed_on <= d_to
  group by product_id
$$;

grant execute on function public.product_view_stats(date, date) to authenticated;
