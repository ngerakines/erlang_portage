# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $$

inherit eutils mercurial

DESCRIPTION="RabbitMQ AMQP server."
HOMEPAGE="http://www.rabbitmq.com/server.html"

SRC_URI=""

LICENSE="MPL"
SLOT="0"
KEYWORDS="~x86 ~ppc ~sparc ~amd64"
IUSE=""

DEPEND="dev-lang/erlang
		dev-python/simplejson"

RDEPEND="${DEPEND}"

S=${WORKDIR}/rabbitmq-server

EHG_REVISION=rabbitmq_v1_6_0

src_unpack() {
	mercurial_fetch http://hg.rabbitmq.com/rabbitmq-codegen/
	mercurial_fetch http://hg.rabbitmq.com/rabbitmq-server/
	cd "${S}"
}

src_install() {
	# erlang module
	local targetdir="/usr/$(get_libdir)/erlang/lib/${PN/-/_}-${PV}/"

	einfo "Correcting additional Erlang code path in scripts"
	sed -i -e "s:\`dirname \$0\`\/..\/ebin:${targetdir}:g" scripts/* || die "sed failed"

	einfo "Installing Erlang module to ${targetdir}"
	dodir "${targetdir}"
	cp -dpR ebin include "${D}/${targetdir}"

	einfo "Installing server scripts to /usr/sbin"
	# Install server scripts to sbin
	dosbin scripts/rabbitmq-multi scripts/rabbitmq-server

	einfo "Installing rabbitmqctl to /usr/bin"
	# Install control script to bin
	dobin scripts/rabbitmqctl

	# create the directory where our log file will go.
	diropts -m 0770 -o rabbitmq -g rabbitmq
	keepdir /var/log/rabbitmq

	# create the mnesia directory
	diropts -m 0770 -o rabbitmq -g rabbitmq
	dodir /var/lib/rabbitmq/mnesia

	# Install the init script
	newinitd "${FILESDIR}"/rabbitmq-server.init rabbitmq
}

pkg_setup() {
	enewgroup rabbitmq
	enewuser rabbitmq -1 -1 -1 rabbitmq
}
