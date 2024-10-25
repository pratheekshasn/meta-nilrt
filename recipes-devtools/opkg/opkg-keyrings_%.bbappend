FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

PV = "${DISTRO_VERSION}"

inherit allarch package_ipk

SRC_URI += " \
	file://nilrt-feed-2019.gpg \
	file://nilrt-feed-2023.gpg \
"

PACKAGE_ADD_METADATA_IPK = "UserVisible: yes"

do_install:append() {
	# Install NI signing keys
	install -m 0444 ${WORKDIR}/nilrt-feed-2019.gpg ${D}${datadir}/opkg/keyrings/
	install -m 0444 ${WORKDIR}/nilrt-feed-2023.gpg ${D}${datadir}/opkg/keyrings/
	install -m 0444 ${WORKDIR}/test.gpg ${D}${datadir}/opkg/keyrings/
}
