From ubuntu:trusty
MAINTAINER Elliott Ye

# Set noninteractive mode for apt-get
ENV DEBIAN_FRONTEND noninteractive

# Upgrade base system packages
RUN apt-get update

### Start editing ###
# Install package here for cache
RUN apt-get -y install autotools-dev cdbs debhelper dh-autoreconf dpkg-dev gettext libev-dev libpcre3-dev libudns-dev pkg-config wget
RUN export sniproxy_version=$(wget https://github.com/dlundquist/sniproxy/releases -q -O - | grep -o '[0-9]\.[0-9]\.[0-9]' | head -1) \
	&& cd /tmp && wget https://github.com/dlundquist/sniproxy/archive/$sniproxy_version.tar.gz \
	&& tar -zxf $sniproxy_version.tar.gz && cd sniproxy-$sniproxy_version/ \
	&& dpkg-buildpackage && dpkg -i ../sniproxy_*.deb

# Run
CMD ["/usr/sbin/sniproxy","-f","-c","/etc/sniproxy/sniproxy.conf"]
