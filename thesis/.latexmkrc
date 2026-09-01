$out_dir = 'build';
# -shell-escape lets the svg package run inkscape at compile time to convert
# SVG figures to PDF (see style.tex).
$pdflatex = 'pdflatex -shell-escape -interaction=nonstopmode %O %S';

# glossaries package: regenerate the sorted .gls from .glo via makeglossaries
# (a wrapper around makeindex) whenever the source changes.
add_cus_dep('glo', 'gls', 0, 'makeglo2gls');
sub makeglo2gls {
    # $_[0] is the target base path (e.g. "build/debug/thesis"); makeglossaries
    # mishandles the directory component of -s when given a path, so cd into
    # it and call with just the basename instead.
    my ($dir, $base) = $_[0] =~ m{^(.*)/([^/]+)$};
    return system("cd \"$dir\" && makeglossaries \"$base\"");
}
push @generated_exts, 'glo', 'gls', 'glg';
$clean_ext .= ' %R.ist %R.acn %R.acr %R.alg';
