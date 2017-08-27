This directory contains example documents for the various work places at
the Masaryk University (Brno, Czech Republic). The documents are archived
inside the `example.dtx` file. To unpack the archive, interpret the file
`example.ins` using a Unicode-aware TeX engine, such as XeTeX
(`xetex muletter.ins`) or LuaTeX (`luatex muletter.ins`). This should produce
several example documents for each work place.

If you wish to typeset the example document for XeTeX (named
`...-xetex-luatex.tex`), you will need to install the ParaType Sans and
ParaType Mono fonts, so that they are visible to the font finder specific to
your operating system. Unlike XeTeX, LuaTeX will search your TeX installation,
which already contains the fonts. Therefore no action is necessary on your part
if you use LuaTeX.
