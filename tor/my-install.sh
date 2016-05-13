DESTDIR=/tmp/tor-0.2.7.6

for pd in /var/lib/tor /var/tmp/tor
do
	[[ -d "$pd" ]] || mkdir -m 0770 $DESTDIR/"$pd"
	sudo chown :_tor "$pd"
done
for wd in /var/log/tor /var/run/tor
do
	[[ -d "$wd" ]] || mkdir -m 0775 $DESTDIR/"$wd"
	sudo chown :_tor "$wd"
done

cp contrib/dist/torctl $DESTDIR/usr/local/stow/tor/bin/
cp contrib/operator-tools/tor.logrotate $DESTDIR/etc/logrotate.d/tor
cp contrib/dist/tor.service $DESTDIR/etc/systemd/user
