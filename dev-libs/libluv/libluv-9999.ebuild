EAPI=6
# SRC_URI="https://github.com/luvit/luv/archive/${PN}-${PV}.tar.gz"
EGIT_REPO_URI="https://github.com/luvit/luv"
DEPEND="
	sys-devel/gcc
	dev-vcs/git
	dev-util/cmake
	dev-libs/libuv
	dev-lang/lua
"
SLOT=0
KEYWORDS="~amd64"

inherit git-r3 cmake-utils

BUILD_MODULE=OFF
BUILD_SHARED_LIBS=ON

src_compile() {
	emake
}

src_install() {
	dolib.so build/luv.so
}
