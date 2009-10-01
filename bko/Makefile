SHELL = /bin/bash

PWD := $(shell pwd)


ifndef BKO_CONFIG
BKO_CONFIG=config
endif

-include $(BKO_CONFIG)

ABSPATH = 

export BKOPREFIX

#.SILENT:

DIRS = live

all: make_statement $(DIRS)

bko: $(DIRS)

clean: make_statement $(patsubst %,%.clean,$(DIRS))

make_statement:
	echo "	Working on building the bko menuing system"

$(DIRS): make_statement
	$(MAKE) $(MFLAGS) -C $@ -f Makefile

$(patsubst %,%.clean,$(DIRS)):
	$(MAKE) $(MFLAGS) -C $(patsubst %.clean,%,$@) -f Makefile clean

$(patsubst %,%.clean,$(GPXEDIR)):
	$(MAKE) $(MFLAGS) -C $(patsubst %.clean,%,$@)/src -f Makefile clean


