==========================
K(Xe)LaTeX thesis template
==========================

This is an alternative to the "LUKE'S PHD THESIS TEMPLATE 1.2" used as standard layout for the 
thesis written at DTU Compute. 

The template is using the Memoir class which includes a lot of use full and predefined commands. See the 
"Miscellaneous" chapter of the Memoir manual.

The standard DTU font (NeoSans) is the ultimative font for headings but due to lack of symbols 
(e.g. the plus '+' symbols is not incorporated at the font provided by DTU)
a similar font is used (Neo Sans Intel).

Requirements
============

Standard (updated) TeX Live package including XeLaTeX and BibTeX.

Fonts
-----
The user should install the "Neo Sans Intel". If this font is not available the "TeX Gyre Adventor" font 
is a good alternative, (un)comment the lines in the preamble under Sans-serif font. 

The setup uses "Computer Modern Unicode" (CMU) as standard font, and the "Latin Modern Math" for math 
which maximizes unicode support. These are public fonts (including the TeX Gyre Adventor) which can
be installed from your system from:

::

 /usr/local/texlive/<version>/texmf-dist/fonts/opentype/public

Usage
=====

If make is installed run

::

 make

If using TextMate simply press "⌘ R".

Further info
============

Confidential thesis
-------------------
The command

::

 \confidential

Creates a confidential thesis first page with full box and next pages with tinted confidential boxes.
Uncomment in Thesis.tex

Printing
--------
If the pdf should be printed, trim marks can be enabled and the stock format changed to A4 ready for cut.

