# Copyright 2008, Nick Gerakines <nick@gerakines.net>
# Distributed under the terms of the MIT license.
# $Header: $

DESCRIPTION="An Erlang client library for fetching World of Warcraft Armory
data."
HOMEPAGE="http://github.com/ngerakines/erlang_wowarmory"
SRC_URI="http://github.com/tarballs/ngerakines-erlang_wowarmory-8933588a9f634c046bd1c903ebf48f8d12714e14.zip"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 x86 ~amd64 amd64"
IUSE="source"

COMMON_DEP="dev-lang/erlang"
DEPEND="${COMMON_DEP} app-arch/unzip"
RDEPEND="${COMMON_DEP}"

RESTRICT="primaryuri"

src_compile() {
	cd ngerakines-erlang_wowarmory-8933588a9f634c046bd1c903ebf48f8d12714e14
	make || edie "make failed"
}

src_install() {
	# binaries
	dodir /usr/lib/erlang/lib/${P}/ebin
	insinto /usr/lib/erlang/lib/${P}/ebin
	doins ngerakines-erlang_wowarmory-8933588a9f634c046bd1c903ebf48f8d12714e14/*.beam

	# source code
	if use source ; then
		dodir /usr/lib/erlang/lib/${P}/src
		insinto /usr/lib/erlang/lib/${P}/src
		doins ngerakines-erlang_wowarmory-8933588a9f634c046bd1c903ebf48f8d12714e14/src/*
	fi
}

