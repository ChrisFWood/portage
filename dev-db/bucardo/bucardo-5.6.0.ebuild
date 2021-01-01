# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

RESTRICT="test"

inherit perl-module

MY_PN="Bucardo"

DESCRIPTION="An asynchronous PostgreSQL replication system"
HOMEPAGE="http://bucardo.org/wiki/Bucardo"
SRC_URI="http://bucardo.org/downloads/${MY_PN}-${PV}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
#IUSE="test" doesn't work without extra data
IUSE=""

RESTRICT="mirror"

DEPEND="dev-perl/DBIx-Safe
	dev-perl/DBD-Pg"
RDEPEND="dev-perl/DBIx-Safe"

S=${WORKDIR}/${MY_PN}-${PV}

src_install() {
	emake DESTDIR="${D}" INSTALL_BASE="${D}" install
	keepdir /var/run/bucardo
}
