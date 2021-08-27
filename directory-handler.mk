OUT_DIR = $(BUILDDIR)/$(subst $(TOPDIR)/,,$(CURDIR))

$(OUT_DIR):
	mkdir -p $(OUT_DIR)