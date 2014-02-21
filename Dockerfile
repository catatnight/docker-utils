From ubuntu:latest
MAINTAINER Elliott Ye

# Set noninteractive mode for apt-get
ENV DEBIAN_FRONTEND noninteractive

# upgrade base system packages
RUN apt-get update

# Start editing
#install package here for cache
RUN apt-get -y install supervisor vim 
RUN apt-get install -y python-software-properties \
    &&  add-apt-repository ppa:transmissionbt/ppa \
    && apt-get -y install transmission-daemon \
    && /etc/init.d/transmission-daemon stop 

# Add files
#transmission
ADD assets/run-trans.sh /opt/run-trans.sh
ADD assets/settings.json.default /etc/transmission-daemon/settings.json
#supervisor
ADD assets/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN chmod 755 /opt/*.sh

# Configure
ENV T_user      guest
ENV T_passwd    guest
ENV T_whitelist 127.0.0.1, YOUR.I.P.ADDRESS

# Ports

CMD ["/usr/bin/supervisord"]



