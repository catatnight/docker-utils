docker-transmission
===================

run Transmission (BitTorrent client) including web client in a docker container

## Requirement
+ Docker 0.11

## Installation
1. Build image (as root)

	```bash
	$ docker pull catatnight/transmission
	$ curl https://raw.githubusercontent.com/catatnight/docker-transmission/master/manage.py -o manage.py
	$ chmod +x manage.py
	```

## Usage
1. Create container and manage it (as root)

	```bash
	$ ./manage.py -h
	usage: manage.py [-h] [-d DOWNLOADS] [-t TORRENTS] [-u USERNAME] [-p PASSWORD]
				 [--whitelist WHITELIST] [--rss_feed RSS_FEED]
				 {create,start,stop,restart,delete}
	# when creating transmission container,
	#  please specify paths of downloads and torrents as followed:
	$ sudo ./manage.py -d /path/to/downloads -t /path/to/torrents create
	```

## Note
+ ```/path/to/torrents``` is the value of ```watch-dir``` in Transmission

	> Note: When watch-dir-enabled is true, only the transmission-daemon, transmission-gtk, and transmission-qt applications will monitor watch-dir for new .torrent files and automatically load them.
+ Add popular RSS download function (successfully tested on CHDBits.org)
+ Don't forget to open port ```9091``` & ```51413```

## Reference
+ [EditConfigFiles – Transmission](https://trac.transmissionbt.com/wiki/EditConfigFiles)
+ [Plugins – FlexGet](http://flexget.com/wiki/Plugins)
+ TBD
