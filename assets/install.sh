#!/bin/bash

#supervisor
cat > /etc/supervisor/conf.d/supervisord.conf <<EOF
[supervisord]
nodaemon=true

[program:transmission]
command=/usr/bin/transmission-daemon -f -g /etc/transmission-daemon --logfile /var/log/daemon.log
EOF

#transmission
adduser --disabled-password --gecos "" $T_user
echo "$T_user:$T_passwd"|chpasswd
usermod -a -G debian-transmission $T_user
chmod 770 /var/lib/transmission-daemon/downloads
sed -i -e "s/\"password\"/\"$T_passwd\"/" \
    -e "s/\"transmission\"/\"$T_user\"/" \
    -e "s/\"127.0.0.1\"/\"$T_whitelist\"/" \
  /etc/transmission-daemon/settings.json

#flexget
if [[ $T_rss == 'http://chdbits.org/torrentrss.php?myrss=1&linktype=dl&uid=XXX&passkey=XXX' ]]; then
  exit 0
fi

apt-get -y install --no-install-recommends python-pip && pip install flexget transmissionrpc

cat > /etc/supervisor/conf.d/supervisord.conf <<EOF

[program:flexget]
command=/usr/local/bin/flexget -c /opt/config.yml daemon start
EOF

cat > /opt/config.yml <<EOF
tasks:
  CHD.personal:
    rss: $T_rss
    accept_all: yes
    free_space:
      path: /var/lib/transmission-daemon/downloads
      space: 500
    download: /var/lib/transmission-daemon/downloads/
    transmission:
      host: localhost
      port: 9091
      username: $T_user
      password: $T_passwd
schedules:
  # Run every task once 5 minutes
  - tasks: '*'
    interval:
      minutes: 5
EOF

