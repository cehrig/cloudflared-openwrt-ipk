# cloudflared openwrt package builder

Build OpenWrt ipk archive by running

`make all ARCH=arm64 OPENWRT_ARCH=aarch64_generic BUILDDIR=build`

This should create a directory tree similar to this:
```
build
├── cloudflared
│   ├── control
│   │   ├── control
│   │   ├── postinst
│   │   └── prerm
│   ├── data
│   │   └── usr
│   │       └── bin
│   │           └── cloudflared
│   └── debian-binary
├── cloudflared.ipk
├── control.tar.gz
└── data.tar.gz
```

# Install using opkg
`opkg install cloudflared.ipk`