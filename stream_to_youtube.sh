# Bitrate settings for YouTube based on recommendations found here: https://support.google.com/youtube/answer/2853702?hl=en-GB#zippy=%2Cp

`#run libcamera-vid`
/usr/bin/libcamera-vid \
-o -                                                           `#stream the output to the stdin` \
-t 0                                                           `#Keep capturing until stopped` \
--framerate 30                                                 `#Capture 30 frames per second from the camera` \
--width 1920 --height 1080                                     `#Output 1920x1080 (1080p) video` \
-b 3000000                                                     `#use a bitrate of 6,000Kbps` \
--tuning-file /usr/share/libcamera/ipa/raspberrypi/ov5647.json `#use tuning file for my particular camera` \
--vflip --hflip                                                `#flip horizontally and vertically for upside down camera` \
`#pipe the output to ffmpeg` \
| /usr/bin/ffmpeg \
`#audio input settings` \
-re                                                            `#read audio input at native frame rate` \
-stream_loop -1                                                `#loop the input audio forever` \
-i audio/underwater.wav                                        `#input audio from underwater.mp3` \
`#video input settings` \
-f h264                                                        `#input video format h264` \
-r 30                                                          `#input video at 30 fps` \
-i -                                                           `#input video from stdin` \
`#output settings` \
-vcodec copy                                                   `#output using the input video's codec` \
-acodec aac                                                    `#output using the aac audio codec` \
-ab 128k                                                       `#output using audio bitrate of 128k` \
-vb 3000k                                                      `#output using video bitrate of 6,000k` \
-g 60                                                          `#output video with a GOP (Group of Picture size) of 60` \
-f flv                                                         `#output using flv format` \
-strict experimental                                           `#ask ffmpeg to be lenient with our code` \
rtmp://a.rtmp.youtube.com/live2/$YOUTUBE_KEY                   `#output it to this YouTube rtmp stream`