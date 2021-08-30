## Worklog - iteration to install kdiff3
### cmake - required for kdiff3
https://cmake.org/download/
### kdiff3 prereq - resolved in order
brew install ecm extra-cmake-modules boost qt5
### kde prereq
https://invent.kde.org/packaging/homebrew-kde
```
brew untap kde-mac/kde 2> /dev/null
brew tap kde-mac/kde https://invent.kde.org/packaging/homebrew-kde.git --force-auto-update
"$(brew --repo kde-mac/kde)/tools/do-caveats.sh"
```

## WORKING STRATEGY
### red herring: https://invent.kde.org/sdk/kdiff3/-/blob/master/INSTALL
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
nvim `which kdiff3`
```

add the `bin/` where it's missing



# WORKLOG
kdiff3 % APPLE_SUPPRESS_X11_WARNING=ON cmake .
Installing in /usr/local. Run /Users/USER/ws/tmp/kdiff3/prefix.sh to set the environment for kdiff3.
-- Could not set up the appstream test. appstreamcli is missing.
CMake Warning at /usr/local/share/ECM/kde-modules/KDECMakeSettings.cmake:272 (message):
  Searching for X11 and related technologies is disabled on Apple systems.
  Set APPLE_FORCE_X11 to ON to change this behaviour.  Set
  APPLE_SUPPRESS_X11_WARNING to ON to hide this warning.
Call Stack (most recent call first):
  CMakeLists.txt:27 (include)


CMake Error at /usr/local/Cellar/cmake/3.20.1/share/cmake/Modules/FindPackageHandleStandardArgs.cmake:230 (message):
  Could NOT find Boost (missing: Boost_INCLUDE_DIR) (Required is at least
  version "1.66")
Call Stack (most recent call first):
  /usr/local/Cellar/cmake/3.20.1/share/cmake/Modules/FindPackageHandleStandardArgs.cmake:594 (_FPHSA_FAILURE_MESSAGE)
  /usr/local/Cellar/cmake/3.20.1/share/cmake/Modules/FindBoost.cmake:2344 (find_package_handle_standard_args)
  CMakeLists.txt:39 (find_package)


-- Configuring incomplete, errors occurred!
See also "/Users/USER/ws/tmp/kdiff3/CMakeFiles/CMakeOutput.log".
See also "/Users/USER/ws/tmp/kdiff3/CMakeFiles/CMakeError.log".

% export APPLE_SUPPRESS_X11_WARNING=ON
USER@HOST kdiff3 % cmake .
Installing in /usr/local. Run /Users/USER/ws/tmp/kdiff3/prefix.sh to set the environment for kdiff3.
-- Could not set up the appstream test. appstreamcli is missing.
CMake Warning at /usr/local/share/ECM/kde-modules/KDECMakeSettings.cmake:272 (message):
  Searching for X11 and related technologies is disabled on Apple systems.
  Set APPLE_FORCE_X11 to ON to change this behaviour.  Set
  APPLE_SUPPRESS_X11_WARNING to ON to hide this warning.
Call Stack (most recent call first):
  CMakeLists.txt:27 (include)


CMake Error at /usr/local/Cellar/cmake/3.20.1/share/cmake/Modules/FindPackageHandleStandardArgs.cmake:230 (message):
  Could NOT find Boost (missing: Boost_INCLUDE_DIR) (Required is at least
  version "1.66")
Call Stack (most recent call first):
  /usr/local/Cellar/cmake/3.20.1/share/cmake/Modules/FindPackageHandleStandardArgs.cmake:594 (_FPHSA_FAILURE_MESSAGE)
  /usr/local/Cellar/cmake/3.20.1/share/cmake/Modules/FindBoost.cmake:2344 (find_package_handle_standard_args)
  CMakeLists.txt:39 (find_package)


-- Configuring incomplete, errors occurred!
See also "/Users/USER/ws/tmp/kdiff3/CMakeFiles/CMakeOutput.log".
See also "/Users/USER/ws/tmp/kdiff3/CMakeFiles/CMakeError.log".

% brew install boost
==> icu4c
icu4c is keg-only, which means it was not symlinked into /usr/local,
because macOS provides libicucore.dylib (but nothing else).

If you need to have icu4c first in your PATH, run:
  echo 'export PATH="/usr/local/opt/icu4c/bin:$PATH"' >> ~/.zshrc
  echo 'export PATH="/usr/local/opt/icu4c/sbin:$PATH"' >> ~/.zshrc

For compilers to find icu4c you may need to set:
  export LDFLAGS="-L/usr/local/opt/icu4c/lib"
  export CPPFLAGS="-I/usr/local/opt/icu4c/include"

% APPLE_SUPPRESS_X11_WARNING=ON cmake .
k


==> Pouring qt@5--5.15.2.catalina.bottle.tar.gz
==> Caveats
We agreed to the Qt open source license for you.
If this is unacceptable you should uninstall.

qt@5 is keg-only, which means it was not symlinked into /usr/local,
because this is an alternate version of another formula.

If you need to have qt@5 first in your PATH, run:
  echo 'export PATH="/usr/local/opt/qt@5/bin:$PATH"' >> ~/.zshrc

For compilers to find qt@5 you may need to set:
  export LDFLAGS="-L/usr/local/opt/qt@5/lib"
  export CPPFLAGS="-I/usr/local/opt/qt@5/include"
