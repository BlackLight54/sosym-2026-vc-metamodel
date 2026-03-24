# Tell LaTeX where to find acmart.cls and related files
$ENV{'TEXINPUTS'} = './tex//;' . ($ENV{'TEXINPUTS'} || '');

# PDF mode
$pdf_mode = 1;

# SyncTeX for click-to-jump between PDF and source
$pdflatex = 'pdflatex -synctex=1 -interaction=nonstopmode %O %S';

# Output directory — keep build artifacts out of project root
$out_dir = 'build';

# Root document (latexmk runs from project root)
@default_files = ('tex/main.tex');
