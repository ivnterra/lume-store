-- Коментар/питання з форми зв'язку (необов'язкове поле).
-- Виконати в Supabase → SQL Editor.
alter table public.orders add column if not exists comment text;
