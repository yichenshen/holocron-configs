$pdflatex = 'lualatex -shell-escape -synctex=1 -file-line-error %O %S';
$pdf_mode = 1;
$postscript_mode = $dvi_mode = 0;

$bibtex_use = 2;
push @generated_exts, "synctex.gz";
push @generated_exts, "synctex.gz(busy)";
push @generated_exts, "run.xml";
