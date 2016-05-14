
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
