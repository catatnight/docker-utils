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
RUN apt-get -y install --no-install-recommends python-pip && pip install flexget transmissionrpc

# Add files
#transmission
ADD assets/settings.default.json /etc/transmission-daemon/settings.json

# Initialization 
ADD assets/install.sh /opt/install.sh
RUN /opt/install.sh 

# Run
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]
