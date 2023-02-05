# FishyPi
Simple live stream from Pi to Youtube.

At the time of writing, this is streaming at https://youtube.com/@FishyPi

In the scripts, I've split the commands into multiple lines and attempted to explain what each parameter for raspivid and ffmpeg do.  This was mostly for my own benefit but hopefully it's helpful to others too.

## Setup
Install ffmpeg:
```
sudo apt update
sudo apt install ffmpeg
```

Add an environment variable with your Youtube stream key.  I did this by adding the following line to `/etc/environment`

`export YOUTUBE_KEY="my_stream_key"`

Then either restart your pi or load that file up with `source /etc/environment`

## Usage on latest Pi OS
Bullseye has the new camera stack enabled by default so all you need to do is run:

`./stream_to_youtube.sh`

Note that this is configured to my own preferences and camera, an OV5647 with an IR filter in place attached to a Raspberry Pi 3B+.

Unfortunately, I seem to have found that the new camera stack is struggling to keep up with the demand required of YouTube, but the legacy stack (see below) maintains an excellent stream quality and if you decrease it to 720p, it even copes well on a Pi Zero.

### Legacy Camera stack setup and usage

Enable the legacy camera stack through `sudo raspi-config` in its interfaces section.

#### Usage

`./legacy_camera/stream_to_youtube_720p.sh`
Will stream the pi camera to Youtube with no audio using 720p.

`./legacy_camera/stream_to_youtube_720p_with_audio.sh`
Will stream with the audio file `underwater.mp3` running on a loop in the background.

`./legacy_camera/stream_to_youtube_1080p_with_audio.sh`
Same as above, but in 1080p "full HD".  This works well for me on a Pi3b+, but was too much for a Pi Zero w.

### Audio credit

The audio file was downloaded from Pixabay https://pixabay.com/?utm_source=link-attribution&amp;utm_medium=referral&amp;utm_campaign=music&amp;utm_content=14428
