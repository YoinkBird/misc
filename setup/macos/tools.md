# Read

* MacOS and bashrc: https://scriptingosx.com/2017/04/about-bash_profile-and-bashrc-on-macos/

# Configure

Sync MacOS "internet accounts" with Email+Calendar provider in order to have calendar app working and any apps which read from calendar app, e.g. itsycal.

# install 
## extra mouse buttons in firefox
https://sensible-side-buttons.archagon.net/

https://www.videolan.org/vlc/download-macosx.html

## pretty video screensaver from appletv
https://aerialscreensaver.github.io/

## calendar app in statusbar
https://www.mowglii.com/itsycal/

## [ license ] great alt-tab switcher
https://contexts.co/

# [ license ] pops up whenever audio activates
https://obdev.at/products/microsnitch/index.html

https://docs.docker.com/docker-for-mac/install/


# USB Display from AOC

https://www.displaylink.com/downloads/macos

# kdiff3 GUI difftool

WARNING - this section got messy, see the "WORKING ..." header for winning approach.
Leaving old approaches in here as research stubs in case the relatively simple `brew install kde-mac/...; # follow-up` approach quits working.
### kde prereq
https://invent.kde.org/packaging/homebrew-kde
```
brew untap kde-mac/kde 2> /dev/null
brew tap kde-mac/kde https://invent.kde.org/packaging/homebrew-kde.git --force-auto-update
"$(brew --repo kde-mac/kde)/tools/do-caveats.sh"
```
brew install kde-mac/kde/kdiff3

then locate the path: 
```
 % find /usr/local/Cellar/kdiff3/ | grep "kdiff3$"
/usr/local/Cellar/kdiff3//1.8.5/bin/kdiff3
/usr/local/Cellar/kdiff3//1.8.5/bin/kdiff3.app/Contents/MacOS/kdiff3
/usr/local/Cellar/kdiff3//1.8.5/share/kxmlgui5/kdiff3
/usr/local/Cellar/kdiff3//1.8.5/share/doc/HTML/sv/kdiff3
...
```

open the wrapper:
```
vim `which kdiff3`
```

add the `bin/` where it's missing

## stale old version:
 http://kdiff3.sourceforge.net/
