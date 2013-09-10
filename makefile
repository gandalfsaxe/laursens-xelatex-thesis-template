XELATEX=xelatex -file-line-error -interaction=nonstopmode
BIBTEX=bibtex

all: Thesis.pdf

Thesis.pdf :\
	**/*.tex \
	**/*.bib \
	graphics/** \
	makefile \

clean:
	rm -f Thesis.pdf *.aux *.bbl *.blg *.log *.out *.tdo *.toc *.xdv *.synctex.gz; \
	rm -f **/*.aux

%.pdf: %.tex
	@echo "Compiling $*"
	$(XELATEX) --no-pdf $* 2>&1;\
	$(BIBTEX) $*;\
	$(XELATEX) --no-pdf $* 2>&1;\
	$(XELATEX) $* 2>&1;\

.PHONY: all clean
