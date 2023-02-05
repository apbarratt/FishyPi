# Bitrate settings for YouTube based on recommendations found here: https://support.google.com/youtube/answer/2853702?hl=en-GB#zippy=%2Cp
# White stripe issue discussed here: https://forums.raspberrypi.com/viewtopic.php?t=227701

`#run raspivid`
/usr/bin/raspivid \
-o -                                                     `#stream the output to the stdin` \
-t 0                                                     `#Keep capturing until stopped` \
-fps 30                                                  `#Capture 30 frames per second from the camera` \
-g 60                                                    `#Capture with a GOP (Group of Picture size) of 60` \
-w 1920 -h 1080                                          `#Output 1920x1080 (1080p) video` \
-roi 0,0,0.998,1                                         `#tweak the Region of Interest to crop the pi camera white stripe firmware issue` \
-b 6000000                                               `#use a bitrate of 6,000Kbps` \
`#pipe the output to ffmpeg` \
| /usr/bin/ffmpeg \
`#audio input settings` \
-re                                                      `#read audio input at native frame rate` \
-stream_loop -1                                          `#loop the input audio forever` \
-i ../audio/underwater.wav                               `#input audio from underwater.mp3` \
`#video input settings` \
-f h264                                                  `#input video format h264` \
-r 30                                                    `#input video at 30 fps` \
-i -                                                     `#input video from stdin` \
`#output settings` \
-vcodec copy                                             `#output using the input video's codec` \
-acodec aac                                              `#output using the aac audio codec` \
-ab 128k                                                 `#output using audio bitrate of 128k` \
-vb 6000k                                                `#output using video bitrate of 6,000k` \
-g 60                                                    `#output video with a GOP (Group of Picture size) of 60` \
-f flv                                                   `#output using flv format` \
-strict experimental                                     `#ask ffmpeg to be lenient with our code` \
rtmp://a.rtmp.youtube.com/live2/$YOUTUBE_KEY             `#output it to this YouTube rtmp stream`
