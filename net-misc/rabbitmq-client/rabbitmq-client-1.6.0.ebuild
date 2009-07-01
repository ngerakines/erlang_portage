# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $$

inherit eutils mercurial

DESCRIPTION="RabbitMQ AMQP erlang client."
HOMEPAGE="http://hg.rabbitmq.com/rabbitmq-erlang-client/"

SRC_URI=""

LICENSE="MPL"
SLOT="0"
KEYWORDS="~x86 ~ppc ~sparc ~amd64"
IUSE=""

DEPEND="net-misc/rabbitmq-server"

RDEPEND="${DEPEND}"

S=${WORKDIR}/rabbitmq-erlang-client

EHG_REVISION=rabbitmq_v1_6_0

src_unpack() {
	mercurial_fetch http://hg.rabbitmq.com/rabbitmq-codegen/
	mercurial_fetch http://hg.rabbitmq.com/rabbitmq-server/
	mercurial_fetch http://hg.rabbitmq.com/rabbitmq-erlang-client/
	cd "${S}"
}

src_compile() {
	cd ${WORKDIR}/rabbitmq-server
	make
	cd ${WORKDIR}/rabbitmq-erlang-client
	make
}

src_install() {
	# erlang module
	local targetdir="/usr/$(get_libdir)/erlang/lib/${PN/-/_}-${PV}/"

	einfo "Installing Erlang module to ${targetdir}"
	dodir "${targetdir}"
	cp -dpR ebin include "${D}/${targetdir}"
}

