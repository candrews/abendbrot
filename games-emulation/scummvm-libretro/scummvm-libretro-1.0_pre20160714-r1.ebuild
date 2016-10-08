# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit libretro-core

DESCRIPTION="libretro implementation of ScummVM"
HOMEPAGE="https://github.com/libretro/scummvm"
SRC_URI="https://github.com/libretro/scummvm/archive/2094f569865d977739ccf07372363615097a1212.tar.gz -> ${P}.tar.gz"
RESTRICT="primaryuri"

S="${WORKDIR}/scummvm-2094f569865d977739ccf07372363615097a1212"

if [[ ${PV} == 9999 ]]; then
	EGIT_REPO_URI="https://github.com/libretro/scummvm.git"
	KEYWORDS=""
else
	KEYWORDS="amd64 x86"
fi

LICENSE="GPL-2"
SLOT="0"
IUSE="debug"

DEPEND=""
RDEPEND="${DEPEND}
		games-emulation/libretro-info"

S="${S}/backends/platform/libretro/build"

src_compile() {
	emake $(usex debug "DEBUG=1" "") || die "emake failed"
}