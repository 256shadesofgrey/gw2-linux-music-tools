This repository contains scripts that I use to convert the AutoHotkey scripts generated by [gw2mb.com](http://gw2mb.com/) into a format that I can use to play those songs while on linux.

DISCLAIMER: this does not work for all AHK scripts, it only works with the specific format generated by the aforementioned website, and only for the 4 commands that it uses (Sleep, SendInput {X}, SendInput {X down}, SendInput {X up}). So if you want to use them for anything other than playing music in Guild Wars 2, it probably won't work.

These scripts are made with the keybindings in mind that I use, which is the keys 1-0 all assigned to the skills in a row.

To get the resulting shell scripts to work you have to have [dotool](https://sr.ht/~geb/dotool/) installed, and have `dotoold` running.

### ahk-to-dotool-converter.sh <input.ahk>
This script converts the ahk script into a shell script that uses dotool for keyboard input. It also adds a 3 second delay between activating the script and the keyboard inputs starting, to give me time to switch to the game.

### ahk-to-dotool-converter-nohold.sh <input.ahk>
This script is the same as above, but keys are not being held down. So every key down command is replaced with a key tap, and every key up command is removed.

### swap-9-0.sh <input.sh>
This script swaps key presses 9 and 0 used for octave/mode switching, since that seems to be the wrong way around in the scripts from gw2mb, but I don't know if it applies to all of them, so I wrote this separately from the main conversion scripts.

### tempo-modifier.sh <input.sh> <factor>
Multiplies all delays by a given factor.

### Examples
To convert the provided .ahk example to .sh:
```
./ahk-to-dotool-converter.sh example/seven-nation-army-base.ahk > example/seven-nation-army-base.sh
```

Swap 9 and 0:
```
./swap-9-0.sh example/seven-nation-army-base.sh > example/seven-nation-army-base2.sh
```

Speed it up by 20% (note: this will also affect the delay before it starts playing):
```
./tempo-modifier.sh example/seven-nation-army-base2.sh 0.8 > example/seven-nation-army-base3.sh
```

Play the song (don't forget to put the game window in focus after running these commands):
```
chmod +x ./example/seven-nation-army-base3.sh
dotoold &
./example/seven-nation-army-base3.sh
```
