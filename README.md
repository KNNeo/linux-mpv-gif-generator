# mpv-gif-generator *for Linux*

This script only works in Linux. I have tested it on Zorin OS 16.

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

