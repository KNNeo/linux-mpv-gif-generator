# mpv-gif-generator for Linux

This script only works in Linux. I have tested it on Zorin OS ~~16~~ 17.1. 

Original script created by [Ruin0x11](https://github.com/Ruin0x11) and [blueray453](https://github.com/blueray453), which you can find [here](https://gist.github.com/Ruin0x11/8fae0a9341b41015935f76f913b28d2a) and [here](https://github.com/blueray453/linux-mpv-gif-generator). which was forked from [the-honey](https://github.com/the-honey), which you can find [here](https://github.com/the-honey/mpv-gif-generator).

## Changes
- Added frame rate setting (8, 10 frames per second)
- More OSD (show complete)
- Changed to double pass to get better quality as documented by ubitux [here](https://blog.pkh.me/p/21-high-quality-gif-with-ffmpeg.html)

## Dependencies
- mpv
- kdialog
- ffmpeg
Install before usage:
```
sudo apt install ffmpeg kdialog mpv
```

## Installation
- Install dependencies (see above)
- Place `mpv-gif.lua` in `$HOME/.config/{mpv-based_video_player_of_choice}/scripts` (tested on mpv, celluloid)
- Restart player

## Hotkeys

* `g` - Change frames per second (8,10)
* `[` - Start time
* `]` - End time
* `CTRL+g` - Export GIF



