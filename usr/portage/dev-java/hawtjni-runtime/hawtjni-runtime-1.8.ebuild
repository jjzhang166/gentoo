# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-java/hawtjni-runtime/hawtjni-runtime-1.8.ebuild,v 1.2 2014/01/08 19:43:53 tomwij Exp $

EAPI="5"

JAVA_PKG_IUSE="doc source"

inherit vcs-snapshot java-pkg-2 java-pkg-simple

MY_P="hawtjni-project-${PV}"

DESCRIPTION="A JNI code generator based on the generator used by the Eclipse SWT project"
HOMEPAGE="http://jansi.fusesource.org/"
SRC_URI="https://github.com/fusesource/hawtjni/tarball/${MY_P} -> ${MY_P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=">=virtual/jdk-1.5"
RDEPEND=">=virtual/jre-1.5"

S="${WORKDIR}/${MY_P}/${PN}"

JAVA_SRC_DIR="src/main/java"

java_prepare() {
	# Easier to use java-pkg-simple.
	rm -v pom.xml || die
}

src_install() {
	java-pkg-simple_src_install

	dodoc ../{changelog,notice,readme}.md
}
