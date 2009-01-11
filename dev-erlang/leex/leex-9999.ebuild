# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit git

DESCRIPTION="Leex is a lexical analyzer generator for Erlang."
HOMEPAGE="http://github.com/rvirding/leex/tree/master"
SRC_URI=""
EGIT_REPO_URI="git://github.com/rvirding/leex.git"

LICENSE="EPL"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="doc"

DEPEND=""
RDEPEND=">=dev-lang/erlang-12.2.0"

src_compile() {
	emake || die
	use doc || emake docs
}

src_install() {
	insinto /usr/lib/${PN}
	doins -r ebin examples include src || die
	dodoc doc/* README TODO
	dosym /usr/lib/${PN} /usr/lib/erlang/lib/${PN} || die
}
