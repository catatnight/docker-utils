From ubuntu:precise
MAINTAINER Elliott Ye

# Set noninteractive mode for apt-get
ENV DEBIAN_FRONTEND noninteractive

# upgrade base system packages
RUN apt-get update

# Start editing
#install package here for cache
RUN apt-get -y install supervisor
RUN apt-get install -y python-software-properties \
    && add-apt-repository ppa:transmissionbt/ppa \
    && apt-get -y install transmission-daemon \
    && /etc/init.d/transmission-daemon stop 
RUN apt-get -y install python-pip && pip install flexget transmissionrpc

# Add files
#transmission
ADD assets/settings.default.json /etc/transmission-daemon/settings.json
#supervisor
ADD assets/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Initialization 
ADD assets/install.sh /opt/install.sh
RUN chmod 755 /opt/*.sh 
RUN /opt/install.sh 

# Run
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]
