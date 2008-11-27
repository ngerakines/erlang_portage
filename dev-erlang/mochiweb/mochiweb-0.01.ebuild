# Copyright 2008, Nick Gerakines <nick@gerakines.net>
# Distributed under the terms of the MIT license.
# $Header: $

DESCRIPTION="MochiWeb is an Erlang library for building lightweight HTTP servers."
HOMEPAGE="http://github.com/ngerakines/mochiweb"
SRC_URI="http://github.com/tarballs/ngerakines-mochiweb-32b3bc0a785b8cf64fb1191ded504ea3ae96417f.zip"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

COMMON_DEP="dev-lang/erlang"
DEPEND="${COMMON_DEP} app-arch/unzip"
RDEPEND="${COMMON_DEP}"

RESTRICT="primaryuri"

src_compile() {
	cd ngerakines-mochiweb-32b3bc0a785b8cf64fb1191ded504ea3ae96417f
	mkdir ebin
	make || edie "make failed"
}

src_install() {
    cd ngerakines-mochiweb-32b3bc0a785b8cf64fb1191ded504ea3ae96417f
	# binaries
	dodir /usr/lib/erlang/lib/${P}/ebin
	insinto /usr/lib/erlang/lib/${P}/ebin
	doins ebin/*
}

