#!/usr/bin/python

import sys
import shlex, subprocess
import argparse

if __name__ == '__main__':
  parser = argparse.ArgumentParser(description='Manage transmission container')
  parser.add_argument("execute", choices=['create','start','stop','restart','delete'], help="manage transmission")
  parser.add_argument("-d", "--downloads", type=str, default="", help="path to downloads directory")
  parser.add_argument("-t", "--torrents", type=str, default="", help="path to torrents-to-watch directory")
  args = parser.parse_args()

  class bcolors:
    HEADER = '\033[95m'
    OKBLUE = '\033[94m'
    OKGREEN = '\033[92m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'
    ENDC = '\033[0m'

  def _execute(args):
    if args.execute == "create" and (args.downloads == "" or args.torrents == ""):
      sys.exit(bcolors.WARNING + "Error: Paths to downloads and torrents must be set. " + bcolors.ENDC)
    signal_dict = {"create" : "docker run --net=host -v " \
                              + args.downloads + ":/var/lib/transmission-daemon/downloads -v " \
                              + args.torrents + ":/var/lib/transmission-daemon/torrents " \
                              "--name transmission -d catatnight/transmission", \
                   "start"  : "docker start   transmission", \
                   "stop"   : "docker stop    transmission", \
                   "restart": "docker restart transmission", \
                   "delete" : "docker rm -f   transmission"}
    process = subprocess.Popen(shlex.split(signal_dict[args.execute]), stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    if process.stdout.readline():
      if args.execute == "create": args.execute += " and start"
      print bcolors.OKGREEN + args.execute + " transmission successfully" + bcolors.ENDC
    else:
      _err = process.stderr.readline()
      if 'No such container' in _err:
        print bcolors.WARNING + "Please create transmission container first" + bcolors.ENDC
      else: print bcolors.WARNING + _err + bcolors.ENDC
    output = process.communicate()[0]

  _execute(args)
