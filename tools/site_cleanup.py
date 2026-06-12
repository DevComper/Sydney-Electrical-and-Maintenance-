from pathlib import Path
import re
root = Path(__file__).resolve().parents[1]
html_files = list(root.rglob('*.html'))
mojibake_map = {
    'â€“': '–',
    'â€”': '—',
    'â€¢': '•',
    'â€œ': '“',
    'â€�': '”',
    'â€™': '’',
    'â€˜': '‘',
    'Â ': '',
    'Ã©': 'é',
    'Ã¨': 'è',
    'Ã¢': 'â',
    'Ã' : 'à',
}
removed_callout_count = 0
mojibake_count = 0
forms_changed = 0
images_changed = 0
counts = {'forms_changed': 0, 'images_changed': 0}
for p in html_files:
    s = p.read_text(encoding='utf-8')
    orig = s

    # Fix mojibake
    for k,v in mojibake_map.items():
        if k in s:
            s = s.replace(k, v)
            mojibake_count += s.count(v)

    # Remove $0 callout fee variants (case-insensitive)
    # patterns: "$0 callout fee", "Callout fee $0", variations with hyphens/spaces
    pattern1 = re.compile(r'(?i)\$0[\s\-]*call(?:out|-out|\sout)[\s\-]*fee[\.!?\)]*')
    pattern2 = re.compile(r'(?i)call(?:out|-out|\sout)[\s\-]*fee[\s\-]*\$0[\.!?\)]*')
    (s, n1) = pattern1.subn('', s)
    (s, n2) = pattern2.subn('', s)
    removed_callout_count += (n1 + n2)

    # Normalize forms: replace opening <form ...> with standardized action+method + keep class if present
    def replace_form(m):
        # keep no other attributes to ensure consistent form behaviour
        counts['forms_changed'] += 1
        return '<form class="form" action="https://formbold.com/s/6vdvb" method="POST">'
    s, nforms = re.subn(r'<form\b[^>]*>', replace_form, s, flags=re.IGNORECASE)

    # Add loading="lazy" to img tags without loading attribute
    def img_lazy(m):
        tag = m.group(0)
        if re.search(r'\bloading\s*=\s*"', tag, flags=re.IGNORECASE):
            return tag
        # insert loading attribute after <img
        newtag = tag.replace('<img', '<img loading="lazy"', 1)
        counts['images_changed'] += 1
        return newtag
    s = re.sub(r'<img\b[^>]*>', img_lazy, s, flags=re.IGNORECASE)

    if s != orig:
        p.write_text(s, encoding='utf-8')

print('Files scanned:', len(html_files))
print('Mojibake fixes (approx replacements):', mojibake_count)
print('Removed $0 callout phrases:', removed_callout_count)
print('Forms normalized:', counts['forms_changed'])
print('Images updated with lazy loading (approx):', counts['images_changed'])
