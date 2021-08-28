SUBDIRS = $(subst /,,$(subst $(BUILDDIR),,$(wildcard */)))
include $(TOPDIR)/directory-handler.mk

all: $(OUT_DIR) $(OUT_DIR)/cloudflared $(SUBDIRS)

$(SUBDIRS):
	$(MAKE) -C $@ all

$(OUT_DIR)/cloudflared:
	curl -fL https://github.com/cloudflare/cloudflared/releases/download/$(CLOUDFLARED_VERSION)/cloudflared-$(OS)-$(ARCH) \
		-o $(OUT_DIR)/cloudflared
	chmod +x $(OUT_DIR)/cloudflared

.PHONY: $(SUBDIRS)