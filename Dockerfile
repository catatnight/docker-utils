From ubuntu:precise
MAINTAINER Elliott Ye

# Set noninteractive mode for apt-get
ENV DEBIAN_FRONTEND noninteractive

# upgrade base system packages
RUN apt-get update

# Start editing
#install package here for cache
RUN apt-get install -y python-software-properties \
    && add-apt-repository ppa:transmissionbt/ppa \
    && apt-get -y install transmission-daemon \
    && /etc/init.d/transmission-daemon stop 

# Add files
ADD assets/settings.default.json /etc/transmission-daemon/settings.json

# Initialization 
ADD assets/install.sh /opt/install.sh
RUN chmod 755 /opt/*.sh 
RUN /opt/install.sh 

# Run
CMD ["/usr/bin/transmission-daemon","-f","-g","/etc/transmission-daemon"]
