# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

USE_PHP="php8-0"
PHP_EXT_NAME="${PN/ext-/}"

inherit php-ext-source-r3 git-r3

DESCRIPTION="Bedrock subchunk format for PocketMine-MP 4.0"
HOMEPAGE="https://github.com/pmmp/ext-chunkutils2"
EGIT_REPO_URI="https://github.com/pmmp/ext-chunkutils2.git"

LICENSE="PHP-3.01"
SLOT="8"
KEYWORDS="~amd64"
RESTRICT="mirror"
DEPEND=""
RDEPEND="${DEPEND}"

src_unpack() {
	git-r3_src_unpack

	# create the default modules directory to be able
	# to use the php-ext-source-r3 eclass to configure/build
	ln -s ../php8.0 "${S}/modules"
}
