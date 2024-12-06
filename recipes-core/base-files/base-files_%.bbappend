FILESEXTRAPATHS:prepend := "${THISDIR}/base-files:"

SRC_URI += "file://issue.net file://issue"

do_install:append () {
    install -d ${D}/etc
	install -m 0755 ${WORKDIR}/issue ${D}/etc/issue
	install -m 0755 ${WORKDIR}/issue.net ${D}/etc/issue.net
}

FILES:${PN} += "/etc"