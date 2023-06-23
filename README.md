# 70Hz vsync fix for Hand386 #

The Hand386 handheld PC released in 2023 is a really cool gadget and has taken
the retro PC world by storm. The Hand386 comes with a Chips & Technologies 65535
VGA controller, and unfortunately the video BIOS that comes with the Hand386
sets it to flat panel output mode, forcing all video to 60Hz vertical refresh.
The device uses a Realtek flat panel controller that takes a VGA signal, and it
has no problem syncing to the 70Hz VGA mode.


Programs that expect the standard VGA modes to be at 70Hz may run too slowly or
have other strange behavior when forced to 60Hz. For example, music in the demo
Second Reality by Future Crew has a tempo that is slower than normal.

## Running it ##

Download handfix.com from the Releases section of this repository and copy to
your Hand386. Run handfix.exe to re-enable 70Hz VGA modes (and other tweaked
refresh modes). The first time you run it, it will take some time to auto-adjust the screen.
Enabling 70Hz modes is not permanent – to bring back the old 60Hz force behavior,
power down and restart your Hand386.

Screenshot:

<img width="719" alt="handfix" src="https://github.com/polpo/hand386fix/assets/1544908/4c7c32ff-7e50-47c4-a378-6062a3103e11">

## Before and after ##

See (actually hear) the difference in this video:

[<img src="https://img.youtube.com/vi/o0BhFbuwMuM/maxresdefault.jpg" alt="YouTube thumbnail" width=600>](https://youtu.be/o0BhFbuwMuM)

## Credits ##

References: Chips & Technology 65535 datasheet, available at:
https://www.yyzkevin.com/pc110/65535-2/

Thanks to yyzkevin for his knowledge about the C&T 65535!
