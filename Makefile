SHELL = /bin/bash

PWD := $(shell pwd)


ifndef BKO_CONFIG
BKO_CONFIG=config
endif

-include $(BKO_CONFIG)

BKO_ABSPATH = 

export BKOPREFIX

.SILENT:

COREDIR = bko
GPXEDIR = gpxe
SYSLINUXDIR = syslinux
PXEKNIFEDIR = pxeknife
SUPPORTDIRS = $(SYSLINUXDIR) $(PXEKNIFEDIR)

GPXEIMAGESDIR = gpxe_images

DIRS = $(COREDIR) $(SUPPORTDIRS)

all: make_statement $(DIRS) configurebko installinitrds

bko: $(SUPPORTDIRS) $(GPXEDIR)

clean: make_statement $(patsubst %,%.clean,$(DIRS))

make_statement:
	echo "boot.kernel.org build process manager says: HELLO WORLD!"


$(SYSLINUXDIR): $(patsubst %,%.build,$(SYSLINUXDIR)) $(patsubst %,%.install,$(SYSLINUXDIR))
$(GPXEDIR): $(patsubst %,%.build,$(GPXEDIR)) $(patsubst %,%.install,$(GPXEDIR))
$(PXEKNIFEDIR): $(patsubst %,%.build,$(PXEKNIFEDIR))
$(COREDIR): $(patsubst %,%.build,$(COREDIR))

$(patsubst %,%.build,$(DIRS)): make_statement
	$(MAKE) $(MFLAGS) BKO_ABSPATH="$(BKO_ABSPATH)/$(shell echo "$@" | sed 's/\.build//')" BKO_CONFIG="../$(BKO_CONFIG)" -C $(shell echo "$@" | sed 's/\.build//') -f Makefile

$(patsubst %,%.build,$(GPXEDIR)): make_statement
	cat gpxe_bko/pxeDHCP.bko.tmpl | sed 's/P_BOOT_URL/$(shell echo "$(BASE_URL)" | sed -e 's/\//\\\//gi' )/g' > $(GPXEDIR)/src/pxeDHCP.gpxe
	cat gpxe_bko/pxeSTATIC.bko.tmpl | sed 's/P_BOOT_URL/$(shell echo "$(BASE_URL)" | sed -e 's/\//\\\//gi' )/g' > $(GPXEDIR)/src/pxeSTATIC.gpxe
	$(MAKE) $(MFLAGS) EMBEDDED_IMAGE=pxeDHCP.gpxe,pxeSTATIC.gpxe -C $(GPXEDIR)/src -f Makefile

gpxe_images: make_statement
	mkdir -p gpxe_images

$(patsubst %,%.install,$(SYSLINUXDIR)): make_statement
	find \
		$(SYSLINUXDIR) \
		 -type f \
		\( \
			-name *.c32 \
			-o \
			-name memdisk \
			-o \
			-name pxelinux.0 \
		\) \
		-exec cp {} bko/ \;

$(patsubst %,%.install,$(GPXEDIR)): make_statement gpxe_images
	$(MAKE) $(MFLAGS) EMBEDDED_IMAGE=pxeDHCP.gpxe,pxeSTATIC.gpxe -C $(GPXEDIR)/src -f Makefile bin/gpxe.usb
	$(MAKE) $(MFLAGS) EMBEDDED_IMAGE=pxeDHCP.gpxe,pxeSTATIC.gpxe -C $(GPXEDIR)/src -f Makefile bin/gpxe.dsk
	$(MAKE) $(MFLAGS) EMBEDDED_IMAGE=pxeDHCP.gpxe,pxeSTATIC.gpxe -C $(GPXEDIR)/src -f Makefile bin/gpxe.iso
	$(MAKE) $(MFLAGS) EMBEDDED_IMAGE=pxeDHCP.gpxe,pxeSTATIC.gpxe -C $(GPXEDIR)/src -f Makefile bin/gpxe.lkrn
	$(MAKE) $(MFLAGS) EMBEDDED_IMAGE=pxeDHCP.gpxe,pxeSTATIC.gpxe -C $(GPXEDIR)/src -f Makefile bin/gpxe.sdsk
	$(MAKE) $(MFLAGS) EMBEDDED_IMAGE=pxeDHCP.gpxe,pxeSTATIC.gpxe -C $(GPXEDIR)/src -f Makefile bin/gpxe.pxe
	$(MAKE) $(MFLAGS) EMBEDDED_IMAGE=pxeDHCP.gpxe,pxeSTATIC.gpxe -C $(GPXEDIR)/src -f Makefile bin/undionly.kpxe
	mv $(GPXEDIR)/src/bin/gpxe.usb $(GPXEDIR)/src/bin/gpxe.dsk $(GPXEDIR)/src/bin/gpxe.iso $(GPXEDIR)/src/bin/gpxe.lkrn gpxe_images/
	mv $(GPXEDIR)/src/bin/gpxe.sdsk $(GPXEDIR)/src/bin/gpxe.pxe $(GPXEDIR)/src/bin/undionly.kpxe gpxe_images/

$(patsubst %,%.clean,$(DIRS)):
	$(MAKE) $(MFLAGS) -C $(patsubst %.clean,%,$@) -f Makefile clean

$(patsubst %,%.clean,$(GPXEDIR)):
	$(MAKE) $(MFLAGS) -C $(patsubst %.clean,%,$@)/src -f Makefile clean

configurebko: make_statement
	( \
		cd install_help; \
		./configure_BKO.sh; \
	)

installinitrds: make_statement configurebko
	( \
		cd install_help; \
		./download_initramfs_images_http.sh; \
	)


