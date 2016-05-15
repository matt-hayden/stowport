: ${DESTDIR=/} ${SUDO=sudo}

mkdir -p $DESTDIR/usr/local/stow/tor/bin
mkdir -p $DESTDIR/usr/local/stow/tor/{etc,share}/tor

cp contrib/dist/torctl				$DESTDIR/usr/local/stow/tor/bin/
cp contrib/operator-tools/tor-exit-notice.html	$DESTDIR/usr/local/stow/tor/etc/tor
cp misc/configs/torrc				$DESTDIR/usr/local/stow/tor/etc/tor
cp src/config/geoip6 src/config/geoip		$DESTDIR/usr/local/stow/tor/share/tor

chmod -R a+r	$DESTDIR/usr/local/stow/tor/etc/
chmod -R a+rx	$DESTDIR/usr/local/stow/tor/bin/

mkdir -p				$DESTDIR/etc/logrotate.d
cp contrib/operator-tools/tor.logrotate	$DESTDIR/etc/logrotate.d/tor

mkdir -p		$DESTDIR/etc/firewalld/services
cp misc/firewalld/*.xml	$DESTDIR/etc/firewalld/services

mkdir -p			$DESTDIR/etc/systemd/system
cp misc/systemd/tor.service	$DESTDIR/etc/systemd/system
$SUDO systemctl daemon-reload

if [[ -d /etc/yum ]]
then
	mkdir -p				$DESTDIR/etc/yum.repos.d
	cp -Ru misc/yum.repos.d/torproject.repo	$DESTDIR/etc/yum.repos.d/torproject.repo.disabled
fi
