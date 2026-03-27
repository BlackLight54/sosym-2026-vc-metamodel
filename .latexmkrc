# Tell LaTeX where to find acmart.cls, preamble, section .tex files, etc.
$ENV{'TEXINPUTS'} = './pandoc//;' . ($ENV{'TEXINPUTS'} || '');

# PDF mode
$pdf_mode = 1;

# SyncTeX for click-to-jump between PDF and source
$pdflatex = 'pdflatex -synctex=1 -interaction=nonstopmode %O %S';

# Output directory — keep build artifacts out of project root
$out_dir = 'build';

# Root document (latexmk runs from project root)
@default_files = ('pandoc/main.tex');
