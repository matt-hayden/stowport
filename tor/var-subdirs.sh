
for pd in /var/lib/tor /var/tmp/tor
do
	[[ -d "$pd" ]] || mkdir -p -m 0750 "$pd"
	sudo chown _tor:_tor "$pd"
done
for wd in /var/log/tor /var/run/tor
do
	[[ -d "$wd" ]] || mkdir -p -m 0750 "$wd"
	sudo chown _tor:_tor "$wd"
done
