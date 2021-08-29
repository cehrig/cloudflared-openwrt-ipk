# build relevant variables
SHELL = /bin/bash
ARCH ?= arm64
OPENWRT_ARCH ?= aarch64_generic
CLOUDFLARED_VERSION ?= 2021.8.6
OS ?= linux
BUILDDIR ?= $(abspath build)
TOPDIR = $(PWD)
SUBDIRS = cloudflared

# cloudflared specific variables
CLOUDFLARED_LISTEN_ADDRESS ?= 127.0.0.1
CLOUDFLARED_LISTEN_PORT ?= 5353

# send variables downstream
export SHELL
export ARCH
export OPENWRT_ARCH
export CLOUDFLARED_VERSION
export CLOUDFLARED_LISTEN_ADDRESS
export CLOUDFLARED_LISTEN_PORT
export OS
export BUILDDIR
export TOPDIR

check-env:
ifeq ("$(ARCH)", "arm64")
else ifeq ("$(ARCH)", "arm")
else
	$(error Architecture must be one of arm64, arm)
endif

all: check-env $(BUILDDIR) $(SUBDIRS) control data ipk
control: $(BUILDDIR)/control.tar.gz
data: $(BUILDDIR)/data.tar.gz
ipk: $(BUILDDIR)/cloudflared.ipk

$(BUILDDIR):
	mkdir -p $(BUILDDIR)

$(SUBDIRS):
	$(MAKE) -C $@ all

$(BUILDDIR)/control.tar.gz: $(SUBDIRS)
	tar --numeric-owner --group=0 --owner=0 -zcvf $@ -C $(BUILDDIR)/cloudflared/control .

$(BUILDDIR)/data.tar.gz: $(SUBDIRS)
	tar --numeric-owner --group=0 --owner=0 -zcvf $@ -C $(BUILDDIR)/cloudflared/data .

$(BUILDDIR)/cloudflared.ipk: control data
	tar -zcvf $@ -C $(BUILDDIR)/cloudflared debian-binary -C $(BUILDDIR) data.tar.gz control.tar.gz
	rm -r $(BUILDDIR)/cloudflared

.PHONY: check-env all control data ipk $(SUBDIRS)