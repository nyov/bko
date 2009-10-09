SHELL = /bin/bash

PWD := $(shell pwd)

ifdef BKO_CONFIG
include $(BKO_CONFIG)
NEWCONFIG="../$(BKO_CONFIG)"
else
NEWCONFIG=""
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
	$(MAKE) $(MFLAGS) BKO_CONFIG="$(NEWCONFIG)" -C $@ -f Makefile

$(patsubst %,%.clean,$(DIRS)):
	$(MAKE) $(MFLAGS) BKO_CONFIG="$(NEWCONFIG)" -C $(patsubst %.clean,%,$@) -f Makefile clean

$(patsubst %,%.clean,$(GPXEDIR)):
	$(MAKE) $(MFLAGS) BKO_CONFIG="$(NEWCONFIG)" -C $(patsubst %.clean,%,$@)/src -f Makefile clean


