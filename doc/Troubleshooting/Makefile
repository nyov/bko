PERL	 = perl

GENFILES = Troubleshooting.html

all : $(GENFILES)

clean :
	rm -f $(GENFILES)

Troubleshooting.html : troubleshooting.txt header.txt footer.txt makefaq.pl
	$(PERL) makefaq.pl > $@.new
	mv -f $@.new ../../web/$@
