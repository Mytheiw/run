#!/bin/bash

IMAGE_FILE=/root/run/pxfuel.jpg
AUDIO_FILE_OR_PLAYLIST_URL=https://soundcloud.com/xaviez-286294178/sets/blue-archive?si=0b569c62e8f74e6ba9bc112a0e9386ba&utm_source=clipboard&utm_medium=text&utm_campaign=social_sharing
YOUTUBE_RTMP_SERVER_URL=rtmp://x.rtmp.youtube.com/live2
YOUTUBE_STREAM_KEY=4mkp-0570-xf06-7gb5-41dx

ffmpeg -reconnect 1 -reconnect_streamed 1 -reconnect_delay_max 5 -loop 1 -i [IMAGE_FILE] -i [AUDIO_FILE/PLAYLIST_URL] -c:a copy -shortest -c:v libx264 -pix_fmt yuv420p -s 1280x720 -f flv rtmp://[YOUTUBE_RTMP_SERVER_URL]/[YOUTUBE_STREAM_KEY]
