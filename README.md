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

Enable the camera in `raspi-config`.  I still had to do this on Bulleye, enabling the so called legacy camera support.

Add an environment variable with your Youtube stream key.  I did this by adding the following line to `/etc/environment`

`export YOUTUBE_KEY="my_stream_key"`

## Usage

`./stream_to_youtube.sh`
Will stream the pi camera to Youtube with no audio.

`./stream_to_youtube_with_audio.sh`
Will stream with the audio file `underwater.mp3` running on a loop in the background.

### Audio credit

The audio file was downloaded from Pixabay https://pixabay.com/?utm_source=link-attribution&amp;utm_medium=referral&amp;utm_campaign=music&amp;utm_content=14428
