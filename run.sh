#!/bin/bash

IMAGE_FILE="/root/run/image/pxfuel.jpg"
AUDIO_FILE_OR_PLAYLIST_URL="http://carbon.bxhosting.com:1780/stream"
YOUTUBE_RTMP_SERVER_URL="rtmp://x.rtmp.youtube.com/live2"
YOUTUBE_STREAM_KEY="4mkp-0570-xf06-7gb5-41dx"
LOOP="1"
IMAGE="2"
AUDIO="44100"

ffmpeg -re -i "$IMAGE_FILE" -i "$AUDIO_FILE_OR_PLAYLIST_URL" -c:a libmp3lame -ar "$AUDIO" -b:a 128k -shortest -c:v libx264 -b:v 1500k -preset veryfast -pix_fmt yuv420p -s 1280x720 -bufsize 6000k -vb 400k -maxrate 1500k -g "$IMAGE" -f flv "$YOUTUBE_RTMP_SERVER_URL"/"$YOUTUBE_STREAM_KEY"
