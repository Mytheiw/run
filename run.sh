#!/bin/bash

IMAGE_FILE="/root/run/image/pxfuel.jpg"
AUDIO_FILE_OR_PLAYLIST_URL="http://carbon.bxhosting.com:1780/stream"
YOUTUBE_RTMP_SERVER_URL="rtmp://x.rtmp.youtube.com/live2"
YOUTUBE_STREAM_KEY="wkbg-ks7a-dh74-kasj-320w"
LOOP="1"
IMAGE="2"
AUDIO="44100"
QUEUE="4096"

ffmpeg -re -loop "$LOOP" -i "$IMAGE_FILE" -i "$AUDIO_FILE_OR_PLAYLIST_URL" -c:a libmp3lame -ar "$AUDIO" -b:a 128k  -thread_queue_size "$QUEUE" -c:v libx264 -b:v 1500k -preset veryfast -pix_fmt yuv420p -s 1280x720  -thread_queue_size "$QUEUE" -vb 400k -maxrate 6000k -bufsize 1500k -g "$IMAGE" -f flv -flvflags no_duration_filesize "$YOUTUBE_RTMP_SERVER_URL"/"$YOUTUBE_STREAM_KEY"
