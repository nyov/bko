SHELL = /bin/bash

#.SILENT:

TITLE = Ubuntu
PREFIX = ubuntu

ifdef BKO_CONFIG
include $(BKO_CONFIG)
NEWCONFIG="../$(CONFIG)"
else
NEWCONFIG=""
endif

all: make_statement configfile

make_statement:
	echo "--> Generating $(TITLE)"

configfile: $(DIRS) $(PREFIX).conf
$(PREFIX).conf: $(PREFIX).bko.tmpl urls
	./make-conf $(PREFIX) ../../../config

urls: make_statement
	./make-urls

clean: make_statement $(patsubst %,%.clean,$(DIRS))
	-rm -rf *.conf
