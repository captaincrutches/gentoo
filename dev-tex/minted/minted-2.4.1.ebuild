# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit latex-package eutils

DESCRIPTION="LaTeX package for source code syntax highlighting"
HOMEPAGE="https://github.com/gpoore/minted"
SRC_URI="https://github.com/gpoore/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

SLOT="0"
LICENSE="|| ( BSD LPPL-1.3 LPPL-1.3b LPPL-1.3c )"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE="doc"

RDEPEND="
	dev-texlive/texlive-latexextra
	dev-python/pygments"

S="${WORKDIR}"/${P}/source

src_install() {
	LATEX_DOC_ARGUMENTS='-shell-escape'
	latex-package_src_install
	dodoc "${S}"/../*md
}
