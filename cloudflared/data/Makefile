SUBDIRS = usr
FILES_COPY = debian-binary
include $(TOPDIR)/directory-handler.mk

all: $(OUT_DIR) $(SUBDIRS)

$(SUBDIRS):
	$(MAKE) -C $@ all

.PHONY: $(SUBDIRS)