#!/bin/bash

# Configure 
DL_PATH=/path/to/downloads
TO_PATH=/path/to/torrents

# Stop editing here
docker run --net=host -v $DL_PATH:/var/lib/transmission-daemon/downloads -v $TO_PATH:/var/lib/transmission-daemon/torrents --name trans -d catatnight/transmission

