all: thesis

thesis: bib doc
	cp build/thesis.pdf thesis.pdf

bib: doc bibliography.bib build/thesis.aux
	TEXMFOUTPUT="build:" chronic bibtex build/thesis
	chronic pdflatex -halt-on-error -output-directory=build thesis.tex
    
doc: thesis.tex
	chronic pdflatex -halt-on-error -output-directory=build thesis.tex

clean:
	rm build/*
