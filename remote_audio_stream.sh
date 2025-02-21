#!/bin/bash

# for use with docker container running on local machine with microphone
HOST=127.0.0.1
# for use with docker container running on a remote machine and the local machine with a microphone 
#HOST=192.168.0.50
PORT=43001

# mac
# ffmpeg -hide_banner -f avfoundation -i ":0" -ac 1 -ar 16000 -acodec pcm_s16le -f s16le -loglevel error - | nc $HOST $PORT
# linux, with alsa compatibility
ffmpeg -hide_banner -f alsa -i default -ac 1 -ar 16000 -acodec pcm_s16le -f s16le -loglevel error - | nc $HOST $PORT
