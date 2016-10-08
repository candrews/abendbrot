# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit libretro-core

DESCRIPTION="libretro implementation of Mednafen Cygne. (WonderSwan/WonderSwan Color)"
HOMEPAGE="https://github.com/libretro/beetle-wswan-libretro"
SRC_URI="https://github.com/libretro/beetle-wswan-libretro/archive/bfb908cf56c552aca50ce606e3e88944870158d2.tar.gz -> ${P}.tar.gz"
RESTRICT="primaryuri"

S="${WORKDIR}/beetle-wswan-libretro-bfb908cf56c552aca50ce606e3e88944870158d2"

if [[ ${PV} == 9999 ]]; then
	EGIT_REPO_URI="https://github.com/libretro/beetle-wswan-libretro.git"
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

LIBRETRO_CORE_NAME=mednafen_wswan

src_compile() {
	emake $(usex debug "DEBUG=1" "") core=wswan || die "emake failed"
}