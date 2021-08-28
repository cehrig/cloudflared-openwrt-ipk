# we are using uci for adding the dnsmasq config at the moment, check etc/init.c/cloudflared
# FILES_COPY = cloudflared.conf
include $(TOPDIR)/directory-handler.mk
include $(TOPDIR)/files-copy.mk

all: files-copy $(SUBDIRS)

.PHONY: files-copy $(SUBDIRS)