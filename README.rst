=================================
Laursen's XeLaTeX thesis template
=================================

This is an alternative to the "LUKE'S PHD THESIS TEMPLATE 1.2" used as standard layout for the
thesis written at DTU Compute.

The template is using the Memoir class which includes a lot of use full and predefined commands. See the
"Miscellaneous" chapter of the Memoir manual. Furthermore it uses XeLaTeX for maximum unicode support and
for the support of using local fonts.

Requirements
============

Standard (updated) TeX Live package including XeLaTeX and BibTeX.

Fonts
-----
The setup uses

* "Computer Modern Unicode" (cm-unicode) as standard fonts,
* "TeX Gyre Adventor" (tex-gyre) for sans-serif fonts

which maximizes unicode support. These are public fonts which can be installed from your system from::

 /usr/local/texlive/<version>/texmf-dist/fonts/opentype/public

Note that the standard DTU font (NeoSans) is the ultimative font for headings but due to lack of symbols
(e.g. the plus '+' symbols is not incorporated) it is not wise to use. One can use a similar font
called "Neo Sans Intel" to get the DTU look. Due to fact that these fonts are proprietary this repo does
not include them. The standard sans-serif font is therefore set to TeX Gyre Adventor.

If the Neo Sans* fonts are installed on your system (un)comment the respective lines in the preamble.

If you want more unicode support in math mode also install

* "Latin Modern Math" (lm-math) for math,

and uncomment the respective lines in the preamble.

Usage
=====

make
----

Run::

 make

TextMate
--------
If using TextMate simply press "⌘ R".

Texmaker
--------
In preferences change "Quick Build" option to::

  XeLaTeX + View PDF

Ensure under "Editor" that "Editor Font Encoding" is set to::

  UTF-8


Further info
============

Confidential thesis
-------------------
The command::

 \confidential

Creates a confidential thesis first page with full box and next pages with tinted confidential boxes.
Uncomment in Thesis.tex

Printing
--------
If the pdf should be printed, trim marks can be enabled and the stock format changed to A4 ready for cut.
This is done in the top of the preamble.
