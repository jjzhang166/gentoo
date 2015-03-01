# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-haskell/cabal-install/cabal-install-0.14.0.ebuild,v 1.4 2014/07/25 09:16:27 slyfox Exp $

# ebuild generated by hackport 0.2.17.9999

EAPI=4

CABAL_FEATURES="bin"
inherit haskell-cabal bash-completion-r1 eutils

DESCRIPTION="The command-line interface for Cabal and Hackage"
HOMEPAGE="http://www.haskell.org/cabal/"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~ia64 ~ppc64 ~sparc ~x86"
IUSE="+noprefs"

RDEPEND=""
DEPEND="${RDEPEND}
		>=dev-haskell/cabal-1.14.0 <dev-haskell/cabal-1.15
		>=dev-haskell/http-4000.0.2 <dev-haskell/http-4001
		>=dev-haskell/mtl-2.0 <dev-haskell/mtl-3
		>=dev-haskell/network-1 <dev-haskell/network-3
		>=dev-haskell/random-1 <dev-haskell/random-1.1
		>=dev-haskell/zlib-0.4 <dev-haskell/zlib-0.6
		>=dev-lang/ghc-6.10.1"

src_prepare() {
	if use noprefs; then
		epatch "${FILESDIR}/${PN}"-0.13.3-nopref.patch
	fi
}

src_install() {
	haskell-cabal_src_install

	newbashcomp "${S}/bash-completion/cabal" ${PN}
}