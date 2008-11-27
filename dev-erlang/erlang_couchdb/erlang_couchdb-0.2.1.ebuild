# Copyright 2008, Nick Gerakines <nick@gerakines.net>
# Distributed under the terms of the MIT license.
# $Header: $

DESCRIPTION="An Erlang client library for the CouchDB data store."
HOMEPAGE="http://github.com/ngerakines/erlang_couchdb"
SRC_URI="http://github.com/tarballs/ngerakines-erlang_couchdb-46513109772296e6b2768e4d2d543383f597709a.zip"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

COMMON_DEP="dev-lang/erlang"
DEPEND="${COMMON_DEP} app-arch/unzip"
RDEPEND="${COMMON_DEP}"

RESTRICT="primaryuri"

src_compile() {
	cd ngerakines-erlang_couchdb-46513109772296e6b2768e4d2d543383f597709a
	make || edie "make failed"
}

src_install() {
    cd ngerakines-erlang_couchdb-46513109772296e6b2768e4d2d543383f597709a
	dodir /usr/lib/erlang/lib/${P}/ebin
	insinto /usr/lib/erlang/lib/${P}/ebin
	doins *.beam
}

