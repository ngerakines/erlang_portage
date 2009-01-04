# Copyright 2008, Nick Gerakines <nick@gerakines.net>
# Distributed under the terms of the MIT license.
# $Header: $

DESCRIPTION="A TAP test harness in Erlang."
HOMEPAGE="http://ngerakines.github.com/etap"
SRC_URI="http://ngerakines.github.com/etap/sources/etap-0.3.2.tgz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 x86 ~amd64 amd64"
IUSE=""

COMMON_DEP="dev-lang/erlang"
DEPEND="${COMMON_DEP} app-arch/unzip"
RDEPEND="${COMMON_DEP}"

RESTRICT="primaryuri"

src_compile() {
	mkdir ebin
	make || edie "make failed"
}

src_install() {
	dodir /usr/lib/erlang/lib/${P}/ebin
	insinto /usr/lib/erlang/lib/${P}/ebin
	doins ebin/*.beam
}


