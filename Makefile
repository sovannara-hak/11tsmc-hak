all: tsmcb2011 reply
default: tsmcb2011

FILE  = tsmcb2011
TEX_FILE = $(FILE).tex
REPLY = reply
REPLY_FILE = $(REPLY).tex


RM:=rm -f
PS2PDF := ps2pdf -r300 -dEPSCrop -dTextAlphaBits=4 -dBATCH -dNOPAUSE -dCompatibilityLevel=1.4 -dMaxSubsetPct=100 -dSubsetFonts=true -dEmbedAllFonts=true -sPAGESIZE=Letter
tsmcb2011: $(TEX_FILE)
	latex -file-line-error -halt-on-error  $(TEX_FILE)
	latex -file-line-error -halt-on-error -interaction=batchmode $(TEX_FILE)
	bibtex $(FILE)
	latex -file-line-error -halt-on-error -interaction=batchmode $(TEX_FILE)
	bibtex $(FILE)
	latex -file-line-error -halt-on-error -interaction=batchmode $(TEX_FILE)
	dvips -Ppdf -G0 -t letter -q $(FILE).dvi -o $@.ps
	$(PS2PDF) $@.ps $@.pdf

reply: $(REPLY_FILE)
	latex -file-line-error -halt-on-error  $(REPLY_FILE)
	latex -file-line-error -halt-on-error -interaction=batchmode $(REPLY_FILE)
	bibtex $(REPLY)
	latex -file-line-error -halt-on-error -interaction=batchmode $(REPLY_FILE)
	bibtex $(REPLY)
	latex -file-line-error -halt-on-error -interaction=batchmode $(REPLY_FILE)
	dvips -Ppdf -G0 -t letter -q $(REPLY).dvi -o $@.ps
	$(PS2PDF) $@.ps $@.pdf

clean:
	$(RM) *.aux *.blg *.dvi *.log *.bbl 
	$(RM) *~
	$(RM) core
	$(RM) print
	$(RM) -r auto
