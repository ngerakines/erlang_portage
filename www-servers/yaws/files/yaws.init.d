#!/sbin/runscript
# $Header: /var/cvsroot/gentoo-x86/www-servers/yaws/files/yaws.init.d,v 1.1 2006/04/14 06:10:54 mkennedy Exp $

opts="start stop reload status"

depend() {
	need net
}

start() {
	ebegin "Starting ${SVCNAME}"
	$YAWS_DAEMON -D $YAWS_DAEMON_OPTS -I ${YAWS_ID}
	eend $?
}

stop() {
	ebegin "Stopping ${SVCNAME}"
	$YAWS_DAEMON -s -I ${YAWS_ID}
	eend $?
}

reload() {
	ebegin "Reloading ${SVCNAME}"
	$YAWS_DAEMON -h -I ${YAWS_ID}
	eend $?
}

status() {
	 einfo "Status for ${SVCNAME}: "
	 $YAWS_DAEMON -ls
	 einfo "Status for ${YAWS_ID}: "
	 $YAWS_DAEMON -S -I ${YAWS_ID}
}