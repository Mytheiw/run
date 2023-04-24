#!/bin/bash

IMAGE_FILE=/image/pxfuel.jpg
AUDIO_FILE_OR_PLAYLIST_URL=https://example.com/path/to/your/audio/file.mp3
YOUTUBE_RTMP_SERVER_URL=rtmp://x.rtmp.youtube.com/live2
YOUTUBE_STREAM_KEY=your_stream_key

ffmpeg -reconnect 1 -reconnect_streamed 1 -reconnect_delay_max 5 -loop 1 -i [IMAGE_FILE] -i [AUDIO_FILE/PLAYLIST_URL] -c:a copy -shortest -c:v libx264 -pix_fmt yuv420p -s 1280x720 -f flv rtmp://[YOUTUBE_RTMP_SERVER_URL]/[YOUTUBE_STREAM_KEY]
