all: tsmca2011
default: tsmca2011

FILE  = main
TEX_FILE = $(FILE).tex


RM:=rm -f
PS2PDF := ps2pdf -dCompatibilityLevel=1.4 -dMAxSubsetPct=100 -dSubsetFonts=true -dEmbedAllFonts=true -sPAGESIZE=Letter
tsmca2011: $(TEX_FILE)
	latex $(TEX_FILE)
	latex $(TEX_FILE)
	bibtex $(FILE)
	latex $(TEX_FILE)
	dvips -Ppdf -G0 -t letter $(FILE).dvi -o $@.ps
	$(PS2PDF) $@.ps $@.pdf

clean:
	$(RM) *.aux *.blg *.dvi *.log *.bbl main.pdf main.ps
	$(RM) *~
	$(RM) core
	$(RM) print
	$(RM) -r auto
