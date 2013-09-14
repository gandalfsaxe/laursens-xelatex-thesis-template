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
The setup uses the following fonts:

* `Computer Modern Unicode <http://www.ctan.org/tex-archive/fonts/cm-unicode>`_
* `TeX Gyre Adventor <http://www.ctan.org/tex-archive/fonts/tex-gyre>`_

They are contained in TeXLive and MiKTeX setup by default so no extra setup is necessary.
If you want more unicode support in math mode use the Latin Modern Math by uncomment the lines in 
the bottom of ``setup/font.tex``. NB there are `hyperref errors with math symbols using this font in 
headings <http://tex.stackexchange.com/questions/131627>`_.

Note that the standard Neo Sans (DTU font) is the ultimative font for headings but due to lack of symbols
it is not wise to use. One can use a similar font called "Neo Sans Intel" to get the DTU look. If the
Neo Sans (Intel) font are installed on your system (un)comment the respective lines in ``setup/font.tex``.

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
