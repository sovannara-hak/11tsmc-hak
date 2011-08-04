all: tsmca2011
default: tsmca2011

FILE  = tsmca2011
TEX_FILE = $(FILE).tex


RM:=rm -f
PS2PDF := ps2pdf -r300 -dEPSCrop -dTextAlphaBits=4 -dBATCH -dNOPAUSE -dCompatibilityLevel=1.4 -dMaxSubsetPct=100 -dSubsetFonts=true -dEmbedAllFonts=true -sPAGESIZE=Letter
tsmca2011: $(TEX_FILE)
	latex -file-line-error -halt-on-error  $(TEX_FILE)
	latex -file-line-error -halt-on-error -interaction=batchmode $(TEX_FILE)
	bibtex $(FILE)
	latex -file-line-error -halt-on-error -interaction=batchmode $(TEX_FILE)
	bibtex $(FILE)
	latex -file-line-error -halt-on-error -interaction=batchmode $(TEX_FILE)
	dvips -Ppdf -G0 -t letter -q $(FILE).dvi -o $@.ps
	$(PS2PDF) $@.ps $@.pdf

clean:
	$(RM) *.aux *.blg *.dvi *.log *.bbl main.pdf main.ps
	$(RM) *~
	$(RM) core
	$(RM) print
	$(RM) -r auto
