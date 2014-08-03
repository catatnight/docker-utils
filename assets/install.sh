#!/bin/bash

#supervisor
cat > /etc/supervisor/conf.d/supervisord.conf <<EOF
[supervisord]
nodaemon=true

[program:transmission]
command=/usr/bin/transmission-daemon -f -g /etc/transmission-daemon --logfile /var/log/daemon.log

EOF

#transmission
sed -i -e "s/\"password\"/\"$T_passwd\"/" \
    -e "s/\"transmission\"/\"$T_user\"/" \
    -e "s/\"127.0.0.1\"/\"127.0.0.1,$T_whitelist\"/" \
  /etc/transmission-daemon/settings.json

#flexget
if [[ -z "$T_rss" ]]; then
  exit 0
elif [[ ! -a /opt/config.yml ]]; then
	cat >> /etc/supervisor/conf.d/supervisord.conf <<-EOF
	[program:flexget]
	command=/usr/local/bin/flexget -c /opt/config.yml daemon start
	EOF
fi
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

