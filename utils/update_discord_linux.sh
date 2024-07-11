#!/usr/bin/env bash
set -eux
#---
# download + install
sudo -v && curl -L -o discord-latest.deb "https://discord.com/api/download/stable?platform=linux&format=deb" && sudo dpkg -i discord-latest.deb
#---
# let discord auto-update + verify.
# Hack: pass an invalid CLI option to get a "headless" session, in which discord will auto-update, then if return is clean, launch discord
discord -h
#---
# launch
nohup discord > /dev/null &
#---
# cleanup
rm discord-latest.deb

