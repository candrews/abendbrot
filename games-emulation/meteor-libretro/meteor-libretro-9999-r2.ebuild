# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit libretro-core

DESCRIPTION="libretro implementation of Meteor. (Game Boy Advance)"
HOMEPAGE="https://github.com/libretro/meteor-libretro"
SRC_URI=""

if [[ ${PV} == 9999 ]]; then
	EGIT_REPO_URI="https://github.com/libretro/meteor-libretro.git"
	KEYWORDS=""
else
	KEYWORDS="amd64 x86"
fi

LICENSE="GPL-3"
SLOT="0"
IUSE="debug"

DEPEND=""
RDEPEND="${DEPEND}
		games-emulation/libretro-info"

S="${S}/libretro"

src_compile() {
	emake $(usex debug "DEBUG=1" "") || die "emake failed"
}