: ${DESTDIR=/}

cp contrib/operator-tools/tor-exit-notice.html $DESTDIR/usr/local/stow/tor/etc/tor
cp contrib/dist/torctl $DESTDIR/usr/local/stow/tor/bin/
mkdir -p $DESTDIR/etc/logrotate.d
cp contrib/operator-tools/tor.logrotate $DESTDIR/etc/logrotate.d/tor
mkdir -p $DESTDIR/etc/systemd/system
cp contrib/dist/tor.service $DESTDIR/etc/systemd/system
systemctl daemon-reload
