SUBDIRS = control data
FILES_COPY = debian-binary
include $(TOPDIR)/directory-handler.mk
include $(TOPDIR)/files-copy.mk

all: files-copy $(SUBDIRS)

$(SUBDIRS):
	$(MAKE) -C $@ all

.PHONY: files-copy $(SUBDIRS)