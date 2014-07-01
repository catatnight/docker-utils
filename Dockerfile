From ubuntu:trusty
MAINTAINER Elliott Ye

# Set noninteractive mode for apt-get
ENV DEBIAN_FRONTEND noninteractive

# Upgrade base system packages
RUN apt-get update

### Start editing ###
# Install package here for cache
RUN apt-get -y install supervisor
RUN apt-get -y install transmission-daemon && /etc/init.d/transmission-daemon stop

# Add files
#transmission
ADD assets/settings.default.json /etc/transmission-daemon/settings.json

# Configure
ENV T_user      guest
ENV T_passwd    guest
ENV T_whitelist 127.0.0.1,YOUR.I.P.ADDRESS
ENV T_rss       http://chdbits.org/torrentrss.php?myrss=1&linktype=dl&uid=XXX&passkey=XXX

# Initialization 
ADD assets/install.sh /opt/install.sh
RUN /opt/install.sh 

# Run
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]
