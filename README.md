docker-transmission
===================

run Transmission (BitTorrent client) including web client in a docker container 

## Requirement
+ Docker 0.8

## Usage
1. configure

    ```bash
    # Dockerfile (NO double quotes)
    #Configure
    ENV T_user      guest
    ENV T_passwd    guest
    ENV T_whitelist 127.0.0.1, YOUR.I.P.ADDRESS #set *.*.*.* if any remote ip is allowed

    # run-server.sh 
    docker run -p 80:9091 \ #change port to expose (default 80)
      -v /path/to/downloads:/var/lib/transmission-daemon/downloads \ #change download directory 
      -v /path/to/torrents:/var/lib/transmission-daemon/torrents \ #change torrents-to-watch directory 
      -name trans -d catatnight/transmission
    ```

2. run ```build.sh``` and ```run-server.sh``` 

## Note
+ ```/path/to/torrents``` is the value of ```watch-dir``` in Transmission
    
    > Note: When watch-dir-enabled is true, only the transmission-daemon, transmission-gtk, and transmission-qt applications will monitor watch-dir for new .torrent files and automatically load them.

## Reference
+ [EditConfigFiles – Transmission](https://trac.transmissionbt.com/wiki/EditConfigFiles)
+ TBD
