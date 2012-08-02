# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

KDE_REQUIRED="optional"
inherit kde4-base

DESCRIPTION="Cantata is a client for the music player daemon (MPD)"
HOMEPAGE="http://kde-apps.org/content/show.php?content=147733"
SRC_URI="http://${PN}.googlecode.com/files/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="4"
KEYWORDS="~amd64 ~x86"
IUSE="ffmpeg kde mpg123 mtp taglib"

DEPEND="
	media-libs/speex
	ffmpeg? ( virtual/ffmpeg )
	mpg123? ( media-sound/mpg123 )
	mtp? ( media-libs/libmtp )
	taglib? ( media-libs/taglib )"
RDEPEND="${DEPEND}
	$(add_kdebase_dep oxygen-icons)"
src_prepare() {
	#fix bug 428400
	epatch "${FILESDIR}/${PN}-kde_less_build.patch"
}
src_configure() {
	local mycmakeargs
	mycmakeargs=(
		$(cmake-utils_use_enable ffmpeg)
		$(cmake-utils_use_enable mpg123)
		$(cmake-utils_use_enable mtp)
		$(cmake-utils_use_enable taglib)
		$(cmake-utils_use_want kde KDE_SUPPORT)
	)
	kde4-base_src_configure
}
