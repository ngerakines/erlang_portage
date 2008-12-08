# Copyright 2008, Nick Gerakines <nick@gerakines.net>
# Distributed under the terms of the MIT license.
# $Header: $

DESCRIPTION="An Erlang client library for the Facebook Platform."
HOMEPAGE="http://github.com/ngerakines/erlang_facebook"
SRC_URI="http://portage.socklabs.com/${P}.tgz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 x86 ~amd64 amd64"
IUSE="source"

COMMON_DEP="dev-lang/erlang dev-erlang/mochiweb"
DEPEND="${COMMON_DEP} app-arch/unzip"
RDEPEND="${COMMON_DEP}"

RESTRICT="primaryuri"

src_compile() {
	make || edie "make failed"
}

src_install() {
	# binaries
	dodir /usr/lib/erlang/lib/${P}/ebin
	insinto /usr/lib/erlang/lib/${P}/ebin
	doins *.beam

	# source code
	if use source ; then
		dodir /usr/lib/erlang/lib/${P}/src
		insinto /usr/lib/erlang/lib/${P}/src
		doins src/*
	fi
}

