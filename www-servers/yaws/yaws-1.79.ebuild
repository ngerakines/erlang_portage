# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/www-servers/yaws/yaws-1.58.ebuild,v 1.1 2006/04/14 06:10:54 mkennedy Exp $

inherit eutils

DESCRIPTION="Yaws is a high performance HTTP 1.1 web server."
HOMEPAGE="http://yaws.hyber.org/"
SRC_URI="http://yaws.hyber.org/download/${P}.tar.gz"
LICENSE="BSD"
SLOT="0"
KEYWORDS="~x86 ~ppc ~sparc ~amd64"
IUSE=""

DEPEND="dev-lang/erlang"

# see http://bugs.gentoo.org/show_bug.cgi?id=97707

src_unpack() {
	unpack ${A}
	find ${S} -depth -type d -name .xvpics -exec rm -rf '{}' \;
}

src_install() {
	make DESTDIR=${D} install || die
	# Use /var/log and not /var/lib/log for Yaws logging directory
	rm -rf ${D}/var/lib/log
	sed -i -e 's,/var/lib/log,/var/log,g' \
		-e 's,#.*username = root.*,username = nobody,g' \
		${D}/etc/yaws.conf
	keepdir /var/log/yaws
	# We need to keep these directories so that the example yaws.conf works
	# properly
	keepdir /usr/lib/yaws/examples/ebin
	keepdir /usr/lib/yaws/examples/include
	dodoc ChangeLog LICENSE README
	newinitd ${FILESDIR}/yaws.init.d yaws
	newconfd ${FILESDIR}/yaws.conf.d yaws
}
