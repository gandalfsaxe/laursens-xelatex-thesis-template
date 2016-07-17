=========================
Laursen's thesis template
=========================

This is an alternative to the "LUKE'S PHD THESIS TEMPLATE 1.2" used as standard layout for the
thesis written at DTU Compute.

The template is using the `Memoir class <http://www.ctan.org/tex-archive/macros/latex/contrib/memoir/>`_
which includes a lot of useful and predefined commands.

An updated version of the code can be downloaded from the
`repository at bitbucket.org <https://bitbucket.org/_laursen/laursens-xelatex-thesis-template/>`_.



Development
===========

Make latex folders::

 (mac) mkdir -p ~/Library/texmf/tex/latex/
 (linux) mkdir -p ~/texmf/tex/latex/

Go to folder::

 (mac) cd ~/Library/texmf/tex/latex/
 (linux) cd ~/texmf/tex/latex/

Clone and change branch::

 hg clone hg clone https://_laursen@bitbucket.org/_laursen/laursens-xelatex-thesis-template ./laursenthesis
 cd laursenthesis
 hg update class

Begin develop.


Testing
=======

Run all current test using (spawns multiple processes)::

 python test.py

