#!/bin/bash

IMAGE_FILE="/root/run/image/pxfuel.jpg"
AUDIO_FILE_OR_PLAYLIST_URL="http://carbon.bxhosting.com:1780/stream"
YOUTUBE_RTMP_SERVER_URL="rtmp://x.rtmp.youtube.com/live2"
YOUTUBE_STREAM_KEY="4mkp-0570-xf06-7gb5-41dx"

ffmpeg -re -loop 1 -i "$IMAGE_FILE" -i "$AUDIO_FILE_OR_PLAYLIST_URL" -c:a copy -shortest -c:v libx264 -pix_fmt yuv420p -s 1280x720 -b:a 712000 -bufsize 512k -f flv "$YOUTUBE_RTMP_SERVER_URL"/"$YOUTUBE_STREAM_KEY"
