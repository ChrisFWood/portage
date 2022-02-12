# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{6,7,8,9} )
PYTHON_REQ_USE="sqlite"

inherit git-r3 python-single-r1

DESCRIPTION="Find duplicate files on your system"
HOMEPAGE="https://dupeguru.voltaicideas.net/"
EGIT_REPO_URI="https://github.com/arsenetar/dupeguru.git"
EGIT_COMMIT="11e57b0"
EGIT_SUBMODULES=(qtlib hscommon)

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="${PYTHON_DEP}
	$(python_gen_cond_dep '
	dev-python/PyQt5[${PYTHON_USEDEP},gui,widgets]
	>=dev-qt/qtgui-5.5[jpeg,png,gif]
	>=dev-python/send2trash-1.3.0[${PYTHON_USEDEP}]
	>=dev-python/hsaudiotag3k-1.1.3[${PYTHON_USEDEP}]
	')"
DEPEND="${RDEPEND}
	$(python_gen_cond_dep '
	>=dev-python/polib-1.0.4[${PYTHON_USEDEP}]
	>=dev-python/sphinx-1.2.2[${PYTHON_USEDEP}]
	')"

src_compile() {
	"${PYTHON}" -m venv --system-site-packages env
	source env/bin/activate
	"${PYTHON}" build.py || die
}

src_install() {
	dodir "/usr/share/${PN}"
	insinto "/usr/share/${PN}"
	doins -r hscommon qtlib core qt locale build/help
	exeinto "/usr/share/${PN}"
	doexe run.py
	dodir "/usr/bin"
	dosym "../share/${PN}/run.py" "/usr/bin/${PN}"
	dodir /usr/share/applications
	insinto /usr/share/applications
	doins pkg/dupeguru.desktop
	dodir /usr/share/pixmaps
	insinto /usr/share/pixmaps
	newins images/dgse_logo_128.png "${PN}.png"
}
