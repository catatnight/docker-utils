#!/usr/bin/python

import sys
import shlex, subprocess
import argparse

if __name__=="__main__":
  parser = argparse.ArgumentParser()
  parser.add_argument("execute", help="start|stop|restart transmission")
  parser.add_argument("-d", "--downloads", type=str, default="", help="path to downloads directory")
  parser.add_argument("-t", "--torrents", type=str, default="", help="path to torrents-to-watch directory")
  args = parser.parse_args()

  def _start(args):
    if args.downloads == "" or args.torrents == "":
      sys.exit("Error: paths to downloads and torrents must be set")
    bashCommand = "docker run --net=host -v " \
                    + args.downloads + ":/var/lib/transmission-daemon/downloads -v " \
                    + args.torrents + ":/var/lib/transmission-daemon/torrents " \
                    "--name transmission -d catatnight/transmission"
    process = subprocess.Popen(shlex.split(bashCommand))
    output = process.communicate()[0]

  def _stop():
    bashCommand = "docker rm -f transmission"
    process = subprocess.Popen(shlex.split(bashCommand))
    output = process.communicate()[0]

  if args.execute== "start":
    _start(args)
  elif args.execute== "stop":
    _stop()
  elif args.execute== "restart":
    _stop()
    _start(args)
