PDF_FILES := $(shell find notes -type f -name '*.pdf' -exec basename {} \;)

all: $(PDF_FILES:.pdf=.html)

%.html: notes/**/%.pdf
	cp $< pdf/
	docker run -ti --rm -v $(CURDIR)/pdf:/pdf bwits/pdf2htmlex-alpine pdf2htmlEX --zoom 1.3 $*.pdf
	cp pdf/$*.html $*.html
