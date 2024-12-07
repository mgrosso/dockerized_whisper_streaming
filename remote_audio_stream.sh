#!/bin/bash

HOST=<whisper_server_host_ip>
PORT=43001

# mac
ffmpeg -hide_banner -f avfoundation -i ":0" -ac 1 -ar 16000 -acodec pcm_s16le -f s16le -loglevel error - | nc $HOST $PORT
