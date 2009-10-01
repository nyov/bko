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
	echo "--> Generating Fedora"

configfile: $(DIRS) fedora.conf
fedora.conf: fedora.bko.tmpl urls
	./make-conf fedora ../../../config

urls: make_statement
	./make-urls

clean: make_statement $(patsubst %,%.clean,$(DIRS))
	-rm -rf *.conf

