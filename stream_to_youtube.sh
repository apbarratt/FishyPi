# Bitrate settings for YouTube based on recommendations found here: https://support.google.com/youtube/answer/2853702?hl=en-GB#zippy=%2Cp

`#run libcamera-vid`
/usr/bin/libcamera-vid \
-t 0                                                           `#Keep capturing until stopped` \
--width 1920 --height 1080                                     `#Output 1920x1080 (1080p) video` \
--inline                                                       `#inline... whatever that means` \
-b 3000000                                                     `#use a bitrate of 3,000Kbps` \
--tuning-file /usr/share/libcamera/ipa/raspberrypi/ov5647.json `#use tuning file for my particular camera` \
--vflip --hflip                                                `#flip horizontally and vertically for upside down camera` \
--flush                                                        `#flush` \
--nopreview                                                    `#don't try opening a preview window` \
-o -                                                           `#stream the output to the stdin` \
`#pipe the output to ffmpeg` \
| /usr/bin/ffmpeg \
`#audio input settings` \
-re                                                            `#read audio input at native frame rate` \
-stream_loop -1                                                `#loop the input audio forever` \
-i audio/underwater.wav                                        `#input audio from underwater.wav` \
`#video input settings` \
-f h264                                                        `#input video format h264` \
-thread_queue_size 4096                                        `#input thread queue size of 4096` \
-vsync drop                                                    `#vsync drop` \
-i -                                                           `#input video from stdin` \
`#output settings` \
-vcodec copy                                                   `#output using the input video's codec` \
-acodec aac                                                    `#output using the aac audio codec` \
-ab 128k                                                       `#output using audio bitrate of 128k` \
-f fifo                                                        `#output using First In First Out` \
-fifo_format flv                                               `#output using flv format` \
-map 0:a                                                       `#map first input as audio` \
-map 1:v                                                       `#map second input as video` \
-drop_pkts_on_overflow 1                                       `#drop packets on overflow` \
-attempt_recovery 1                                            `#attempt recovery` \
-recovery_wait_time 1                                          `#wait 1 second before attempting recovery` \
rtmp://a.rtmp.youtube.com/live2/$YOUTUBE_KEY                   `#output it to this YouTube rtmp stream` \
-loglevel error \
-stats
