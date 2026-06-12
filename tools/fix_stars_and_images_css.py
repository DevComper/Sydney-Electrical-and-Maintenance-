from pathlib import Path
root = Path(__file__).resolve().parents[1]
html_files = list(root.rglob('*.html'))
repl_count = 0
css_removed = 0
for p in html_files:
    s = p.read_text(encoding='utf-8')
    orig = s
    # replace mojibake stars
    if 'â˜…' in s:
        s = s.replace('â˜…', '★')
        repl_count += 1
    # remove stray fragment in images.html
    if p.name == 'images.html' and 'g{height:360px}' in s:
        s = s.replace('g{height:360px} }', '')
        # also remove lone 'g{height:360px}'
        s = s.replace('g{height:360px}', '')
        css_removed += 1
    if s != orig:
        p.write_text(s, encoding='utf-8')
print('Files changed (star fixes):', repl_count)
print('images.html css fragments removed:', css_removed)
