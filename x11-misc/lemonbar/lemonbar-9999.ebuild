# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

DESCRIPTION="A featherweight, lemon-scented, bar based on xcb"
HOMEPAGE="https://github.com/osense/bar"
EGIT_REPO_URI="https://github.com/osense/bar.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+xft"

DEPEND="x11-libs/libxcb
	xft? ( x11-libs/libXft )
"
RDEPEND="${DEPEND}
	dev-lang/perl
"


# S="${WORKDIR}/bar-${PV}"

src_compile() {
	emake
}
