BUILDDIR ?= _build
PDFDIR ?= pdf

.PHONY: clean-tex build-pdf \

help:
	@echo "Please use 'make <target>' where <target> is one of"
	@echo "  clean                    to remove all build, test, coverage and Python artifacts (does not remove backups)"
	@echo "  build-pdf 		  to compile all documents as pdf files."
	@echo "  collect-pdf 		  to collect all rendered pdf files in the 'pdf' directory."
	


clean: clean-build clean-tex

clean-build:
	rm -R $(BUILDDIR)/*

clean-tex:
	find . -name '*.log' -delete
	find . -name '*.aux' -delete

build-pdf:
	mkdir -p $(BUILDDIR)
	pdflatex --output-dir=$(BUILDDIR) code_of_conduct.tex
	pdflatex --output-dir=$(BUILDDIR) satzung.tex
	pdflatex --output-dir=$(BUILDDIR) geschaeftsordnung.tex
	pdflatex --output-dir=$(BUILDDIR) selbstverstaendniss.tex
	pdflatex --output-dir=$(BUILDDIR) doorlock/requirements_and_suggestions.tex

collect-pdf: build-pdf
	mkdir -p $(PDFDIR)
	cp $(BUILDDIR)/*.pdf $(PDFDIR)/

