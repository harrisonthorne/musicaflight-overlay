# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit bash-completion-r1 git-r3 systemd udev

DESCRIPTION="Automatically select a display configuration based on connected devices"
HOMEPAGE="https://github.com/phillipberndt/${PN}"
EGIT_REPO_URI="https://github.com/phillipberndt/${PN}.git"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS=""
IUSE="bash-completion pm-utils systemd udev"

DEPEND="
	virtual/pkgconfig
	${RDEPEND}
"
RDEPEND="
	bash-completion? ( app-shells/bash )
	pm-utils? ( sys-power/pm-utils )
	systemd? ( sys-apps/systemd )
	udev? ( virtual/udev )
"

src_install() {
	targets="autorandr autostart_config"
	if use bash-completion; then
		targets="$targets bash_completion"
	fi
	if use pm-utils; then
		targets="$targets pmutils"
	fi
	if use systemd; then
		targets="$targets systemd"
	fi
	if use udev; then
		targets="$targets udev"
	fi

	emake DESTDIR="${D}" \
		  install \
		  BASH_COMPLETION_DIR="$(get_bashcompdir)" \
		  SYSTEMD_UNIT_DIR="$(systemd_get_systemunitdir)" \
		  UDEV_RULES_DIR="$(get_udevdir)"/rules.d \
		  TARGETS="$targets"
}

pkg_postinst() {
	if use udev; then
		udev_reload
	fi
}
