# Bitrate settings for YouTube based on recommendations found here: https://support.google.com/youtube/answer/2853702?hl=en-GB#zippy=%2Cp
# White stripe issue discussed here: https://forums.raspberrypi.com/viewtopic.php?t=227701

`#run raspivid`
/usr/bin/raspivid \
-o -                                                     `#stream the output to the stdin` \
-t 0                                                     `#Keep capturing until stopped` \
-fps 30                                                  `#Capture 30 frames per second from the camera` \
-w 1280 -h 720                                           `#Output 1280x720 (720p) video` \
-roi 0,0,0.998,1                                         `#tweak the Region of Interest to crop the pi camera white stripe firmware issue` \
-b 1500000                                               `#use a bitrate of 1,500Kbps` \
`#pipe the output to ffmpeg` \
| /usr/bin/ffmpeg \
`#silent audio input settings (youtube requires an audiotrack)` \
-re                                                      `#read audio input at native frame rate` \
-ar 44100                                                `#use an input audio sampling frequency of 44,100Hz` \
-ac 2                                                    `#use 2 input audio channels for stereo` \
-acodec pcm_s16le                                        `#use the pcm_s16le for the input audio codec` \
-f s16le                                                 `#force the input audio file format to s16le` \
-i /dev/zero                                             `#input audio from /dev/zero, so just and endless stream of nulls` \
`#video input settings` \
-f h264                                                  `#input video format h264` \
-i -                                                     `#input video from stdin` \
`#output settings` \
-vcodec copy                                             `#output using the input video's codec` \
-acodec aac                                              `#output using the aac audio codec` \
-ab 128k                                                 `#output using audio bitrate of 128k` \
-g 50                                                    `#output video with a GOP (Group of Picture size) of 50` \
-f flv                                                   `#output using flv format` \
-strict experimental                                     `#er... no idea` \
rtmp://a.rtmp.youtube.com/live2/$YOUTUBE_KEY             `#output it to this YouTube rtmp stream`
