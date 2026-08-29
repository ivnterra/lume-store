#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Синхронізація аварійного знімка каталогу з Supabase.

`static-catalog/products.json` — це те, що сайт показує, коли Supabase
недоступний (див. loadProducts у index.html). Якщо знімок не оновлювати,
під час збою сайт покаже старі дані й ніхто цього не помітить.

Саме так сталось 29.08.2026: ціни знизили 21.08 лише в базі, знімок
лишили старим — і коли Supabase закрили за квотою, сайт 4 години
показував ціни до знижки, поки крутилась реклама.

    python3 scripts/sync-catalog.py             # оновити знімок
    python3 scripts/sync-catalog.py --selftest  # перевірка логіки, без мережі

Ключ anon публічний (лежить у config.js), секрети не потрібні.

Якщо Supabase недоступний або віддав підозріло мало товарів — скрипт
НІЧОГО не змінює і виходить з кодом 0. Старий знімок кращий за зіпсований.
"""
import json, os, sys, urllib.error, urllib.request

SB = 'https://gwzywunqffubbmscmgam.supabase.co'
ANON = 'sb_publishable_agwV8VZz7vSQ_xQSONg22w_upAe5lQA'
QUERY = '/rest/v1/products?select=*&store=eq.talvyna&order=sort.asc,id.asc'

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
SNAPSHOT = os.path.join(ROOT, 'static-catalog', 'products.json')
IMG_DIR = os.path.join(ROOT, 'static-catalog', 'img')
MIN_PRODUCTS = 50            # менше — вважаємо відповідь битою, знімок не чіпаємо


def localize(products):
    """Замінює посилання на фото з Supabase на локальні шляхи.

    Повертає (товари, [(url, відносний_шлях), ...]) — друге це те, що треба
    докачати. Функція чиста, мережі не торкається: її й перевіряє --selftest.

    Тека фото = sku, де '/' замінено на '-' (11/70 -> 11-70).
    """
    todo = {}

    def one(url, sku):
        if not isinstance(url, str) or not url or url.startswith('/static-catalog/'):
            return url                                   # вже локальне або порожнє
        if '/storage/v1/' not in url:
            return url                                   # чуже посилання — не чіпаємо
        rel = '%s/%s' % (sku.replace('/', '-'), url.split('?')[0].rsplit('/', 1)[-1])
        todo.setdefault(rel, url)
        return '/static-catalog/img/' + rel

    for p in products:
        sku = p.get('sku') or ''
        if not sku:
            continue
        if isinstance(p.get('images'), list):
            p['images'] = [one(u, sku) for u in p['images']]
        if p.get('image_url'):
            p['image_url'] = one(p['image_url'], sku)
    return products, sorted((v, k) for k, v in todo.items())


def fetch_products():
    req = urllib.request.Request(SB + QUERY, headers={'apikey': ANON,
                                                      'Authorization': 'Bearer ' + ANON})
    try:
        with urllib.request.urlopen(req, timeout=60) as r:
            return json.loads(r.read())
    except urllib.error.HTTPError as e:
        print('Supabase відповів %s — знімок лишаю як є' % e.code)
    except Exception as e:
        print('Supabase недоступний (%s) — знімок лишаю як є' % e)
    return None


def main():
    products = fetch_products()
    if products is None:
        return 0
    if not isinstance(products, list) or len(products) < MIN_PRODUCTS:
        print('Supabase віддав %s товарів (очікували >=%d) — знімок лишаю як є'
              % (len(products) if isinstance(products, list) else '?', MIN_PRODUCTS))
        return 0

    products, downloads = localize(products)

    added = 0
    for url, rel in downloads:
        path = os.path.join(IMG_DIR, rel)
        if os.path.exists(path):
            continue
        os.makedirs(os.path.dirname(path), exist_ok=True)
        try:
            with urllib.request.urlopen(url, timeout=60) as r:
                data = r.read()
            with open(path, 'wb') as f:
                f.write(data)
            added += 1
            print('  + фото', rel)
        except Exception as e:
            # не зриваємо синхронізацію через одне фото — але й не пишемо
            # у знімок локальний шлях, якого немає на диску
            print('  ! не вдалось завантажити %s (%s)' % (rel, e))
            for p in products:
                if isinstance(p.get('images'), list):
                    p['images'] = [url if i.endswith('/' + rel) else i for i in p['images']]
                if p.get('image_url', '').endswith('/' + rel):
                    p['image_url'] = url

    old = open(SNAPSHOT, encoding='utf-8').read() if os.path.exists(SNAPSHOT) else ''
    new = json.dumps(products, ensure_ascii=False, indent=2) + '\n'
    if new == old:
        print('Знімок уже актуальний (%d товарів, %d нових фото)' % (len(products), added))
        return 0
    with open(SNAPSHOT, 'w', encoding='utf-8') as f:
        f.write(new)
    print('Знімок оновлено: %d товарів, %d нових фото' % (len(products), added))
    return 0


def selftest():
    src = 'https://x.supabase.co/storage/v1/object/public/product-images/pizh-11-70/1.webp'
    ps, todo = localize([
        {'sku': '11/70', 'images': [src, '/static-catalog/img/11-70/2.webp'],
         'image_url': src},
        {'sku': '13/10', 'images': [], 'image_url': None},
    ])
    assert ps[0]['images'][0] == '/static-catalog/img/11-70/1.webp', ps[0]['images']
    assert ps[0]['images'][1] == '/static-catalog/img/11-70/2.webp'   # локальне не чіпаємо
    assert ps[0]['image_url'] == '/static-catalog/img/11-70/1.webp'
    assert ps[1]['image_url'] is None                                 # порожнє не ламаємо
    assert todo == [(src, '11-70/1.webp')], todo                      # качаємо один раз

    # реальний знімок мусить бути ідемпотентним: він уже локальний
    if os.path.exists(SNAPSHOT):
        real = json.load(open(SNAPSHOT, encoding='utf-8'))
        again, todo2 = localize(json.loads(json.dumps(real)))
        assert todo2 == [], todo2[:3]
        assert again == real
    print('selftest OK')
    return 0


if __name__ == '__main__':
    sys.exit(selftest() if '--selftest' in sys.argv else main())
