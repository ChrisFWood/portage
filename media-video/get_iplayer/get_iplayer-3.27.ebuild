# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Utility for downloading TV and radio programmes from BBC iPlayer and BBC Sounds"
HOMEPAGE="https://github.com/get-iplayer/get_iplayer/wiki"
SRC_URI="https://github.com/get-iplayer/get_iplayer/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
		dev-perl/libwww-perl
		dev-perl/LWP-Protocol-https
		dev-perl/Mojolicious
		dev-perl/XML-LibXML
		dev-perl/CGI
		media-video/rtmpdump
		media-video/atomicparsley-wez
	"
DEPEND=""
RESTRICT="mirror"

src_install() {
	dobin "${PN}"
	doman "${PN}.1"
	insinto "/usr/share/${PN}/plugins"
	newins "${FILESDIR}/plugins/localfiles.plugin" localfiles.plugin
	newins "${FILESDIR}/plugins/plugin.template" plugin.template
	newins "${FILESDIR}/plugins/podcast.plugin" podcast.plugin
}
