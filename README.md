<img src="https://raw.githubusercontent.com/WieWaldi/sxiv_keyhandler/master/img/RZ-Amper_Logo_135x135.png" align="left" width="135px" height="135px" />

### sxiv_keyhandler by WieWaldi
> *My personal key handler for sxiv*

[![MIT Licence](https://badges.frapsoft.com/os/mit/mit.svg?v=103)](https://opensource.org/licenses/mit-license.php)

<br />

## Usage
Press `x` to pass a list of marked files to key handler.
 - `c` - Copies file to collect folder (defaults to ~/Pictures/Collect)
 - `d` - Move files to trash folder (defaults to ~/Trash)
 - `D` - Delete file(s) permanently (Watch Out!)
 - `e` - Pprint a summary of the Exif metadata
 - `E` - Print Exif, IPTC and XMP metadata
 - `g` - Open file(s) in Gimp
 - `h` - Show this help
 - `m` - Move file(s) to choosen directory
 - `r` - Resize Images and store the resized version to choosen directory
## Requirements 
No shit, but sxiv is really required. In addition, the key handler relies on
zenity or yad for input handling. For printing image metadata you have to have
exiv2 installed as well.
## Setup
You may hand pick the parts you like or simply run the setup script. It will
put everything in place.
```
git clone https://github.com/WieWaldi/sxiv_keyhandler.git ~/sxiv_keyhandler
~/sxiv_keyhandler/setup.sh
```

## Links/URLs/Credits  
[Xfce Power User Tips, Tricks & Tweaks: Working With Graphics](https://pclosmag.com/html/Issues/201303/page09.html)  
[Directory select with Zenity](https://stackoverflow.com/questions/42571510/directory-select-with-zenity)  
