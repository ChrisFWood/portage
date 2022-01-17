# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A server software for Minecraft: Bedrock Edition in PHP"
HOMEPAGE="https://pmmp.io/"

SRC_URI="https://github.com/pmmp/PocketMine-MP/releases/download/${PV}/PocketMine-MP.phar -> ${P}.phar
https://github.com/pmmp/PocketMine-MP/releases/download/${PV}/start.sh -> ${P}.start.sh"
LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="
		${DEPEND}
		dev-php/pthreads
		dev-php/pecl-crypto
		dev-php/igbinary
		dev-php/php-leveldb
		dev-php/pecl-yaml
		dev-php/ext-chunkutils2
		dev-php/ext-morton
		dev-lang/php:8.0[cli,nls,ctype,threads,zip,phar,gmp,readline,zlib,curl,bcmath,ssl,sockets,unicode,ipv6]
"
DEPEND="
		acct-group/minecraft
		acct-user/minecraft
"
RESTRICT="bindist mirror"

S="${WORKDIR}"

src_install() {
	doinitd "${FILESDIR}/init.d/pocketmine-mp"
	dodir "/var/lib/${PN}"
	exeinto "/var/lib/${PN}"
	newexe "${DISTDIR}/${P}.start.sh" start.sh
	insinto "/var/lib/${PN}"
	newins "${DISTDIR}/${P}.phar" PocketMine-MP.phar
	fowners -R minecraft:minecraft "/var/lib/${PN}"
}
