# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

USE_PHP="php8-0"
PHP_EXT_NAME="${PN}"

inherit php-ext-source-r3 git-r3

DESCRIPTION="Threading for PHP - Share Nothing, Do Everything :)"
HOMEPAGE="https://github.com/pmmp/pthreads"
EGIT_REPO_URI="https://github.com/pmmp/pthreads.git"
EGIT_BRANCH="fork"

LICENSE="PHP-3.01"
SLOT="8"
KEYWORDS="~amd64"
RESTRICT="mirror"
DEPEND="
	dev-lang/php:8.0[threads]
"
RDEPEND="${DEPEND}"

src_unpack() {
	git-r3_src_unpack

	# create the default modules directory to be able
	# to use the php-ext-source-r3 eclass to configure/build
	ln -s src "${S}/modules"
}
