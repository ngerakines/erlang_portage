# Copyright 2008, Nick Gerakines <nick@gerakines.net>
# Distributed under the terms of the MIT license.
# $Header: $

DESCRIPTION="A native Erlang MySQL client library."
HOMEPAGE="http://github.com/ngerakines/erlang_mysql"
SRC_URI="http://portage.socklabs.com/${P}.tgz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 x86 ~amd64 amd64"
IUSE=""

COMMON_DEP="dev-lang/erlang"
DEPEND="${COMMON_DEP} app-arch/unzip"
RDEPEND="${COMMON_DEP}"

RESTRICT="primaryuri"

src_compile() {
	make || edie "make failed"
}

src_install() {
	dodir /usr/lib/erlang/lib/${P}/ebin
	insinto /usr/lib/erlang/lib/${P}/ebin
	doins ebin/*
	dodir /usr/lib/erlang/lib/${P}/include
	insinto /usr/lib/erlang/lib/${P}/include
	doins include/*
}

