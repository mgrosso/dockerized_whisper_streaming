#!/bin/bash
python3 whisper_online_server.py \
	--host 0.0.0.0 \
	--port 43001 \
	--model tiny.en \
	--lan en \
	--task transcribe \
	--backend whisper_timestamped \
	--warmup-file warmup_file/jfk.wav
