# Copyright 2008, Nick Gerakines <nick@gerakines.net>
# Distributed under the terms of the MIT license.
# $Header: $

DESCRIPTION="An Erlang client library for the Facebook Platform."
HOMEPAGE="http://github.com/ngerakines/erlang_facebook"
SRC_URI="http://github.com/tarballs/ngerakines-erlang_facebook-62c6fe0daef3429bbb91189124e3d3b153de3f64.zip"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 x86 ~amd64 amd64"
IUSE="source"

COMMON_DEP="dev-lang/erlang"
DEPEND="${COMMON_DEP} app-arch/unzip"
RDEPEND="${COMMON_DEP}"

RESTRICT="primaryuri"

src_compile() {
	cd ngerakines-erlang_facebook-62c6fe0daef3429bbb91189124e3d3b153de3f64
	make || edie "make failed"
}

src_install() {
	# binaries
	dodir /usr/lib/erlang/lib/${P}/ebin
	insinto /usr/lib/erlang/lib/${P}/ebin
	doins ngerakines-erlang_facebook-62c6fe0daef3429bbb91189124e3d3b153de3f64/*.beam

	# source code
	if use source ; then
		dodir /usr/lib/erlang/lib/${P}/src
		insinto /usr/lib/erlang/lib/${P}/src
		doins ngerakines-erlang_facebook-62c6fe0daef3429bbb91189124e3d3b153de3f64/src/*
	fi
}

