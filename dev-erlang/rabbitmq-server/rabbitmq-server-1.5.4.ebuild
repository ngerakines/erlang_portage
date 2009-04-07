# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $$

inherit eutils

DESCRIPTION="RabbitMQ AMQP server."
HOMEPAGE="http://www.rabbitmq.com/server.html"
SRC_URI="http://www.rabbitmq.com/releases/rabbitmq-server/v${PV}/${P}.tar.gz"
LICENSE="MPL"
SLOT="0"
KEYWORDS="~x86 ~ppc ~sparc ~amd64"
IUSE=""

DEPEND="dev-lang/erlang
		dev-python/simplejson"

src_install() {
		make install TARGET_DIR="${D}/usr/lib/erlang/lib/${PN}/" \
			 		 SBIN_DIR="${D}/usr/sbin/" \
					 MAN_DIR="${D}/usr/lib/erlang/man/"
}
