# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

USE_PHP="php7-2 php7-3"
PHP_EXT_NAME="${PN}"

inherit php-ext-source-r3

DESCRIPTION="Threading for PHP - Share Nothing, Do Everything :)"
HOMEPAGE="https://github.com/krakjoe/pthreads/"
SRC_URI="https://github.com/krakjoe/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="PHP-3.01"
SLOT="7"
KEYWORDS="~amd64 ~arm64 ~x86"
IUSE=""
RESTRICT="mirror"
DEPEND="
	php_targets_php7-2? ( dev-lang/php:7.2[threads] )
	php_targets_php7-3? ( dev-lang/php:7.3[threads] )
"
RDEPEND="${DEPEND}"
