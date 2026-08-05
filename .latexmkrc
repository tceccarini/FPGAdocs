$out_dir = 'build';
# -shell-escape lets the svg package run inkscape at compile time to convert
# SVG figures to PDF (see style.tex).
$pdflatex = 'pdflatex -shell-escape -interaction=nonstopmode %O %S';
