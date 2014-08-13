docker-sniproxy
===============

SNI Proxy in docker

## Requirement
+ Docker 1.0

## Installation
1. Build image (as root)

	```bash
	$ docker pull catatnight/sniproxy
	```

## Usage
1. Create container and manage it (as root)

	```bash
	$ docker run --net=host -v <sniproxy.conf-dir>:/etc/sniproxy --name sniproxy -d catatnight/sniproxy
	```

## Note
+ TBD

## Reference
+ TBD
