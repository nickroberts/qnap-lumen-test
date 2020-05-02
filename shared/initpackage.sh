#!/usr/bin/env bash

CONF=/etc/config/qpkg.conf
QPKG_NAME="UTLABS"
LOGFILE=/var/log/${QPKG_NAME}
QPKG_ROOT=`/sbin/getcfg $QPKG_NAME Install_Path -f ${CONF}`
APACHE_ROOT=`/sbin/getcfg SHARE_DEF defWeb -d Qweb -f /etc/config/def_share.info`

case "$1" in
    start)
        echo "starting package..."
        # re-integration stuff goes here - symlinks, file copies, etc...
        ln -s $QPKG_ROOT/api /home/Qhttpd/Web/UTLABS
        # ln -s $QPKG_ROOT/api/public /home/Qhttpd/Web/UTLABS/api
        ;;
    stop)
        echo "stopping package..."
        # anything required to stop this app running, and reverse re-integration should go here.
        rm /home/Qhttpd/Web/UTLABS
        ;;
    restart)
        $0 stop
        $0 start
        ;;
    *)
        echo "run as: $0 {start|stop|restart}"
        ;;
esac
