#!/bin/bash

docker run -p 80:9091 -v /path/to/downloads:/var/lib/transmission-daemon/downloads -v /path/to/torrents:/var/lib/transmission-daemon/torrents -name trans -d catatnight/transmission

