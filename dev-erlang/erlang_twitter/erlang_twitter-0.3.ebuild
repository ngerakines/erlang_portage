# Copyright 2008, Nick Gerakines <nick@gerakines.net>
# Distributed under the terms of the MIT license.
# $Header: $

DESCRIPTION="An Erlang client library for the Twitter web service."
HOMEPAGE="http://github.com/ngerakines/erlang_twitter"
SRC_URI="http://github.com/tarballs/ngerakines-erlang_twitter-becb61124fe7b6fa7797b2edd6f450c66ef9fd22.zip"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86"
IUSE="source"

COMMON_DEP="dev-lang/erlang"
DEPEND="${COMMON_DEP} app-arch/unzip"
RDEPEND="${COMMON_DEP}"

RESTRICT="primaryuri"

src_compile() {
	cd ngerakines-erlang_twitter-becb61124fe7b6fa7797b2edd6f450c66ef9fd22
	make || edie "make failed"
}

src_install() {
	# binaries
	dodir /usr/lib/erlang/lib/${P}/ebin
	insinto /usr/lib/erlang/lib/${P}/ebin
	doins ngerakines-erlang_twitter-becb61124fe7b6fa7797b2edd6f450c66ef9fd22/*.beam

	# source code
	if use source ; then
		dodir /usr/lib/erlang/lib/${P}/src
		insinto /usr/lib/erlang/lib/${P}/src
		doins ngerakines-erlang_twitter-becb61124fe7b6fa7797b2edd6f450c66ef9fd22/src/*
	fi
}

