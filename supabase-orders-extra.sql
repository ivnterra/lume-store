-- ============================================================
--  LUMÉ — додаткові поля замовлень: місто, відділення НП, гео за IP
--  Запустіть один раз: Supabase → SQL Editor → New query → Run
-- ============================================================

alter table public.orders add column if not exists city        text;  -- місто доставки (з форми)
alter table public.orders add column if not exists np_branch   text;  -- відділення Нової Пошти (з форми)
alter table public.orders add column if not exists geo_country text;  -- країна за IP (Vercel)
alter table public.orders add column if not exists geo_region  text;  -- регіон за IP
alter table public.orders add column if not exists geo_city    text;  -- місто за IP
