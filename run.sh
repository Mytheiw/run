#!/bin/bash

IMAGE_FILE="/root/run/image/pxfuel.jpg"
AUDIO_FILE_OR_PLAYLIST_URL="http://carbon.bxhosting.com:1780/stream"
YOUTUBE_RTMP_SERVER_URL="rtmp://x.rtmp.youtube.com/live2"
YOUTUBE_STREAM_KEY="wkbg-ks7a-dh74-kasj-320w"
LOOP="1"
IMAGE="24"
AUDIO="44100"
QUEUE="1024"

ffmpeg -y -re -loop "$LOOP" -thread_queue_size "$QUEUE" -i "$IMAGE_FILE" -thread_queue_size "$QUEUE" -i "$AUDIO_FILE_OR_PLAYLIST_URL" -c:a libmp3lame -ar "$AUDIO" -b:a 128k -c:v libx264 -b:v 1500k -preset veryfast -pix_fmt yuv420p -s 1280x720 -vb 400k -maxrate 6000k -bufsize 2000k -g "$IMAGE" -f flv -flvflags no_duration_filesize "$YOUTUBE_RTMP_SERVER_URL"/"$YOUTUBE_STREAM_KEY"
