# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: teamviewer version 7 binary $

EAPI=4

DESCRIPTION="Teamviewer remote management software"
HOMEPAGE="http://www.teamviewer.com"
SLOT="0"
IUSE=""
KEYWORDS="amd64 x86"

SRC_URI="http://www.teamviewer.com/download/teamviewer_linux.tar.gz"

DEPEND=""
RDEPEND="${DEPEND}"

S=${WORKDIR}/${PN}${PV}

src_install() {

	local dest="${D}/opt/teamviewer"
	mkdir -p "${dest}"
	cp -R "${WORKDIR}/teamviewer"*/. "${dest}" || die
	dosym /opt/teamviewer/teamviewer /usr/bin/teamviewer || die
	fowners root /opt/teamviewer
	fperms 777 /opt/teamviewer

}

pkg_postrm() {

	rm -rf "/opt/${PN}"
	rm "/usr/bin/${PN}"

}
