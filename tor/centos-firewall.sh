TEMPORARY=0
BRIDGE=1

if grep -qe "^\s*net.ipv4.ip_forward=1" /etc/sysctl.conf
then
	echo "Forwarding enabled"
elif ((TEMPORARY))
then
	sysctl -w net.ipv4.ip_forward=1
else
	echo net.ipv4.ip_forward=1 >> /etc/sysctl.conf
	sysctl -p
fi

if ((TEMPORARY))
then
	FIREWALLCMD="firewall-cmd --zone=public"
else
	FIREWALLCMD="firewall-cmd --permanent --zone=public"
fi

firewall-cmd --reload
if ((BRIDGE))
then
	$FIREWALLCMD --add-service=tor-bridge
	$FIREWALLCMD --add-port=443/tcp
	$FIREWALLCMD --add-forward-port=port=443:proto=tcp:toport=9090
else
	$FIREWALLCMD --add-service=tor-relay
	$FIREWALLCMD --add-port=443/tcp
	$FIREWALLCMD --add-port=80/tcp
	$FIREWALLCMD --add-forward-port=port=443:proto=tcp:toport=9090
	$FIREWALLCMD --add-forward-port=port=80:proto=tcp:toport=9091
fi
$FIREWALLCMD --list-ports
firewall-cmd --reload

