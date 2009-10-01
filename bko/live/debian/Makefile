SHELL = /bin/bash

#.SILENT:

ifdef BKO_CONFIG
include $(BKO_CONFIG)
NEWCONFIG="../$(CONFIG)"
else
NEWCONFIG=""
endif

all: make_statement configfile

make_statement:
	echo "--> Generating Debian"

configfile: $(DIRS) debian.conf
debian.conf: debian.bko.tmpl
	./make-urls
	./make-conf debian ../../../config

clean: make_statement $(patsubst %,%.clean,$(DIRS))
	-rm -rf *.conf

