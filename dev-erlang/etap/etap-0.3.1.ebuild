# Copyright 2008, Nick Gerakines <nick@gerakines.net>
# Distributed under the terms of the MIT license.
# $Header: $

DESCRIPTION="A TAP test harness in Erlang."
HOMEPAGE="http://github.com/ngerakines/etap"
SRC_URI="http://github.com/tarballs/ngerakines-etap-48b714744d60bac7b51c29a043755773529fd499.zip"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

COMMON_DEP="dev-lang/erlang"
DEPEND="${COMMON_DEP} app-arch/unzip"
RDEPEND="${COMMON_DEP}"

RESTRICT="primaryuri"

src_compile() {
	cd ngerakines-etap-48b714744d60bac7b51c29a043755773529fd499
	mkdir ebin
	make || edie "make failed"
}

src_install() {
    cd ngerakines-etap-48b714744d60bac7b51c29a043755773529fd499
	dodir /usr/lib/erlang/lib/${P}/ebin
	insinto /usr/lib/erlang/lib/${P}/ebin
	doins ebin/*.beam
}


