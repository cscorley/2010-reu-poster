PAPER 		= poster

LATEX 		= pdflatex
BIBTEX		= bibtex
PDF_VIEW	= open

FIG_DIR		= graphics
EPS_FIGS 	= $(shell echo $(FIG_DIR)/*.eps)
GEN_FIGS 	= $(addsuffix .pdf, $(basename $(EPS_FIGS)))

TEX_FILES	= $(shell find . -name '*.tex')
BIB_FILES	= 
STY_FILES	= $(shell find . -name '*.sty')
FIG_FILES	= $(GEN_FIGS)

DEP_FILES	= $(TEX_FILES) $(BIB_FILES) $(STY_FILES) $(FIG_FILES)


$(PAPER).pdf: $(DEP_FILES)
	$(LATEX) $(PAPER)
	$(LATEX) $(PAPER)

view: $(PAPER).pdf
	$(PDF_VIEW) $(PAPER).pdf

tidy:
	$(RM) $(PAPER).aux
	$(RM) $(PAPER).log
	$(RM) $(PAPER).nav
	$(RM) $(PAPER).out
	$(RM) $(PAPER).snm
	$(RM) $(PAPER).toc
	$(RM) $(PAPER).vrb

clean: tidy
	$(RM) $(GEN_FIGS)

%.pdf: %.eps
	epstopdf --outfile=$@ $<

