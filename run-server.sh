#!/bin/bash

# Configure 
T_PORT=80
DL_PATH=/path/to/downloads
TO_PATH=/path/to/torrents

# Stop editing here
docker run -p $T_PORT:9091 -v $DL_PATH:/var/lib/transmission-daemon/downloads -v $TO_PATH:/var/lib/transmission-daemon/torrents --name trans -d catatnight/transmission

