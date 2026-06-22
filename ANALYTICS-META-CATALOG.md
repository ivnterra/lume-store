# Аналитика Meta: товарный фид + события каталога

Документ для настройки GTM. Описывает, что уже сделано в коде сайта и что
осталось донастроить в GTM, чтобы поднять **Catalog match rate** (сейчас 0%).

## Контекст

- Магазин: **talvyna.com** (статичный сайт на Vercel + Supabase, без CMS).
- Pixel ID: **1504239990677358** (Talvina Pixel).
- Каталог Meta: 1 шт., 57 товаров.
- Товарный фид (динамический): **https://talvyna.com/api/feed** (XML), CSV — `…/api/feed?format=csv`.
- Контейнер GTM: **GTM-577GH9TH**.

## Корень проблемы (почему match rate был 0%)

1. **`content_ids` не совпадали с фидом.** В фиде `<g:id>` = артикул через дефис
   (`51/31` → **`51-31`**). А пиксель слал сырой артикул `51/31` (со слешем).
   Meta не находила совпадений → 0% match.
2. **ViewContent не передавал товар.** Существующий тег `FB_web_Event_View`
   шлёт `ViewContent` по таймеру (30 сек на любой странице) и **без**
   `content_ids` / `content_type`. Для каталога это не засчитывается.

## Что уже исправлено в КОДЕ сайта (готово, ждёт деплоя)

Файл `index.html`:

1. `content_ids` теперь формируется как в фиде — артикул через дефис
   (функция `skuToUrl(sku)`). Это чинит сразу `add_to_cart`, `begin_checkout`,
   `purchase`.
2. Добавлено событие **`view_content`** в `dataLayer` при открытии карточки товара.

Итог: сайт пушит в `dataLayer` корректные ecommerce-события. Каждое событие
содержит поля:

```
event:        'view_content' | 'add_to_cart' | 'begin_checkout' | 'purchase'
content_type: 'product'
content_ids:  ['51-31', ...]      // = <g:id> в фиде
contents:     [{id:'51-31', quantity:1, item_price:1099}, ...]
content_name: 'Назва товару, ...'
value:        число
currency:     'UAH'
num_items:    число
event_id:     'lume…'             // для дедупликации Pixel ↔ CAPI
```

Событие `purchase` дополнительно: `transaction_id`, `customer_name`,
`customer_phone`, `customer_email` (приходит на странице `/thanks`).

## Что нужно сделать в GTM (задача для cowork)

Для каждого ключевого события нужен тег Meta (Custom HTML `fbq('track', …)`),
который срабатывает на соответствующее **Custom Event** из dataLayer и
**передаёт `content_ids` и `content_type='product'`**.

### Нужные переменные dataLayer (Variables)
- `content_ids`  (Data Layer Variable → `content_ids`)
- `value`        (→ `value`)
- `contents`     (→ `contents`)  — опционально, но желательно
- `content_name` (→ `content_name`) — опционально
- `num_items`    (→ `num_items`) — для purchase
- `transaction_id`, `event_id` — для дедупликации/purchase

### Триггеры (Custom Event)
- `view_content`
- `add_to_cart`
- `begin_checkout` (опционально)
- `purchase`

### Теги (пример для ViewContent)
```html
<script>
  fbq('track', 'ViewContent', {
    content_type: 'product',
    content_ids: {{dlv.content_ids}},   // = ['51-31', ...]
    value: {{dlv.value}},
    currency: 'UAH'
  }, { eventID: {{Дедупликация (Браузер | Сервер)}} });
</script>
```
- Trigger: **Custom Event = `view_content`** (НЕ таймер).
- Аналогично: `AddToCart` на событие `add_to_cart`, `Purchase` на `purchase`
  (для Purchase добавить `num_items` и при наличии — серверную дорожку CAPI с
  тем же `eventID`).

### Важно
- Существующий `FB_web_Event_View` (таймер, без `content_ids`) можно оставить
  как общий сигнал, но для каталога он не работает — матчит именно новый тег с
  `content_ids`.
- Проверь так же существующие AddToCart / Purchase теги: если в них нет
  `content_ids`/`content_type=product` — добавить.
- `content_ids` ОБЯЗАН быть массивом строк-артикулов в формате фида (`51-31`),
  иначе match rate не вырастет.

## Проверка
1. GTM **Preview** → открыть карточку товара → убедиться, что событие
   `view_content` с `content_ids: ['51-31']` есть в dataLayer и тег сработал.
2. Meta **Events Manager → Test Events** → ViewContent/AddToCart/Purchase
   приходят с `content_type=product` и `content_ids`.
3. Через 1–2 дня трафика **Catalog → Events / Match rate** должен расти к 90%+.
