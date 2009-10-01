SHELL = /bin/bash

#.SILENT:

DIRS = debian dsl fedora knoppix ubuntu

configfile = MENU INCLUDE @CONFIGFILE@ @DISTRO@\n

all: make_statement configfile $(DIRS)

make_statement:
	echo "--> Generating Live Image Menus"

configfile: $(DIRS) live.conf
live.conf: $(subst %,%/%.conf,$(DIRS)) live.tmpl
	_SUBDIR="\/live"; \
	cat live.tmpl > $@; \
        for x in $(DIRS); \
        do \
		if [[ -e "$${x}/$${x}.conf" ]]; \
		then \
			echo "~~ $${x}"; \
			printf "$(configfile)" | \
		        sed \
		                -e "s/@DISTRO@/$${x}/" \
		                -e "s/@CONFIGFILE@/$${_SUBDIR}\/$${x}\/$${x}.conf/" \
		                -e "s/@LABEL@/$${x}/" >> $@; \
		fi \
        done

$(DIRS): make_statement
	$(MAKE) $(MFLAGS) ABSPATH="$(ABSPATH)/$@" CONFIG="$(NEWCONFIG)" -C $@ -f Makefile

clean: make_statement $(patsubst %,%.clean,$(DIRS))
	-rm -rf *.conf

$(patsubst %,%.clean,$(DIRS)):
	$(MAKE) $(MFLAGS) ABSPATH="$(ABSPATH)/$@" CONFIG="$(NEWCONFIG)" -C $(patsubst %.clean,%,$@) -f Makefile clean

