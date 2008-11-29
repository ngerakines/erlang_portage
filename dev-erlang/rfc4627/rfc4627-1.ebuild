# Copyright 2008, Nick Gerakines <nick@gerakines.net>
# Distributed under the terms of the MIT license.
# $Header: $

DESCRIPTION="An encode/decode library for rfc4627 (json)."
HOMEPAGE="http://github.com/ngerakines/rfc4627"
SRC_URI="http://github.com/tarballs/ngerakines-rfc4627-325887e7c1ec3d70e8a1ac549d9fb6f4e23ecb64.zip"
# SRC_URI="http://github.com/ngerakines/rfc4627/zipball/release-1"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 x86 ~amd64 amd64"
IUSE=""

COMMON_DEP="dev-lang/erlang"
DEPEND="${COMMON_DEP} app-arch/unzip"
RDEPEND="${COMMON_DEP}"

RESTRICT="primaryuri"

src_compile() {
	cd ngerakines-rfc4627-325887e7c1ec3d70e8a1ac549d9fb6f4e23ecb64
	mkdir ebin
	make || edie "make failed"
}

src_install() {
	cd ngerakines-rfc4627-325887e7c1ec3d70e8a1ac549d9fb6f4e23ecb64
	dodir /usr/lib/erlang/lib/${P}/ebin
	insinto /usr/lib/erlang/lib/${P}/ebin
	doins ebin/*
	dodir /usr/lib/erlang/lib/${P}/include
	insinto /usr/lib/erlang/lib/${P}/include
	doins include/*
}

