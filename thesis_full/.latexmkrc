# Compilazione del documento unificato (thesis_full).
# Controparte di ../thesis/.latexmkrc, con in piu' la risoluzione dei path
# verso le cartelle sorelle.
#
# Nessun path assoluto in questo file: TEXINPUTS viene composto a ogni
# invocazione a partire dalla cartella di lavoro corrente, quindi il file
# resta portabile (clone su un'altra macchina, altro utente, altro checkout).

use Cwd qw(abs_path);
use File::Path qw(make_path);

$out_dir = 'build';

# -shell-escape lets the svg package run inkscape at compile time to convert
# SVG figures to PDF (see ../thesis/style.tex).
$pdflatex = 'pdflatex -shell-escape -interaction=nonstopmode %O %S';

# ---------------------------------------------------------------- TEXINPUTS
# I \input di questo documento usano path relativi a QUESTA cartella
# (../thesis/..., ../summary_it/...) e funzionano perche' latexmk viene
# invocato da qui. I \input annidati dentro quei file, invece, sono risolti
# da pdflatex relativamente alla sua cwd: per questo servono le cartelle
# sorelle in TEXINPUTS. La ricerca non e' ricorsiva: gli input annidati
# contengono gia' il percorso delle sottocartelle. Cercare anche in img/
# nasconderebbe a svg il percorso reale da passare a Inkscape.
#
# La cartella e' risolta in assoluto SOLO in memoria (Cwd::abs_path), cosi'
# funziona su un altro checkout senza modifiche. Eseguire latexmk dalla
# cartella thesis_full/, come indicato nel README.
my $root = abs_path('..');
$ENV{'TEXINPUTS'} = join(':',
    '.',
    "$root/thesis",
    "$root/summary_it",
    "$root/summary_en",
    $ENV{'TEXINPUTS'} // '',
);

# BIBINPUTS risolve la bibliografia; TEXINPUTS risolve il modello .dbx.
# I percorsi delle figure sono impostati esplicitamente in thesis_full.tex.
$ENV{'BIBINPUTS'} = join(':',
    '.',
    "$root/thesis",
    $ENV{'BIBINPUTS'} // '',
);

# Anche il profilo, i log e la cache di Inkscape restano in questa build.
make_path($out_dir);
my $thesis_full_build = abs_path($out_dir);
$ENV{INKSCAPE_PROFILE_DIR} = "$thesis_full_build/inkscape-profile";
$ENV{XDG_CONFIG_HOME} = "$thesis_full_build/config";
$ENV{XDG_CACHE_HOME} = "$thesis_full_build/cache";
make_path(@ENV{qw(INKSCAPE_PROFILE_DIR XDG_CONFIG_HOME XDG_CACHE_HOME)});

# glossaries package: regenerate the sorted .gls from .glo via makeglossaries
# (a wrapper around makeindex) whenever the source changes.
add_cus_dep('glo', 'gls', 0, 'makeglo2gls');
sub makeglo2gls {
    # $_[0] is the target base path (e.g. "build/thesis_full"); makeglossaries
    # mishandles the directory component of -s when given a path, so cd into
    # it and call with just the basename instead.
    my ($dir, $base) = $_[0] =~ m{^(.*)/([^/]+)$};
    return system("cd \"$dir\" && makeglossaries \"$base\"");
}
push @generated_exts, 'glo', 'gls', 'glg';
$clean_ext .= ' %R.ist %R.acn %R.acr %R.alg';
