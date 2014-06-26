docker-transmission
===================

run Transmission (BitTorrent client) including web client in a docker container 

## Requirement
+ Docker 0.11

## Usage
1. Clone the git repo
	
	```bash
	$ git clone https://github.com/catatnight/docker-transmission.git
	$ cd docker-transmission
	```
2. Configure

	```bash
	$ vim assets/install.sh
	#Configure
	T_user=guest
	T_passwd=guest
	T_whitelist='127.0.0.1,YOUR.I.P.ADDRESS'  #set *.*.*.* if any remote ip is allowed
	T_rss='http://chdbits.org/torrentrss.php?myrss=1&linktype=dl&uid=XXX&passkey=XXX'
	```
3. Build container and then manage it as root
	
	```bash
	$ sudo ./build.sh
	$ sudo ./manage.py [create|start|stop|restart|delete]
	# when creating transmission container,
	#  please specify paths of downloads and torrents as followed:
	$ sudo ./manage.py -d /path/to/downloads -t /path/to/torrents create
	```
4. Don't forget to open port ```9091 & 51413``` and then you can visit web client on http://your.domain:9091

## Note
+ ```/path/to/torrents``` is the value of ```watch-dir``` in Transmission
		
	> Note: When watch-dir-enabled is true, only the transmission-daemon, transmission-gtk, and transmission-qt applications will monitor watch-dir for new .torrent files and automatically load them.
+ Add popular RSS download function (successfully tested on CHDBits.org)

## Reference
+ [EditConfigFiles – Transmission](https://trac.transmissionbt.com/wiki/EditConfigFiles)
+ [Plugins – FlexGet](http://flexget.com/wiki/Plugins)
+ [angelrr7702 / transmission](https://github.com/angelrr7702/transmission)
+ TBD
