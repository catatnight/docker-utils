#!/bin/bash

adduser --disabled-password --gecos "" $T_user
echo "$T_user:$T_passwd"|chpasswd
usermod -a -G debian-transmission $T_user
chmod 770 /var/lib/transmission-daemon/downloads
sed -i -e "s/\"password\"/\"$T_passwd\"/" \
    -e "s/\"transmission\"/\"$T_user\"/" \
    -e "s/\"127.0.0.1\"/\"$T_whitelist\"/" \
  /etc/transmission-daemon/settings.json

/usr/bin/transmission-daemon -f -g /etc/transmission-daemon

