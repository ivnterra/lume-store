-- ============================================================
--  LUMÉ — каталог: купальники + пляжні накидки
--  Джерело: bell.in.ua (ціна ×2). Опис — повний, з розмірною
--  сіткою постачальника. Назви — авторські (унікальні).
--  Фото — у Supabase Storage (bucket product-images,
--  шляхи kup-<код>/ та nak-<код>/).
--  Резервна копія, згенерована з робочої бази (live DB).
-- ============================================================

insert into public.products
  (title, sku, category, price, old_price, badge, sizes, description, image_url, images, in_stock, sort)
values
  ('Суцільний купальник «Сафарі»', '51/31', 'Купальники', 1354, null, 'new', '{"S","M","L","XL","2XL","3XL","4XL"}', 'Модний суцільний купальні з чашечками. Колір у наявності білий, леопардовий

Розмірна сітка:
S — ОБ 80-94 см. ОГ 70-85 см.
M - ОБ 85-100 см. ОГ 75-90см
L — ОБ 90-108 см. ОГ 80-97см
XL — ОБ 85-114 см. ОГ 95-106см.
2XL — ОБ 86-126 см. ОГ 95-108 см.
3XL - ОБ 88-130 см. ОГ 95-110см.
4XL - ОБ 92-138 см. ОГ 96-116см.
5XL - ОБ 94-146 см. ОГ 98-118см.', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-51-31/1.jpg', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-51-31/1.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-51-31/2.png","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-51-31/3.jpg"}', true, 1),
  ('Купальник із завищеною талією «Венеція»', '72/56', 'Купальники', 1196, null, 'new', '{"S","M","L","XL","2XL","3XL"}', 'Модний купальник із завищеною талією. Верх виготовлений як ліфа-топа з чашечками. Низ — плавки із завищеною талією й додатковою підкладковою тканиною.
Колір: білий, чорний, зелений.

Розмірна сітка:
S — ОС 80-96 см. ОГ 70-88 см.
M- ОС 85-104 см. ОГ 75-98см
L — ОС 90-116 см. ОГ 80-108 см
XL — ОС 95-124 см. ОГ 85-114см.
2XL — ОС 100-132 см. ОГ 90-124 см.
3XL — ОС 105-136 см. ОГ 95-132см.', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-72-56/1.png', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-72-56/1.png","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-72-56/2.png","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-72-56/3.png"}', true, 2),
  ('Купальник із завищеною талією «Флоренція»', '72/58', 'Купальники', 1196, null, null, '{"S","M","L","XL"}', 'Модний купальник із завищеною талією. Верх виготовлений як ліфа-топа з чашечками. Низ — плавки із завищеною талією й додатковою підкладковою тканиною.
Колір як на фото

Розмірна сітка:
S — ОС 80-96 см. ОГ 70-88 см.
M- ОС 85-104 см. ОГ 75-98см
L — ОС 90-116 см. ОГ 80-108 см
XL — ОС 85-128 см. ОГ 90-116см.', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-72-58/1.jpg', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-72-58/1.jpg"}', true, 3),
  ('Роздільний купальник «Фієста»', '56/62', 'Купальники', 1336, null, null, '{"M","L","XL","2XL","3XL","4XL","5XL"}', 'Гарний роздільний купальник, що привертає до себе увагу чудовим фасоном і не менш чудовим забарвленням. Бюстгальтер із чашечками створює гарну форму декольте. Колір є синій із фіолетовим, зелений із жовтим, сірий
M  ОГ 75см-85см. ОС 82см.-95см.
L  ОГ 80см.-95 см ОС 85 см (105 см).
XL  ОГ 90см.-100см. ОБ 90см.-108см.
XXL ОГ 95 см-105 см. ОС 98 см.-116см.
XXXL ОГ 100 см.-108 см. ОС 105-120см.
4хл ОГ 105 см.-110 см. ОС 110-126см.
5хл ОГ 107 см.-114 см. ОС 112-132см.', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-56-62/1.png', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-56-62/1.png","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-56-62/2.png","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-56-62/3.png","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-56-62/4.jpg"}', true, 4),
  ('Роздільний купальник «Лазур»', '56/66', 'Купальники', 1016, null, null, '{"S","M","L","XL","2XL"}', 'Роздільний купальник, що звертає на себе увагу чудовим фасоном і не менш чудовим забарвленням. Бюстгальтер на зав''язках. Колір у наявності синій, чорний, зелений, блакитний. З чашечками

Розмірна сітка:
S чашка A/B ОГ 64 см-80 см. ОС 75 см-90см.
M чашка B/C ОГ 70 см-90 см. ОС 82 см.-97см.
L чашка B/D ОГ 80 см.-98 см ОБ 85 см.-103 см.
XL чашка С/D ОГ 85 см.-102см. ОС 90 см.-106см.
2XL чашка С/D ОГ 90 см.-107 см. ОС 95 см.-109см.
3XL чашка С/D ОГ 95 см.-112см. ОС 100 см.-114см.
4XL чашка С/D ОГ 100 см.-117 см. ОС 105 см.-119 см.', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-56-66/1.jpg', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-56-66/1.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-56-66/2.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-56-66/3.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-56-66/4.jpg"}', true, 5),
  ('Роздільний купальник «Бірюза»', '56/51', 'Купальники', 1074, null, null, '{"M","L","XL","2XL","3XL","4XL","5XL"}', 'Гарний роздільний купальник, що привертає увагу чудовим фасоном і не менш чудовим забарвленням. Бюстгальтер із чашечками створює гарну форму декольте. Колір у наявності чорний, бірюзовий
З  ОГ 70 см-83 см. ОС 82 см.-92см.
M  ОГ 75см-85см. ОС 82см.-95см.
L  ОГ 80см.-95 см ОС 85 см (105 см).
XL  ОГ 90см.-100см. ОБ 90см.-110см.
XXL ОГ 95 см-105 см. ОС 98 см.-118см.
XXXL ОГ 100 см.-110 см. ОС 105-125см.
4хл ОГ 105 см.-112 см. ОС 110-130 см.
5хл ОГ 107 см.-116см. ОС 112-140см.', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-56-51/1.jpg', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-56-51/1.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-56-51/2.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-56-51/3.jpg"}', true, 6),
  ('Купальник із завищеною талією «Мілан»', '72/15', 'Купальники', 936, null, null, '{"XL","2XL","3XL","4XL","5XL"}', 'Модний купальник із завищеною талією. Купальник зі щільного еластану, верх із чашечками.

Розмірна сітка:
L — ОС 88-100 см. ОГ 80-94 см
XL — ОС 90-106 см. ОГ 85-98см.
2XL — ОС 92-110 см. ОГ88-102см.
3XL  - ОС 96-114 см. ОГ 90-108 см.
4хл ОГ 105 см.-112 см. ОС 110-122см.
 5хл ОГ 107 см.-116см. ОС 112-130см.', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-72-15/1.jpg', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-72-15/1.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-72-15/2.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-72-15/3.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-72-15/4.jpg"}', true, 7),
  ('Суцільний купальник «Онікс»', '51/34', 'Купальники', 1394, null, null, '{"S","M","L","XL","2XL","3XL","4XL","5XL"}', 'Модний суцільний купальні з чашечками. Колір у наявності чорний.

Розмірна сітка:
S — ОБ 80-94 см. ОГ 70-85 см.
M - ОБ 85-100 см. ОГ 75-90см
L — ОБ 90-108 см. ОГ 80-97см
XL — ОБ 85-114 см. ОГ 95-106см.
2XL — ОБ 86-126 см. ОГ 95-108 см.
3XL - ОБ 88-130 см. ОГ 95-110см.
4XL - ОБ 92-138 см. ОГ 96-116см.
5XL - ОБ 94-146 см. ОГ 98-118см.', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-51-34/1.jpg', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-51-34/1.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-51-34/2.png"}', true, 8),
  ('Роздільний купальник «Лорена»', '79/60', 'Купальники', 996, null, null, '{"S","M"}', 'Роздільний купальник, що звертає на себе увагу чудовим фасоном і не менш чудовим забарвленням. Бюстгальтер із чашечками створює гарну форму декольте. Колір у наявності чорний, синій, червоний. Купальник ззаду на зав''язках.

Розмірна сітка:
S чашка  ОГ 64 см-86 см. ОС 75 см-102см.
M чашка  ОГ 70 см-92 см. ОС 82 см.-108см.
L чашка  ОГ 80 см.-102 см ОБ 85 см.-116см.
XL чашка  ОГ 85 см.-110 см. ОС 90 см.-124см.', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-79-60/1.png', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-79-60/1.png","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-79-60/2.png","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-79-60/3.png","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-79-60/4.jpg"}', true, 9),
  ('Суцільний купальник з утяжкою «Корал»', '50/49', 'Купальники', 1156, null, null, '{"M","L","XL","2XL","3XL","4XL","5XL"}', 'Суцільний купальник з утяжкою та вкладками.
Виготовлений із якісного швидковисихного еластану. Колір у наявності зелений, рожевий, жовтогарячий, синій.

Розмірна сітка:
М  ОГ 80 см.-92 см ОС 83 см.-100см.
L  ОГ 80см.-95 см ОС 85 см (105 см).
XL  ОГ 90см.-100см. ОБ 90см.-110см.
XXL ОГ 95 см-105 см. ОС 98 см.-118см.
XXXL ОГ 100 см.-110 см. ОС 105-125см.
4хл ОГ 105 см.-112 см. ОС 110-130 см.
5хл ОГ 107 см.-116см. ОС 112-140см.', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-50-49/1.png', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-50-49/1.png","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-50-49/2.png","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-50-49/3.png","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-50-49/4.png"}', true, 10),
  ('Купальник з утяжкою «Дюна»', '51/37', 'Купальники', 1156, null, null, '{"S","M","L","XL","2XL"}', 'Модний суцільний купальні з чашечками. Колір у наявності чорний, хакі, леопард, рожевий.  Купальник з ефектом утягування.

Розмірна сітка:
S — ОС 80-90 см. ОГ 70-85см.
M- ОС 85-96 см. ОГ 75-90см
L — ОС 90-102 см. ОГ 80-97см
XL — ОС 85-112 см. ОГ 95-106см.
2XL — ОС 86-122 см. ОГ 95-108см.', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-51-37/1.jpg', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-51-37/1.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-51-37/2.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-51-37/3.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-51-37/4.jpg"}', true, 11),
  ('Суцільний купальник із парео «Тропікана»', '51/41', 'Купальники', 1296, null, null, '{"XL","2XL","3XL","4XL","5XL"}', 'Модний суцільний купальні з чашечками та парою. Колір у наявності чорний, зелений,леопард.синій

Розмірна сітка:
XL - ОБ 88-116см. ОГ 95-106см.
2XL - ОБ 92-126см. ОГ 95-108см.
3XL - ОБ 98-132см. ОГ 95-110см.
4XL - ОБ 102-138см. ОГ 96-116см.
5XL - ОБ 110-146см. ОГ 98-118см.', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-51-41/1.png', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-51-41/1.png","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-51-41/2.png","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-51-41/3.png","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-51-41/4.png"}', true, 12),
  ('Роздільний купальник «Аметист»', '56/57', 'Купальники', 1198, null, null, '{"S","M","L","XL","2XL","3XL"}', 'Гарний роздільний купальник, що привертає до себе увагу чудовим фасоном і не менш чудовим забарвленням. Бюстгальтер із чашечками створює гарну форму декольте. Колір у наявності бірюзовий, бордо, чорний,фіолетовий.
С  ОГ 70 см-83см. ОБ 82см.-92см.
M  ОГ 75см-85см. ОБ 82см.-96см.
L  ОГ 80см.-95 см ОБ 85 см-108 см.
XL  ОГ 90см.-100см. ОБ 90см.-112см.
XXL ОГ 95 см-105 см. ОБ 98 см.-122см.
XXXL ОГ 100 см.-112см. ОБ 105-132см.', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-56-57/1.jpg', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-56-57/1.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-56-57/2.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-56-57/3.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-56-57/4.jpg"}', true, 13),
  ('Роздільний купальник «Мандарин»', '55/26', 'Купальники', 1156, null, null, '{"S","M","L","XL","2XL","3XL"}', 'Гарний роздільний модний купальник, що привертає увагу чудовим фасоном і не менш чудовим забарвленням. Бюстгальтер із чашечками створює гарну форму декольте.
Колір: чорний, бірюзовий, оранжевий
Бюстгальтер на завязках. Купальник виготовлений із високоякісного еластану, стійкого до хлору.

Розмірна сітка:
S чашка A/B ОГ 64 см-82 см. ОС 75см-94см.
M чашка B/C ОГ 70 см-90 см. ОС 82 см.-98см.
L чашка B/С ОГ 80 см.-96 см ОБ 85 см.-108 см.
XL чашка С/D ОГ 85 см.-102см. ОС 90 см.-114см.
XXL чашка С/D ОГ 90 см-108 см ОБ 95 см. - 120см.
3ХL чашка С/D  ОГ 92 см-114 см ОС 96 см. - 126см.', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-55-26/1.jpg', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-55-26/1.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-55-26/2.png","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-55-26/3.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-55-26/4.jpg"}', true, 14),
  ('Роздільний купальник «Соланж»', '79/58', 'Купальники', 978, null, null, '{"S","M","L","XL"}', 'Роздільний купальник, що звертає на себе увагу чудовим фасоном і не менш чудовим забарвленням. Бюстгальтер із чашечками створює гарну форму декольте. Колір у наявності чорний, синій, калійний.

Розмірна сітка:
S чашка  ОГ 64 см — 86 см. ОС 75 см — 96 см.
M чашка  ОГ 70 см-92 см. ОС 82 см.-102см.
L чашка  ОГ 80 см.-102 см ОБ 85 см.-112см.
XL чашка  ОГ 85 см.-110 см. ОС 90 см.-122см.', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-79-58/1.png', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-79-58/1.png","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-79-58/2.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-79-58/3.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-79-58/4.jpg"}', true, 15),
  ('Суцільний купальник «Сахара»', '50/98', 'Купальники', 1252, null, null, '{"S","M","L","XL","2XL"}', 'Модний купальник. Колір леопард. З твердим вшитим паралоном. За рахунок спеціального крою купальник відмінно стягує живіт.

Розмірна сітка:
С ОГ 70см-85см. ПРО 80см.-95см.
M ОГ 75см-85см. ПРО 82см.-97см.
L ОГ 80см.-95см ПРО 85см.-102см.
XL ОГ 90см.-100см. ПРО 90см.-108см.
2ХЛ ОГ 94см.-104см. ПРО 93см.-116см.', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-50-98/1.jpg', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-50-98/1.jpg"}', true, 16),
  ('Суцільний купальник «Магнолія»', '51/28', 'Купальники', 998, null, null, '{"S","M","L","XL"}', 'Модний купальник із чашечками.
Виконаний із якісного швидковисихного еластану. Колір у наявності синій, кавовий, червоний.

Розмірна сітка:
З  ОГ 74см-90см. ОС 82см.-98см.
M  ОГ 76 см-96 см. ОС 84 см.-104см.
L  ОГ 80 см.-100 см ОБ 85 см.-112см.
XL  ОГ 90 см.-108 см. ОС 90 см.-124см.', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-51-28/1.png', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-51-28/1.png","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-51-28/2.png","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-51-28/3.jpg"}', true, 17),
  ('Купальник із завищеною талією «Касабланка»', '72/59', 'Купальники', 1196, null, null, '{"S","M","L","XL","2XL"}', 'Модний купальник із завищеною талією. Купальник зі щільного еластану стійкого до хлору. Верх виготовлений як ліфа на замочку. Колір у наявності чорний, леопард, хакі, рожевий.

Розмірна сітка:
S — ОС 80-90 см. ОГ 70-85см.
M- ОС 85-96 см. ОГ 75-90см
L — ОС 88-102 см. ОГ 78-97см
XL — ОС 90-110 см. ОГ 82-104 см.
2XL — ОС 94-118 см. ОГ 86-108см.', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-72-59/1.jpg', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-72-59/1.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-72-59/2.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-72-59/3.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-72-59/4.png"}', true, 18),
  ('Суцільний купальник «Перлина»', '50/95', 'Купальники', 1292, null, null, '{"XL","2XL","3XL","4XL"}', 'Купальник з чашкою.
Виконаний з якісного швидковисихаючого еластану.

Розмірна сітка:
XL ОГ 90см.-100см. ПРО 90см.-110см.
XXL ОГ 95см-105см. ПРО 98см.-118см.
3XL ОГ 100см.-110см. ПРО 105-125см.
4XL ОГ 105см.-112см. ПРО 110-130см.', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-50-95/1.jpg', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-50-95/1.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-50-95/2.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-50-95/3.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-50-95/4.jpg"}', true, 19),
  ('Купальник із завищеною талією «Монте-Карло»', '72/47', 'Купальники', 1156, null, null, '{"S","M","L","XL"}', 'Модний купальник із завищеною талією. Верх виготовлений як ліфа-топа з чашечками. Низ - плавки із завищеною талією й додатковою підкладковою тканиною.
Колір: білий, чорний.

Розмірна сітка:
S -ПРО 80-96 см. ОГ 70-88см.
M- ПРО 85-104 см. ОГ 75-98см
L -ПРО 90-116 см. ОГ 80-108 см
XL -ПРО 85-128 см. ОГ 90-116см.', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-72-47/1.jpg', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-72-47/1.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-72-47/2.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-72-47/3.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-72-47/4.jpg"}', true, 20),
  ('Суцільний купальник із пуш-ап «Карнавал»', '50/65', 'Купальники', 1078, null, null, '{"S","M","L","XL","2XL","3XL","4XL","5XL"}', 'Купальник з пушап!
Виконаний з якісного швидковисихаючого еластану. Колір в наявності чорний, червоний, блакитний, синій (електрик), зелений, горошок.

Розмірна сітка:
С ОГ 70см-83см. ПРО 82см.-92см.
M ОГ 75см-85см. ПРО 82см.-95см.
L ОГ 80см.-95см ПРО 85см.-105см.
XL ОГ 90см.-100см. ПРО 90см.-110см.
XXL ОГ 95см-105см. ПРО 98см.-118см.
XXXL ОГ 100см.-110см. ПРО 105-125см.
4хл ОГ 105см.-112см. ПРО 110-130см.
5хл ОГ 107см.-116см. ПРО 112-140см.', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-50-65/1.jpg', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-50-65/1.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-50-65/2.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-50-65/3.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-50-65/4.jpg"}', true, 21),
  ('Роздільний купальник зі спідничкою «Фламенко»', '56/59', 'Купальники', 1336, null, null, '{"S","M","L","XL","2XL","3XL"}', 'Модний купальник із завищеною талією. Якісний купальник зі щільної тканини, верх виготовлений у формі ліфа з твердим пушапом на замочку. Низ у формі плавок із спідничкою  Колір є жовтим, синім, бірюзовий, малиновим.

Розмірна сітка:
S — ОС 80-94 см. ОГ 70-86см.
M- ОС 85-98см. ОГ 75-90см
L — ОС 90-102 см. ОГ 80-97 см
XL — ОС 85-112 см. ОГ 95-106см.
2XL — ОС 86-122 см. ОГ 95-110см.
3XL  - ОС 88-126 см. ОГ 95-114см.', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-56-59/1.jpg', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-56-59/1.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-56-59/2.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-56-59/3.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-56-59/4.jpg"}', true, 22),
  ('Роздільний купальник «Лагуна»', '72/65', 'Купальники', 1296, null, null, '{"M","L","XL","2XL","3XL","4XL","5XL"}', 'Роздільний купальник з чашечками.
Колір у наявності :зелений та блакитний..
Комплектація: ліф, плавки шортиками.

Розмірна сітка:
M  ОГ 75см-85см. ОС 82см.-95см.
L  ОГ 80см.-95 см ОС 85 см -105 см
XL  ОГ 90см.-100см. ОБ 90см.-110см.
XXL ОГ 95 см-105 см. ОС 98 см.-118см.
XXXL ОГ 100 см.-110 см. ОС 105-125см.
4хл ОГ 105 см.-112 см. ОС 110-128 см.
5хл ОГ 107 см.-116см. ОС 112-134см.', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-72-65/1.jpg', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-72-65/1.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-72-65/2.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-72-65/3.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-72-65/4.jpg"}', true, 23),
  ('Суцільний купальник з утяжкою «Сапфір»', '51/18', 'Купальники', 1216, null, null, '{"M","L","XL","2XL"}', 'Модний купальник з вкладками.
Виконаний із якісного швидковисихного еластану. Колір у наявності синій, чорний,бордо, зелений
У купальнику є чашечки.

Розмірна сітка:
M  ОГ 75см-90см. ОС 82см.-98см.
L  ОГ 80 см.-100 см ОБ 85 см.-108см.
XL  ОГ 90 см.-108 см. ОС 90 см.-118см.
XXL ОГ 95 см-116 см. ОС 98 см.-128 см', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-51-18/1.jpg', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-51-18/1.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-51-18/2.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-51-18/3.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-51-18/4.png"}', true, 24),
  ('Роздільний купальник «Гранат»', '56/56', 'Купальники', 1196, null, null, '{"S","M","L","XL","2XL"}', 'Роздільний купальник із палітурками. привертає увагу чудовим фасоном і не менш чудовим забарвленням. Бюстгальтер профільований на твердому пушапі, створює гарну форму декольте. Ззаду бюстгальтер на зав''язках. Колір у наявності чорний,бордо, синій

Розмірна сітка:
S чашка A/B ОГ 64 см-80 см. ОС 75 см-90 см.
M чашка B/C ОГ 70 см-90 см. ОС 82 см.-97см.
L чашка B/D ОГ 80 см.-98 см ОБ 85 см.-103 см.
XL чашка С/D ОГ 85 см.-105 см. ОС 90 см.-110 см.
XXЛ чашка С/D ОГ 90-107 см, ОС 95-114 см.', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-56-56/1.jpg', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-56-56/1.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-56-56/2.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-56-56/3.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-56-56/4.jpg"}', true, 25),
  ('Купальник з утяжкою «Глорія»', '51/44', 'Купальники', 1278, null, null, '{"S","M","L","XL","2XL"}', 'Модний купальник з утяжкою. Прекрасно приховує зайвий животик завдяки спеціальному крою! Бретельки з регулюванням.
Виконаний із якісного швидковисихного еластану.
Колір у наявності чорний, синій, червоний, чорний у горох, леопард, голубий.
У купальнику є вкладки.

Розмірна сітка:
З  ОГ 75см-85см. ОС 82см.-95см.
M ОГ 78см-87см. ОС 86 см.-98см.
L  ОГ 84 см.-95 см ОБ 88 см.-105см.
XL  ОГ 90см.-100см. ОБ 90см.-110см.
XXL ОГ 95 см-109 см. ОС 98 см.-120 см', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-51-44/1.jpg', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-51-44/1.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-51-44/2.png","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-51-44/3.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-51-44/4.jpg"}', true, 26),
  ('Роздільний купальник «Фуксія»', '79/56', 'Купальники', 1024, null, null, '{"S","M","L","XL"}', 'Гарний роздільний модний купальник, що привертає увагу чудовим фасоном і не менш чудовим забарвленням. Бюстгальтер із чашечками створює гарну форму декольте.
Колір: рожевий, чорний.
Бюстгальтер на завязках. Купальник виготовлений із високоякісного матеріалу, стійкого до хлору.

Розмірна сітка:
S чашка  ОГ 64 см-84 см. ОС 75см-104см
M чашка  ОГ 70см-96см. ОС 85см.-108см.
L чашка  ОГ 80см.-106 см ОБ 88 см.-118см.
ХL чашка  ОГ 80см.-110см ОБ 88см.-124см.', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-79-56/1.jpg', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-79-56/1.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-79-56/2.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-79-56/3.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-79-56/4.jpg"}', true, 27),
  ('Роздільний купальник із пуш-ап «Ріо»', '56/50', 'Купальники', 996, null, null, '{"S","M","L","XL","2XL"}', 'Роздільний брендовий купальник з якісного швидковисихаючого еластану. Колір чорний, бордо,білий,темно-зелений,синій,червоний. Купальник з пушапом.

Розмірна сітка:
S - ПРО 78-90см. ОГ 70-86см.
M - ПРО 82-94см. ОГ 75-90см
L - ПРО 87-100см. ОГ 80-95см
XL-ПРО 90-108см. ОГ 90-100см.
2XL-ПРО 95-115см. ОГ 92-106см.', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-56-50/1.jpg', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-56-50/1.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-56-50/2.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-56-50/3.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-56-50/4.jpg"}', true, 28),
  ('Роздільний купальник із пуш-ап «Віва»', '56/68', 'Купальники', 1216, null, null, '{"S","M","L","XL"}', 'Модний купальник із твердим пушапом. Якісний купальник зі щільної тканини, верх виготовлений у формі ліфа з твердим пушапом на зав''язці.  Колір у наявності синій, зелений, рожевий.

Розмірна сітка:
S — ОС 80-96 см. ОГ 70-88см.
M- ОС 85-104 см. ОГ 75-94см
L — ОС 90-116 см. ОГ 80-102 см
XL — ОС 96-132 см. ОГ 95-114см.', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-56-68/1.jpg', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-56-68/1.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-56-68/2.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-56-68/3.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-56-68/4.jpg"}', true, 29),
  ('Купальник із завищеною талією «Севілья»', '72/46', 'Купальники', 1052, null, null, '{"XL","2XL","3XL","4XL","5XL"}', 'Модний купальник із завищеною талією. Купальник із щільного еластану, верх з чашками.

Розмірна сітка:
XL - ПРО 90-106см. ОГ 85-98см.
2XL - ПРО 92-110см. ОГ88-102см.
3XL - ПРО 96-114см. ОГ 90-108см.
4хл ОГ 105см.-112см. ПРО 110-122см.
 5хл ОГ 107см.-116см. ОБ 112-130см.', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-72-46/1.png', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-72-46/1.png","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-72-46/2.png","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-72-46/3.png"}', true, 30),
  ('Суцільний купальник «Марина»', '50/42', 'Купальники', 1112, null, null, '{"M","L","XL","2XL","3XL","4XL","5XL","6XL"}', 'Суцільний купальник із вкладками.
Виконаний із якісного швидковисихного еластану. Ззаду на гачку. Колір чорний, блакитний.

Розмірна сітка:
M  ОГ 75см-85см. ОС 82см.-95см.
L  ОГ 80см.-95 см ОС 85 см (105 см).
XL  ОГ 90см.-100см. ОБ 90см.-110см.
XXL ОГ 95 см-105 см. ОС 98 см.-118см.
XXXL ОГ 100 см.-110 см. ОС 105-125см.
4хл ОГ 105 см.-112 см. ОС 110-130 см.
5хл ОГ 107 см.-116см. ОС 112-140см.
6ХЛ  ОГ 109 см.-120 см. ОС 115-145 см', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-50-42/1.jpg', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-50-42/1.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-50-42/2.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-50-42/3.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-50-42/4.jpg"}', true, 31),
  ('Купальник з утяжкою «Грація»', '50/18', 'Купальники', 1096, null, null, '{"M","L","XL","2XL","3XL","4XL"}', 'Модний купальник з утяжкою. Прекрасно приховує зайвий животик завдяки спеціальному крою купальника!
Виконаний із якісного швидковисихного еластану. Колір у наявності чорний, у горох,блакитний.
У купальнику є вкладки.

Розмірна сітка:
M  ОГ 75см-85см. ОС 82см.-95см.
L  ОГ 80см.-95 см ОС 85 см (105 см).
XL  ОГ 90см.-100см. ОБ 90см.-110см.
XXL ОГ 95 см-105 см. ОС 98 см.-115см.
XXXL ОГ 100 см.-110 см. ОС 105 см-125см.
4ХL   ОГ 105 см.-112см. ОС 110см-130 см', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-50-18/1.jpg', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-50-18/1.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-50-18/2.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-50-18/3.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-50-18/4.jpg"}', true, 32),
  ('Роздільний купальник «Орхідея»', '56/63', 'Купальники', 1216, null, null, '{"S","M","L","XL","2XL"}', 'Роздільний купальник із палітурками. привертає увагу чудовим фасоном і не менш чудовим забарвленням. Бюстгальтер профільований на твердому пушапі, створює гарну форму декольте. Ззаду бюстгальтер на зав''язках. Колір у наявності синій,бордо, фіолетовий

Розмірна сітка:
S чашка A/B ОГ 64 см-80 см. ОС 75 см-90 см.
M чашка B/C ОГ 70 см-90 см. ОС 82 см.-97см.
L чашка B/D ОГ 80 см.-98 см ОБ 85 см.-103 см.
XL чашка С/D ОГ 85 см.-105 см. ОС 90 см.-110 см.
ХХЛ чашка С/D ОГ 90-107 см, ОС 95-114 см.', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-56-63/1.jpg', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-56-63/1.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-56-63/2.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-56-63/3.jpg"}', true, 33),
  ('Роздільний купальник «Камелія»', '56/52', 'Купальники', 1074, null, null, '{"S","M","L","XL","2XL","3XL","4XL","5XL"}', 'Красивий роздільний купальник, що привертає увагу чудовим фасоном і не менш чудовим забарвленням. Бюстгальтер із чашечками, створює гарну форму декольте. Колір у наявності як на фото.
З ОГ 70см-83см. ПРО 82см.-92см.
M ОГ 75см-85см. ПРО 82см.-95см.
L ОГ 80см.-95см ПРО 85см.-105см.
XL ОГ 90см.-100см. ПРО 90см.-110см.
XXL ОГ 95см-105см. ПРО 98см.-118см.
XXXL ОГ 100см.-110см. ПРО 105-125см.
4хл ОГ 105см.-112см. ПРО 110-130см.
5хл ОГ 107см.-116см. ПРО 112-140см.', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-56-52/1.jpg', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-56-52/1.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-56-52/2.jpg"}', true, 34),
  ('Роздільний купальник «Аквамарин»', '56/70', 'Купальники', 1198, null, null, '{"S","M","L","XL"}', 'Роздільний купальник із палітурками. привертає увагу чудовим фасоном і не менш чудовим забарвленням. Бюстгальтер із чашечками створює гарну форму декольте. Ззаду та на шиї бюстгальтер на зав''язках. Колір у наявності білий, бірюзовий.

Розмірна сітка:
S чашка A/B ОГ 64 см-80 см. ОС 75 см-92 см.
M чашка B/C ОГ 70см-90см. ОБ 82см.-100см.
L чашка B/D ОГ 80 см.-100 см ОБ 85 см.-108 см.
XL чашка С/D ОГ 85 см.-108 см. ОС 90 см.-120 см.', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-56-70/1.jpg', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-56-70/1.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-56-70/2.jpg"}', true, 35),
  ('Купальник із завищеною талією «Барселона»', '72/60', 'Купальники', 1076, null, null, '{"S","M","L","XL","2XL"}', 'Модний купальник із завищеною талією. Купальник зі щільного еластану стійкого до хлору. Верх виготовлений як ліфа топом на зав''язці. Колір у наявності чорний, червоний, хакі.

Розмірна сітка:
S — ОС 80-90 см. ОГ 70-85см.
M- ОС 85-96 см. ОГ 75-90см
L — ОС 88-102 см. ОГ 78-97см
XL — ОС 90-110 см. ОГ 82-104 см.
2XL — ОС 94-122 см. ОГ 86-108см.', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-72-60/1.jpg', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-72-60/1.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-72-60/2.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-72-60/3.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-72-60/4.jpg"}', true, 36),
  ('Суцільний купальник у горох «Ретро»', '50/10', 'Купальники', 730, null, null, '{"S","M","L","XL","2XL","3XL","4XL"}', 'Суцільний модний купальник із м''якого, приємного до тіла еластану. Купальник регулюється зав''язками під грудьми та через шию. Колір: чорний у горох. У купальнику є вкладки.

Розмірна сітка:
З   ОС 80 см.-92см.
M   ОС 82 см.-96см.
L    ОС 85 см.-105см.
XL  ОБ 90см.-110см.
2ХЛ ОС 95см.-114см.
3ХЛ ОБ 96 см.-128см.
4ХЛ ОС 99 см.-133см.', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-50-10/1.jpg', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-50-10/1.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-50-10/2.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-50-10/3.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-50-10/4.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-50-10/5.jpg"}', true, 37),
  ('Суцільний купальник «Діана»', '50/30', 'Купальники', 1152, null, null, '{"S","M","L","XL"}', 'Модний купальник. Прекрасно приховує зайвий животик завдяки спеціальному крою! Є знімні бретельки.
Виготовлений із якісного швидковисихного еластану. Колір у наявності чорний, блідо-рожевий, жовтий, малиновий.
У купальнику є вкладки.

Розмірна сітка:
З  ОГ 70см.-80см. ОБ 80см.-90см.
M  ОГ 75см-85см. ОС 82см.-95см.
L  ОГ 80см.-95 см ОС 85 см (105 см).
XL  ОГ 90см.-100см. ОБ 90см.-110см.', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-50-30/1.png', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-50-30/1.png","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-50-30/2.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-50-30/3.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-50-30/4.png","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-50-30/5.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-50-30/6.png","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/kup-50-30/7.png"}', true, 38),
  ('Пляжна накидка-максі «Мальдіви»', '13/10', 'Пляжні накидки', 1050, null, null, '{"S-M","L-XL","2XL-3XL"}', 'Пляжна накидка. Колір чорний, білий, зелений. Довжина по спинці 130 см.

Розмірна сітка:
С-M- ОС 85-90см. ОГ 75-90см
Л-ХЛ — ОС 95-110 см. ОГ 85-100 см
2ХЛ-3хл ОБ 102-118см. ОГ 95-108см.', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-10/1.png', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-10/1.png","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-10/2.png","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-10/3.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-10/4.jpg"}', true, 39),
  ('Пляжна накидка «Санторіні»', '13/11', 'Пляжні накидки', 1076, null, null, '{"Універсальний"}', 'Пляжна накидка. Колір чорний, білий,зелений, блакитний. Довжина по спинці 95 см. Розмір універсальний. Ширина по коміру 46 см, ширина по подолу 145 см.', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-11/1.png', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-11/1.png","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-11/2.png","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-11/3.png","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-11/4.png","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-11/5.jpg"}', true, 40),
  ('Пляжна накидка з бавовни «Капрі»', '13/12', 'Пляжні накидки', 992, null, null, '{"Універсальний"}', 'Модна пляжна накидка. Колір: чорний, білий, пісочний. Довжина накидки 90 см., ширина полотна на розтягнення 125 см. Розмір універсальний. Матеріал бавовна.', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-12/1.jpg', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-12/1.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-12/2.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-12/3.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-12/4.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-12/5.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-12/6.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-12/7.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-12/8.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-12/9.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-12/10.jpg"}', true, 41),
  ('Пляжна накидка «Монако»', '13/14', 'Пляжні накидки', 916, null, null, '{"S-M","L-XL","2XL-3XL"}', 'Модна пляжна накидка. Колір: чорний, білий. Довжина накидки 90 см.

Розмірна сітка:
С-M- ОС 85-90см. ОГ 75-90см
Л-ХЛ — ОС 95-110 см. ОГ 85-100 см
2ХЛ-3хл ОБ 105-120см. ОГ 95-110см.', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-14/1.png', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-14/1.png","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-14/2.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-14/3.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-14/4.png"}', true, 42),
  ('Пляжна накидка «Ібіца»', '13/15', 'Пляжні накидки', 832, null, null, '{"Універсальний"}', 'Модна пляжна накидка. Колір: рожевий, синій,бордо, чорний, зелений, білий, фіолетовий. Довжина накидки 80 см. Ширина по плечах приблизно 80 см. Розмір універсальний.', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-15/1.jpg', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-15/1.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-15/2.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-15/3.png","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-15/4.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-15/5.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-15/6.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-15/7.jpg"}', true, 43),
  ('Пляжна накидка «Рів’єра»', '13/16', 'Пляжні накидки', 550, null, null, '{"S","M","L","XL","2XL"}', 'Модна пляжна накидка. Колір: чорний, білий. Довжина накидки 100 см.
Розмірна сітка
S — ОС 80-85 см. ОГ 70-85см.
M- ОС 85-90 см. ОГ 75-95см
L — ОС 90-100 см. ОГ 80-95 см
XL — ОС 95-110 см. ОГ 85-105см.
XXL- ОС 100-125 см. ОГ 95-15см.', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-16/1.jpg', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-16/1.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-16/2.png","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-16/3.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-16/4.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-16/5.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-16/6.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-16/7.jpg"}', true, 44),
  ('Мереживна пляжна накидка «Ажур» (S–6XL)', '13/17', 'Пляжні накидки', 590, null, null, '{"S","M","L","XL","2XL","3XL","4XL","5XL","6XL"}', 'Модна пляжна накидка. Довжина 90 см. Колір чорний. Матеріал спандекс, мереживо.

Розмірна сітка:
S — ОС 80-85 см. ОГ 70-85см.
M- ОС 85-90 см. ОГ 75-90см
L — ОС 90-105 см. ОГ 80-95 см
ХЛ — ОС 95-110 см. ОГ 85-100 см
XXЛ  ОС 100-115 см. ОГ 90-105см.
3хл ОС 105-120 см. ОГ 95-110см.
4хл ОБ 110 см — 130 см ОГ 100-117 см.
5хл ОБ 115 см — 140 см ОГ 105-125 см.
6хл ОБ 120 см — 455 см ОГ 115-130 см.', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-17/1.jpg', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-17/1.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-17/2.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-17/3.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-17/4.jpg"}', true, 45),
  ('Пляжне парео «Бора-Бора»', '13/18', 'Пляжні накидки', 590, null, null, '{"Універсальний"}', 'Пляжне парео. Колір чорний, білий, жовтий, червоний, зелений. Довжина 90 см. Розмір один універсальний. Тягнуться від 58 см до 100 см. в обхваті. Комплектація: низ.', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-18/1.jpg', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-18/1.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-18/2.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-18/3.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-18/4.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-18/5.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-18/6.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-18/7.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-18/8.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-18/9.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-18/10.jpg"}', true, 46),
  ('Мереживна пляжна накидка «Спокуса»', '13/20', 'Пляжні накидки', 472, null, null, '{"S-M","L-XL","2XL-3XL"}', 'Шикарна пляжна накидка! Матеріал бавовна, мереживо. Легке та сексуальне! Мереживо дуже приємне до тіла. Прекрасно підійде для фотосесій і пляжу! Колір чорний, білий. Довжина виробу від плеча 105 см. У лоті є фотоживо.
Розмірна сітка
С-М- ОС 90-95см. ОГ 80-90см
Л-ХЛ- ОС 100-120 см. ОГ 95-110см.
2-3ХЛ- ОС 110-130 см. ОГ 100-20 см.', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-20/1.jpg', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-20/1.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-20/2.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-20/3.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-20/4.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-20/5.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-20/6.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-20/7.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-20/8.jpg"}', true, 47),
  ('Пляжна накидка «Міконос»', '13/21', 'Пляжні накидки', 770, null, null, '{"Універсальний"}', 'Пляжна накидка. Матеріал: бавовна. Колір чорний, білий, синій, блакитний, червоний, блідо-рожевий, коричневий, зелений. Довжина по спинці 75 см. Розмір універсальний.', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-21/1.jpg', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-21/1.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-21/2.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-21/3.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-21/4.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-21/5.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-21/6.png","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-21/7.png","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-21/8.png","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-21/9.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-21/10.jpg"}', true, 48),
  ('Пляжна накидка «Веселка»', '13/22', 'Пляжні накидки', 876, null, null, '{"Універсальний"}', 'Модна пляжна накидка. Колір: чорний, червоний, білий, жовтий,  бірюзовий, синій, бордовий,бежевий, блакитний, рожевий.
Довжина накидки 85 см., ширина полотна 70 см. Розмір універсальний.', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-22/1.png', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-22/1.png","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-22/2.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-22/3.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-22/4.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-22/5.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-22/6.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-22/7.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-22/8.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-22/9.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-22/10.jpg"}', true, 49),
  ('Пляжна накидка-максі «Балі»', '13/23', 'Пляжні накидки', 1170, null, null, '{"Універсальний"}', 'Шикарна пляжна накидка. Колір у наявності: чорний, синій, жовтий, рожевий, червоний, піксочний. Довжина накидки 135 см.', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-23/1.jpg', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-23/1.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-23/2.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-23/3.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-23/4.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-23/5.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-23/6.jpg"}', true, 50),
  ('Пляжна накидка-максі «Кіпр»', '13/24', 'Пляжні накидки', 1036, null, null, '{"Універсальний"}', 'Шикарна пляжна накидка. Колір у наявності: чорний, білий. Довжина накидки 135 см.', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-24/1.jpg', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-24/1.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-24/2.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-24/3.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-24/4.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-24/5.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-24/6.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-24/7.jpg"}', true, 51),
  ('Мереживне пляжне плаття «Афродіта»', '13/27', 'Пляжні накидки', 370, null, null, '{"S","M","L","XL","2XL"}', 'Мереживне плаття!
Шикарне мереживне плаття! Матеріал бавовна, мереживо. Легке та сексуальне! Мереживо дуже приємне до тіла. Прекрасно підійде для фотосесій! Колір чорний, білий. Довжина виробу від плеча 105 см. У лоті є фотоживо.
Розмірна сітка
S — ОС 80-85 см. ОГ 70-80см.
M- ОС 85-90 см. ОГ 75-85см
L — ОС 90-95 см. ОГ 80-90 см
XL — ОС 95-100 см. ОГ 85-95см.
XXL- ОС 100-115 см. ОГ 95-105см.', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-27/1.jpg', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-27/1.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-27/2.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-27/3.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-27/4.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-27/5.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-27/6.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-27/7.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-27/8.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-27/9.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-27/10.jpg"}', true, 52),
  ('Пляжна накидка з камінцями «Кристал»', '13/28', 'Пляжні накидки', 970, null, null, '{"Універсальний"}', 'Шикарна пляжна накидка з камінчиками.  Легке та сексуальне. Прекрасно підійде для фотосесій і пляжу. Колір чорний, білий. Довжина виробу від плеча 85 см. Розмір один універсальний. Тягаються в стегнах до 125 см.', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-28/1.png', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-28/1.png","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-28/2.jpg"}', true, 53),
  ('Пляжна накидка-парео «Клеопатра»', '13/29', 'Пляжні накидки', 876, null, null, '{"Універсальний"}', 'Шикарна пляжна накидка. Колір у наявності: чорний без рукавів, білий без рукавів, салатовий із 1/4 рукава, червоний без рукавів, синій із рукавами, жовтогарячий без рукавів, малиновий без рукавів. Довжина накидки 140 см. Розмір один універсальний з-хл. Комплектація: парео, пояс.', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-29/1.jpg', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-29/1.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-29/2.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-29/3.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-29/4.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-29/5.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-29/6.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-29/7.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-29/8.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-29/9.png","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-29/10.jpg"}', true, 54),
  ('Пляжна накидка «Сейшели» (S–7XL)', '13/31', 'Пляжні накидки', 798, null, null, '{"S-M","L-XL","2XL-3XL","4XL-5XL","6XL-7XL"}', 'Модна пляжна накидка. Колір: чорний, білий, блакитний, малиновий, червоний, зелений. Довжина накидки 90 см.
Тканина: бавовна

Розмірна сітка:
С-M- ОС 85-90см. ОГ 75-90см
Л-ХЛ — ОС 95-110 см. ОГ 85-100 см
2ХЛ-3хл ОБ 102-118см. ОГ 95-108см.
4ХЛ-5хл ОС 106-126см. ОГ 95-112см.
6ХЛ-7хл ПРО 108-132см. ОГ 95-116см.', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-31/1.jpg', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-31/1.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-31/2.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-31/3.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-31/4.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-31/5.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-31/6.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-31/7.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-31/8.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-31/9.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-31/10.jpg"}', true, 55),
  ('Пляжна накидка-максі «Мадейра»', '13/32', 'Пляжні накидки', 1052, null, null, '{"Універсальний"}', 'Шикарна пляжна накидка. Довжина накидки 126см. Розмір один універсальний С - ХЛ. Матеріал хлопок. Колір чорний, синій, білий.', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-32/1.jpg', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-32/1.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-32/2.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-32/3.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-32/4.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-32/5.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-32/6.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-32/7.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-32/8.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-32/9.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-32/10.jpg"}', true, 56),
  ('Пляжна туніка-сорочка «Греція»', '13/33', 'Пляжні накидки', 1316, null, null, '{"Універсальний"}', 'Ця стильна пляжна туніка-сорочка створена для комфортного та ефектного відпочинку на узбережжі. Вона поєднує в собі елементи класичного літнього гардероба та сміливий сучасний дизайн.
Матеріал: легка, еластична велика сітка (поліестер), що швидко сохне та забезпечує максимальну вентиляцію у спеку.
Ця модель є в єдиному універсальному розмірі M-4XL
Довжина 90см , ширина 100см
Колір в наявності : білий.', 'https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-33/1.jpg', '{"https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-33/1.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-33/2.png","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-33/3.png","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-33/4.jpg","https://gwzywunqffubbmscmgam.supabase.co/storage/v1/object/public/product-images/nak-13-33/5.jpg"}', true, 57);
