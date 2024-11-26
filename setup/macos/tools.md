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

## IDK

https://download.kde.org/stable/kdiff3/

https://stackoverflow.com/questions/33722301/how-to-setup-kdiff3-in-mac-os

`.gitconfig`:
```
[merge]
        tool = kdiff3
        # tool = /Applications/kdiff3.app/Contents/MacOS/kdiff3

[mergetool "kdiff3"]
        cmd = /Applications/kdiff3.app/Contents/MacOS/kdiff3 $BASE $LOCAL $REMOTE -o $MERGED

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

### broken now:
```bash
ninja:build stopped: subcommand failed.

If reporting this issue please do so to (not Homebrew/brew or Homebrew/homebrew-core):
  kde-mac/kde

/opt/homebrew/Library/Homebrew/utils/github/api.rb:339:in `raise_error': Validation Failed: [{"message"=>"The listed users and repositor cannoched either because the resources do not exist or you do not have permission to view them.", "resource"=>"Search", "field"=>"q",=>"invalid"}] (GitHub::API::ValidationFailedError)
```

## stale old version:
 http://kdiff3.sourceforge.net/

# AWS CLI 
https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-mac.html#cliv2-mac-install-cmd

# lazygit
https://github.com/jesseduffield/lazygit#installation
