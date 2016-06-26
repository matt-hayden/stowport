#! /usr/bin/env bash
: ${SYSTEMCTL=systemctl}
set -o errexit
### Requires root privilege

temporary=1
mode=bridge

if grep -iqe "^\s*net.ipv4.ip_forward=1" /etc/sysctl.conf
then
	echo "Forwarding enabled"
elif ((temporary))
then
	sysctl -w net.ipv4.ip_forward=1
else
	echo net.ipv4.ip_forward=1 >> /etc/sysctl.conf
	sysctl -p
fi

FIREWALLCMD="firewall-cmd --zone=public"
((temporary)) || FIREWALLCMD="$FIREWALLCMD --permanent"

case $mode in
	bridge|BRIDGE)
		$FIREWALLCMD --add-service=tor-bridge
		$FIREWALLCMD --add-port=443/tcp
		$FIREWALLCMD --add-forward-port=port=443:proto=tcp:toport=9090
		firewall-cmd --reload
		;;
	relay|RELAY)
		$FIREWALLCMD --add-service=tor-relay
		$FIREWALLCMD --add-port=443/tcp
		$FIREWALLCMD --add-port=80/tcp
		$FIREWALLCMD --add-forward-port=port=443:proto=tcp:toport=9090
		$FIREWALLCMD --add-forward-port=port=80:proto=tcp:toport=9091
		firewall-cmd --reload
		;;
	*)
		echo Not altering firewall
		;;
esac

$FIREWALLCMD --list-all-zones

if $SYSTEMCTL start tor
then
	((temporary)) || $SYSTEMCTL enable tor
else
	echo start failed, to enable later use $SYSTEMCTL enable tor
fi
