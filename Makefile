LATEX := pdflatex
LATEXFLAGS := --shell-escape --file-line-error
LATEXMK := latexmk
LATEXMKFLAGS := -quiet -recorder -use-make -pdf

.PHONY: clean

example.pdf: example.tex homework.cls
	$(LATEXMK) $(LATEXMKFLAGS) -pdflatex="$(LATEX) $(LATEXFLAGS) %O %S" $<

clean:
	$(LATEXMK) -quiet -c
