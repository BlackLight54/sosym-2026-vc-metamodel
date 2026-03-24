# .latexmkrc — Local compilation settings
# Adds tex/template/ to TEXINPUTS so LaTeX finds acmart.cls, .bst, etc.
# Overleaf does not need this file.
$ENV{'TEXINPUTS'} = './tex/template//:' . ($ENV{'TEXINPUTS'} || '');
