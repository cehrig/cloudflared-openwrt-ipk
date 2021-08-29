# cloudflared openwrt package builder

Build OpenWrt ipk archive by running

`make all`

Available environment variables:
```
OS (default: linux)
Used for downloading appropriate cloudflared version

ARCH (default: arm64)
Used for downloading appropriate cloudflared version

OPENWRT_ARCH (default: aarch64_generic)
Populated 1:1 to package config file

CLOUDFLARED_VERSION (i.e. 2021.8.6)

BUILDDIR (default: build)
Where to create the package contents including the ipk archive
```

Running `make all` is identical to 

`make all BUILDDIR=build OS=linux ARCH=arm64 OPENWRT_ARCH=aarch64_generic CLOUDFLARED_VERSION=2021.8.6`

This should create a directory tree similar to this:
```
build
├── cloudflared
│   ├── control
│   │   ├── control
│   │   ├── postinst
│   │   └── prerm
│   ├── data
│   │   ├── etc
│   │   │   └── init.d
│   │   │       └── cloudflared
│   │   ├── tmp
│   │   │   └── dnsmasq.d
│   │   │       └── cloudflared.conf
│   │   └── usr
│   │       └── bin
│   │           └── cloudflared
│   └── debian-binary
├── cloudflared.ipk
├── control.tar.gz
└── data.tar.gz

```

# Install using opkg
Copy cloudflared.ipk to your OpenWrt box and install via

`opkg install cloudflared.ipk`