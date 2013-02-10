PERL	 = perl

GENFILES = faq.html

all : $(GENFILES)

clean :
	rm -f $(GENFILES)

faq.html : questions.txt header.txt footer.txt makefaq.pl
	$(PERL) makefaq.pl > $@.new
	mv -f $@.new ../../web/$@

