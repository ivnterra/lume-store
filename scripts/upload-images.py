#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Завантаження фото товарів у Supabase Storage (bucket product-images).

Використання:
    python3 scripts/upload-images.py            # залити все з _photos/
    python3 scripts/upload-images.py hal-226-11 # залити одну папку

Ключ береться з файлу .supabase-service-key у корені проєкту
(service_role: Supabase -> Settings -> API). Файл у .gitignore.

Структура: _photos/<папка>/<n>.webp  ->  product-images/<папка>/<n>.webp
Уже наявні файли перезаписуються (x-upsert).
"""
import os, sys, urllib.error, urllib.request

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
SRC = os.path.join(ROOT, '_photos')
SB_URL = 'https://gwzywunqffubbmscmgam.supabase.co'
BUCKET = 'product-images'
MIME = {'.webp': 'image/webp', '.jpg': 'image/jpeg', '.jpeg': 'image/jpeg', '.png': 'image/png'}


def key():
    p = os.path.join(ROOT, '.supabase-service-key')
    if not os.path.exists(p):
        sys.exit('Немає файлу .supabase-service-key у корені проєкту.')
    k = open(p).read().strip()
    if not k:
        sys.exit('Файл .supabase-service-key порожній.')
    return k


def upload(path, rel, k):
    ext = os.path.splitext(path)[1].lower()
    req = urllib.request.Request(
        f'{SB_URL}/storage/v1/object/{BUCKET}/{rel}',
        data=open(path, 'rb').read(),
        method='POST',
        headers={'apikey': k,                       # ключі формату sb_secret_ вимагають apikey
                 'Authorization': 'Bearer ' + k,
                 'Content-Type': MIME.get(ext, 'application/octet-stream'),
                 'x-upsert': 'true'})
    with urllib.request.urlopen(req, timeout=120) as r:
        return r.status


def main():
    k = key()
    only = sys.argv[1:] or None
    folders = sorted(f for f in os.listdir(SRC) if os.path.isdir(os.path.join(SRC, f)))
    if only:
        folders = [f for f in folders if f in only]
    total = 0
    for folder in folders:
        d = os.path.join(SRC, folder)
        files = sorted([f for f in os.listdir(d) if not f.startswith('.')],
                       key=lambda n: int(os.path.splitext(n)[0]))
        for f in files:
            rel = f'{folder}/{f}'
            try:
                upload(os.path.join(d, f), rel, k)
                total += 1
            except urllib.error.HTTPError as e:
                print(f'  ПОМИЛКА {rel}: HTTP {e.code} {e.read().decode("utf-8", "replace")[:200]}')
        print(f'{folder}: {len(files)} файлів')
    print(f'\nЗавантажено {total} файлів у bucket {BUCKET}.')


if __name__ == '__main__':
    main()
