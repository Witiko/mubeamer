# Make glossaries.
add_cus_dep( 'glo', 'gls', 0, 'makeglo2gls' );
sub makeglo2gls {
      system("makeindex -s \"gglo.ist\" -o \"$_[0].gls\" \"$_[0].glo\"" );
}

# Make the index.
$makeindex = "makeindex -s gind.ist %O -o %D %S";

# Produce a PDF file.
$pdf_mode = 1;
$dvi_mode = 0;
