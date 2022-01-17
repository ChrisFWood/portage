# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
MY_P="${PN}-${PV/_rc/RC}"
PHP_EXT_NAME="${PN/php-/}"
PHP_EXT_INI="yes"
PHP_EXT_ZENDEXT="no"
DOCS=( CREDITS README.md )
PHP_EXT_ECONF_ARGS=( --with-leveldb=/usr/lib64 )

USE_PHP="php8-0"

inherit php-ext-source-r3 git-r3

KEYWORDS="~amd64"

DESCRIPTION="The PHP Binding for LevelDB"
HOMEPAGE="https://github.com/pmmp/php-leveldb"
EGIT_REPO_URI="https://github.com/pmmp/php-leveldb.git"
EGIT_BRANCH="pmmp-mojang-compatible"

LICENSE="PHP-3.01"
DEPEND="dev-libs/pmmp-leveldb"
RDEPEND="${DEPEND}"

SLOT="0"

src_unpack() {
	git-r3_src_unpack

	# create the default modules directory to be able
	# to use the php-ext-source-r3 eclass to configure/build
	ln -s ../php8.0 "${S}/modules"
}
