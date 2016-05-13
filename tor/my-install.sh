: ${DESTDIR=/tmp/tor-0.2.7.6}

for pd in /var/lib/tor /var/tmp/tor
do
	[[ -d "$pd" ]] || mkdir -p -m 0770 "$pd"
	sudo chown :_tor "$pd"
done
for wd in /var/log/tor /var/run/tor
do
	[[ -d "$wd" ]] || mkdir -p -m 0775 "$wd"
	sudo chown :_tor "$wd"
done


cp contrib/operator-tools/tor-exit-notice.html $DESTDIR/usr/local/stow/tor/etc/tor
cp contrib/dist/torctl $DESTDIR/usr/local/stow/tor/bin/
mkdir -p $DESTDIR/etc/logrotate.d
cp contrib/operator-tools/tor.logrotate $DESTDIR/etc/logrotate.d/tor
mkdir -p $DESTDIR/etc/systemd/user
cp contrib/dist/tor.service $DESTDIR/etc/systemd/user
