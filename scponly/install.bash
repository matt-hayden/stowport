#! /usr/bin/env bash
: ${STOWDEST=/usr/local}

SUDO=sudo
SCPONLY="${STOWDEST}/bin/scponly"
SCPUSER=scp
USERADD="${SUDO} useradd"

[[ -x "$SCPONLY" ]] || { echo $SCPONLY not found; exit 1; }

grep -q scponly /etc/shells || ${SUDO} /bin/su -c "echo ${SCPONLY} >> /etc/shells"
[[ `getent passwd ${SCPUSER}` ]] || ${USERADD} -mrU -s ${SCPONLY} ${SCPUSER}
echo Maybe you want to add certain local users to the ${SCPUSER} group
echo The ${SCPUSER} user is pointless if you dont generate some keys into their HOME/.ssh
echo You can make additional users with shell ${SCPONLY}
echo I.e. useradd --no-user-group -g webdev -s ${SCPONLY} webdev-website
