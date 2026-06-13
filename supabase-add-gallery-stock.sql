-- ============================================================
--  LUMÉ — оновлення бази: галерея фото + статус наявності
--  Запустіть один раз: Supabase → SQL Editor → New query → Run
-- ============================================================

-- кілька фотографій на товар (порядок = порядок у масиві, перший = головний)
alter table public.products add column if not exists images   text[]  default '{}';

-- статус наявності (true = в наявності)
alter table public.products add column if not exists in_stock  boolean default true;

-- одноразово перенести вже завантажене одиночне фото у масив images
update public.products
   set images = array[image_url]
 where image_url is not null
   and (images is null or array_length(images,1) is null);
