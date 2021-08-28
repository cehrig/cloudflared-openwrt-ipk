SUBDIRS = usr tmp etc
include $(TOPDIR)/directory-handler.mk

all: $(OUT_DIR) $(SUBDIRS)

$(SUBDIRS):
	$(MAKE) -C $@ all

.PHONY: $(SUBDIRS)