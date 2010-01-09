all : drexel-thesis.pdf drexel-thesis.cls main.pdf bibmain.pdf

drexel-thesis.pdf : drexel-thesis.dtx
	pdflatex $<
	makeindex drexel-thesis.glo -s gglo.ist -o drexel-thesis.gls
	pdflatex $<

drexel-thesis.cls main.tex part1.tex bibmain.tex bibpart1 references.bib : \
		drexel-thesis.ins drexel-thesis.dtx
	pdflatex $<

main.pdf : main.tex part1.tex
	pdflatex $<
	pdflatex $<

bibmain.pdf : bibmain.tex bibpart1.tex references.bib
	pdflatex $<
	bibtex bibmain
	pdflatex $<
	pdflatex $<

temp-clean :
	rm -f *.aux *.log *.out *.lof *.lot *.toc \
                *.ilg *.glo *.gls *.idx *.ind \
		*.bbl *.blg *.dvi drexel-thesis

semi-clean : temp-clean
	rm -f *.bib *.tex

clean : semi-clean
	rm -f *.cls drexel-thesis.pdf main.pdf bibmain.pdf \
		drexel-thesis.tar.gz

dist : drexel-thesis.tar.gz

CLASS_FILES = Makefile README drexel-thesis.dtx drexel-thesis.ins \
	drexel-thesis.cls drexel-thesis.pdf
MAIN_FILES = main.tex part1.tex appendixA.tex drexel-logo.pdf main.pdf
BIBMAIN_FILES = bibmain.tex bibpart1.tex references.bib appendixA.tex \
	bibmain.pdf

drexel-thesis.tar.gz : $(CLASS_FILES) $(MAIN_FILES) $(BIBMAIN_FILES)
	rm -f $@
	mkdir drexel-thesis
	cp -p $(CLASS_FILES) drexel-thesis/
	mkdir drexel-thesis/main
	cp -p $(MAIN_FILES) drexel-thesis/main/
	mkdir drexel-thesis/bibmain
	cp -p $(BIBMAIN_FILES) drexel-thesis/bibmain/
	tar -chozf $@ drexel-thesis
	rm -rf drexel-thesis
