# Tell LaTeX where to find acmart.cls, preamble, section .tex files, etc.
$ENV{'TEXINPUTS'} = './pandoc//;' . ($ENV{'TEXINPUTS'} || '');
# bibtex needs to find bibliography/references.bib (path from main.tex)
# when running from build/. Point BIBINPUTS to project root + pandoc/.
$ENV{'BIBINPUTS'} = './pandoc//;..//;' . ($ENV{'BIBINPUTS'} || '');

# PDF mode
$pdf_mode = 1;

# SyncTeX for click-to-jump between PDF and source
$pdflatex = 'pdflatex -synctex=1 -interaction=nonstopmode %O %S';

# Output directory — inside pandoc/ so LaTeX Workshop finds the PDF
# relative to main.tex
$out_dir = 'pandoc/build';

# Root document (latexmk runs from project root)
@default_files = ('pandoc/main.tex');
