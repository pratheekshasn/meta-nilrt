FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

PV = "${DISTRO_VERSION}"

inherit allarch package_ipk

SRC_URI += " \
	file://nilrt-feed-2019.gpg \
	file://nilrt-feed-2023.gpg \
	file://test.gpg \
"

# FILES_${PN} += "${D}CONTROL"
# FILES_${PN} += "${D}CONTROL/control"

do_install:append() {
	# Install NI signing keys
	install -m 0444 ${WORKDIR}/nilrt-feed-2019.gpg ${D}${datadir}/opkg/keyrings/
	install -m 0444 ${WORKDIR}/nilrt-feed-2023.gpg ${D}${datadir}/opkg/keyrings/
	install -m 0444 ${WORKDIR}/test.gpg ${D}${datadir}/opkg/keyrings/

	# control_dir = ${PKGDESTWORK}/CONTROL
	# install -d ${D}/CONTROL
	# bb.warn("Control dir created at " + control_dir)
	# bb.warn(${PKGDESTWORK}/CONTROL)
	# touch ${PKGDESTWORK}/CONTROL/control
}

# def write_user_visible_control_file(){
# 	# Your code here
#     print("ControlFile:")
# }

# do_package:prepend() {
# 	# write_user_visible_control_file()
#     control_file=d.getVar('D') + "/CONTROL/control"
#     # print("ControlFile:")
#     bb.warn("ControlFile:" + control_file)
#     if not os.path.exists(d.getVar('D')+ "/CONTROL"):
#         # Create control file if it does not exist
#         bb.warn("Control dir doesn't exist")
#         bb.utils.mkdirhier(d.getVar('D') + "/CONTROL")
#     if not os.path.exists(d.getVar('D')+ "/CONTROL"):
#         bb.warn("Control dir still doesn't exist")
#     with open(control_file, "a+") as f:
#         f.write("UserVisible: yes" + "\n")
#     if not os.path.exists(control_file):
#         bb.warn("Control file doesn't exist")
#     # Add UserVisible flag to control file
#     # echo "UserVisible: yes" >> $control_file
# }
