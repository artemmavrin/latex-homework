# To build the example homework PDF in a UNIX terminal, run ``make'.
# Use ``make clean'' to remove auxiliary LaTeX files.

LATEX=pdflatex
LATEXOPT=--shell-escape --file-line-error
LATEXMK=latexmk
LATEXMKOPT=-quiet -recorder -use-make -pdf

.PHONY: clean
.PRECIOUS: example.pdf

example.pdf: example.tex homework.cls
	${LATEXMK} ${LATEXMKOPT} -pdflatex="${LATEX} ${LATEXOPT} %O %S" $<

clean:
	${LATEXMK} -quiet -c
	rm -f *.synctex.gz
