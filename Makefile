
compile get-deps ling-build-image:
	rebar $@

ling: ling-build-image

run:
	erl -pa ebin -boot start_sasl -s inets -run etftp_app run ./priv

files:
	mkdir -p priv
	cd priv; wget -qc http://storage.core-os.net/coreos/amd64-generic/72.0.0/coreos_production_pxe.vmlinuz
	cd priv; wget -qc http://storage.core-os.net/coreos/amd64-generic/72.0.0/coreos_production_pxe_image.cpio.gz
	wget -qc https://www.kernel.org/pub/linux/utils/boot/syslinux/syslinux-6.01.tar.gz
	cd priv; tar xvzf ../syslinux-6.01.tar.gz syslinux-6.01/bios/core/pxelinux.bin syslinux-6.01/bios/com32/elflink/ldlinux/ldlinux.c32
	cd priv; mv -f syslinux-6.01/bios/com32/elflink/ldlinux/ldlinux.c32 .
	cd priv; mv -f syslinux-6.01/bios/core/pxelinux.bin .
	rm -rf priv/syslinux-6.01

