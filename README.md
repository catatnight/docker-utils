docker-sniproxy
===============

SNI Proxy in docker

## Requirement
+ Docker 1.0

## Installation
1. Pull image

	```bash
	$ sudo docker pull catatnight/sniproxy
	```

## Usage
1. Save `sniproxy.conf` file to `<sniproxy.conf-dir>`
2. Create container

	```bash
	$ sudo docker run --net=host -v <sniproxy.conf-dir>:/etc/sniproxy --name sniproxy -d catatnight/sniproxy
	```

## Note
+ TBD

## Reference
+ [SNIproxy Configuration Syntax](https://github.com/dlundquist/sniproxy#configuration-syntax)
+ TBD
