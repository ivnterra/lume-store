#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Мінімальний читач xlsx (без сторонніх бібліотек): аркуш -> список рядків."""
import re, zipfile
from xml.etree import ElementTree as ET

NS = '{http://schemas.openxmlformats.org/spreadsheetml/2006/main}'
RNS = '{http://schemas.openxmlformats.org/officeDocument/2006/relationships}'


def _shared(z):
    try:
        root = ET.fromstring(z.read('xl/sharedStrings.xml'))
    except KeyError:
        return []
    out = []
    for si in root.findall(NS + 'si'):
        out.append(''.join(t.text or '' for t in si.iter(NS + 't')))
    return out


def sheets(path):
    """{назва аркуша: внутрішній шлях}"""
    z = zipfile.ZipFile(path)
    rels = dict(re.findall(r'Id="(rId\d+)"[^>]*Target="([^"]+)"',
                           z.read('xl/_rels/workbook.xml.rels').decode('utf-8')))
    out = {}
    for name, rid in re.findall(r'<sheet[^>]*name="([^"]+)"[^>]*r:id="(rId\d+)"',
                                z.read('xl/workbook.xml').decode('utf-8')):
        t = rels[rid]
        out[name] = 'xl/' + t if not t.startswith('xl/') else t
    return out


def read(path, sheet_name):
    z = zipfile.ZipFile(path)
    shared = _shared(z)
    target = sheets(path)[sheet_name]
    root = ET.fromstring(z.read(target))
    rows = []
    for row in root.iter(NS + 'row'):
        cells = {}
        for c in row.findall(NS + 'c'):
            ref = c.get('r') or ''
            col = re.match(r'[A-Z]+', ref)
            if not col:
                continue
            idx = 0
            for ch in col.group():
                idx = idx * 26 + (ord(ch) - 64)
            idx -= 1
            v = c.find(NS + 'v')
            if c.get('t') == 's' and v is not None:
                val = shared[int(v.text)]
            elif c.get('t') == 'inlineStr':
                val = ''.join(t.text or '' for t in c.iter(NS + 't'))
            else:
                val = v.text if v is not None else ''
            cells[idx] = (val or '').strip()
        width = max(cells) + 1 if cells else 0
        rows.append([cells.get(i, '') for i in range(width)])
    return rows
