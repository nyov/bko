SHELL = /bin/bash

PWD := $(shell pwd)


ifndef CONFIG
CONFIG=config
endif

-include $(CONFIG)

ABSPATH = 

export BKOPREFIX

#.SILENT:

all: make_statement

bko: $(SUPPORTDIRS) $(GPXEDIR)

clean: make_statement $(patsubst %,%.clean,$(DIRS))

make_statement:
	echo "	Working on building the bko menuing system"

$(patsubst %,%.build,$(DIRS)): make_statement
	$(MAKE) $(MFLAGS) -C $@ -f Makefile

$(patsubst %,%.clean,$(DIRS)):
	$(MAKE) $(MFLAGS) -C $(patsubst %.clean,%,$@) -f Makefile clean

$(patsubst %,%.clean,$(GPXEDIR)):
	$(MAKE) $(MFLAGS) -C $(patsubst %.clean,%,$@)/src -f Makefile clean


