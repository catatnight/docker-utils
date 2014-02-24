docker-transmission
===================

run Transmission (BitTorrent client) including web client in a docker container 

## Requirement
+ Docker 0.8

## Usage
1. configure

    ```bash
    # assets/install.sh
    #Configure
    T_user=guest
    T_passwd=guest
    T_whitelist='127.0.0.1, YOUR.I.P.ADDRESS' #set *.*.*.* if any remote ip is allowed

    # run-server.sh
    #Configure 
    T_PORT=80                   #change port to expose (default 80)
    DL_PATH=/path/to/downloads  #change download directory
    TO_PATH=/path/to/torrents   #change torrents-to-watch directory
    ```

2. run ```build.sh``` and ```run-server.sh``` 

## Note
+ ```/path/to/torrents``` is the value of ```watch-dir``` in Transmission
    
    > Note: When watch-dir-enabled is true, only the transmission-daemon, transmission-gtk, and transmission-qt applications will monitor watch-dir for new .torrent files and automatically load them.

## Reference
+ [EditConfigFiles – Transmission](https://trac.transmissionbt.com/wiki/EditConfigFiles)
+ [angelrr7702 / transmission](https://github.com/angelrr7702/transmission)
+ TBD
