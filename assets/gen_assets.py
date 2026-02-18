from pathlib import Path
import re

colors = [
    "#F7F7FF",
    "#252530",
    "#3F3F53",
    "#BDBDD9",
    "#EEEEFC",
    "#202025",
    "#EE5E66",
    "#FABD2F",
    "#79C779",
    "#66AFEF",
    "#66B6C6",
    "#7F879E",
    "#88B8FA",
    "#AF87D7",
    "#AB7F49",
    "#CC7000",
]

out = Path("swatches")
out.mkdir(parents=True, exist_ok=True)

tpl = """<?xml version="1.0" encoding="UTF-8"?>
<svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 14 14" role="img" aria-label="#{hex}">
  <rect x="0.5" y="0.5" width="13" height="13" rx="2" fill="#{hex}" stroke="#999999"/>
</svg>
"""

for c in colors:
    c = c[1:].strip().upper()
    if not re.fullmatch(r"[0-9A-F]{6}", c):
        raise ValueError(f"Bad hex: {c}")
    (out / f"{c}.svg").write_text(
        tpl.format(hex=c) + "\n", encoding="utf-8", newline="\n"
    )
