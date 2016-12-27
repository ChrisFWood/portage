# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: Id$

EAPI=5

DESCRIPTION="BBC Iplayer downloading application"
HOMEPAGE="http://linuxcentre.net/get_iplayer/"
SRC_URI="https://github.com/get-iplayer/get_iplayer/archive/v${PV}.tar.gz -> ${P}.tar.gz" #ftp://ftp.infradead.org/pub/get_iplayer/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

RDEPEND="|| ( media-video/mplayer
              media-video/mpv )
		virtual/ffmpeg
		media-sound/lame
		media-video/flvstreamer
		dev-perl/libwww-perl
		media-video/rtmpdump
		"
DEPEND=""

src_install() {
	dobin ${PN}
	doman ${PN}.1
	insinto /usr/share/${PN}/plugins
	doins ${FILESDIR}/plugins/*
}
