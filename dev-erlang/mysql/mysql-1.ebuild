# Copyright 2008, Nick Gerakines <nick@gerakines.net>
# Distributed under the terms of the MIT license.
# $Header: $

DESCRIPTION="A native Erlang MySQL client library."
HOMEPAGE="http://github.com/ngerakines/erlang_mysql"
SRC_URI="http://github.com/tarballs/ngerakines-erlang_mysql-55144e61022b772922606ff67616e6d12f2dbce1.zip"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 amd64"
IUSE=""

COMMON_DEP="dev-lang/erlang"
DEPEND="${COMMON_DEP} app-arch/unzip"
RDEPEND="${COMMON_DEP}"

RESTRICT="primaryuri"

src_compile() {
	cd ngerakines-erlang_mysql-55144e61022b772922606ff67616e6d12f2dbce1
	make || edie "make failed"
}

src_install() {
	cd ngerakines-erlang_mysql-55144e61022b772922606ff67616e6d12f2dbce1
	# binaries
	dodir /usr/lib/erlang/lib/${P}/ebin
	insinto /usr/lib/erlang/lib/${P}/ebin
	doins ebin/*
	dodir /usr/lib/erlang/lib/${P}/include
	insinto /usr/lib/erlang/lib/${P}/include
	doins include/*
}

