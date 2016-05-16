: ${CP="$CP -l"} ${SUDO=sudo}
STOWME="$DESTDIR/usr/local/stow/tor"

mkdir -p		$DESTDIR/var/{lib,log,run,tmp}/tor
$SUDO chown _tor:_tor	$DESTDIR/var/{lib,log,run,tmp}/tor
chmod 0700 $DESTDIR/var/{lib,tmp}/tor
chmod 0755 $DESTDIR/var/{log,run}/tor


mkdir -p $STOWME/bin
mkdir -p $STOWME/{etc,share}/tor

$CP contrib/dist/torctl					$STOWME/bin/
$CP -u contrib/operator-tools/tor-exit-notice.html	$STOWME/etc/tor/exit-notice.html
$CP -u misc/configs/tor*				$STOWME/etc/tor
$CP -u src/config/geoip6 src/config/geoip		$STOWME/share/tor

chmod -R a+r	$STOWME/
chmod -R a+rx	$STOWME/bin/

[[ $DESTDIR ]] && mkdir -p \
	$DESTDIR/etc/firewalld/services
	$DESTDIR/etc/logrotate.d
	$DESTDIR/etc/systemd/system
	$DESTDIR/etc/yum.repos.d

[[ -d $DESTDIR/etc/logrotate.d ]] && $CP -u contrib/operator-tools/tor.logrotate \
	$DESTDIR/etc/logrotate.d/tor

[[ -d $DESTDIR/etc/firewalld/services ]] && $CP -u misc/firewalld/*.xml \
	$DESTDIR/etc/firewalld/services

[[ -d $DESTDIR/etc/systemd/system ]] && $CP -u misc/systemd/tor.service \
	$DESTDIR/etc/systemd/system
$SUDO systemctl daemon-reload

[[ -d $DESTDIR/etc/yum.repos.d ]] && $CP -Ru misc/yum.repos.d/torproject.repo \
	$DESTDIR/etc/yum.repos.d/torproject.repo.disabled
