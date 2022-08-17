# mpv-gif-generator *for Linux*

This script only works in Linux. I have tested it on Zorin OS 16.

Original script created by [Ruin0x11](https://github.com/Ruin0x11), which you can find [here](https://gist.github.com/Ruin0x11/8fae0a9341b41015935f76f913b28d2a). I forked it from [the-honey](https://github.com/the-honey), which you can find [here](https://github.com/the-honey/mpv-gif-generator).

I tired to keep the script as simple as possible so that you can play with it.

# Requirements
- mpv
- kdialog
- ffmpeg

# Install Dependencies

```
sudo apt install ffmpeg kdialog mpv
```
# Installation

head to `$HOME/.config/mpv/scripts` and place `mpv-gif.lua` in there.

# Usage

Now when you run a video on mpv, you will be able to use <kbd>g</kbd> to set start frame, <kbd>G</kbd> to set end frame, <kbd>Ctrl+g</kbd> to create gif. When you press <kbd>Ctrl+g</kbd>, it will ask where you want to save the gif.

## Hotkeys

* `g` - Start time
* `G` - End time
* `CTRL+g` - Export GIF



