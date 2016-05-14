
TEMPORARY=0

if ((TEMPORARY))
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
$FIREWALLCMD --add-service=tor
$FIREWALLCMD --add-port=443/tcp
$FIREWALLCMD --add-port=80/tcp
$FIREWALLCMD --list-ports
$FIREWALLCMD --add-forward-port=port=80:proto=tcp:toport=9091
$FIREWALLCMD --add-forward-port=port=443:proto=tcp:toport=9090
firewall-cmd --reload

