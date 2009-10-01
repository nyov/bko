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
	echo "--> Generating DSL"

configfile: $(DIRS) dsl.conf
dsl.conf: dsl.bko.tmpl urls
	./make-conf dsl ../../../config

urls: make_statement
	./make-urls

clean: make_statement $(patsubst %,%.clean,$(DIRS))
	-rm -rf *.conf

