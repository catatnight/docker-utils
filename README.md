docker-sniproxy
===============

SNI Proxy in docker

## Usage
```bash
$ sudo docker pull catatnight/sniproxy
$ sudo docker run --net=host -v <sniproxy.conf-dir>:/etc/sniproxy --name sniproxy -d catatnight/sniproxy
# save sniproxy.conf file to <sniproxy.conf-dir>
```

## Reference
+ [SNIproxy Configuration Syntax](https://github.com/dlundquist/sniproxy#configuration-syntax)
