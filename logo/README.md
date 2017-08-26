This directory contains the logo files of the Masaryk University (Brno, Czech
Republic).

# Usage
If you downloaded the mubeamer theme from the Git repository, where the
development takes place, you can run GNU Make in this directory to pull the
latest available logo files. For this, you will require:

 - Git,
 - GNU Bash,
 - GNU Make,
 - Inkscape, and
 - `nproc` from GNU Coreutils.

Make sure you have initialized the `sablony-muni-scraper` submodule located in
the parent directory by running

    $ git submodule update --init

After you have inspected the documentation of the `sablony-muni-scraper`
submodule to see that you have all the required tools and assets installed,
invoke

    $ make -C ../sablony-muni-scraper

If the above commands succeed, you may now invoke

    $ make -j $(nproc) -l $(nproc)

After the above command has successfully finished, all the available logo files
in PDF and EPS formats should reside in this directory.
