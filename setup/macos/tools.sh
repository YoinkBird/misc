#!/usr/bin/env bash
################################################################################
# SYSTEM SETTINGS
################################################################################
# enable touchid for sudo
sed "s/^#auth/auth/" /etc/pam.d/sudo_local.template | sudo tee /etc/pam.d/sudo_local

# zsh
# enable shell completion
grep 'autoload -U compinit; compinit' ~/.zshrc || \
  echo 'autoload -U compinit; compinit' >> ~/.zshrc

################################################################################
# INSTALL installer: brew
################################################################################
which brew
rc=$?
if [[ rc -ne 0 ]]; then
  # https://rew.sh/
  curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | less
  read -p "proceed? to continue, type 'yes'" answer
  if [[ "${answer}" != "yes" ]]; then
    exit 0
  fi
  # don't type in password during install script
  sudo bash -c 'whoami'
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
# TODO: revisit whether not to use this one
# https://homebrew-file.readthedocs.io/en/stable/getting_started.html
# brew init

# TODO: revisit brew bundle and how to manage out-of-band cmds such as updating PATH, configuring "$tool completion", etc

################################################################################
# INSTALL installer: mas
################################################################################
# CLI for App Store installations
# https://github.com/mas-cli/mas
# see also https://apple.stackexchange.com/a/72148
brew install mas
# NOTE: not 'softwareupdate'
# https://apple.stackexchange.com/a/72152

################################################################################
# INSTALL via brew
################################################################################
set -x
# all the good unix utils
brew install coreutils \
  findutils
## pretty video screensaver from appletv
# https://aerialscreensaver.github.io/installation.html
brew install --cask aerial 

brew install openoffice libreoffice

brew install openjdk
grep 'export PATH="/usr/local/opt/openjdk/bin:$PATH"' ~/.zshrc || \
  echo 'export PATH="/usr/local/opt/openjdk/bin:$PATH"' >> ~/.zshrc

brew install nvim tmux

# enhanced cat
brew install bat
# cli for file structures
brew install tree

# git productivity
# https://github.com/jesseduffield/lazygit#installation
brew install jesseduffield/lazygit/lazygit

# containerized lightweight k8s using rancher k3d
brew install k3d
# verify completion script
ls "${fpath[1]}/_k3d" || k3d completion $SHELL

# for k8s
brew install helm
# verify completion script
ls "${fpath[1]}/_helm" || helm completion $SHELL

# cli for json and yaml
brew install jq yq

# cli web browser
brew install lynx

# https://github.com/wulkano/Kap - record screen snippet as gif
brew install --cask kap

# https://formulae.brew.sh/formula/sl - steam-locomotive
brew install sl

# difftools
brew install meld ydiff kdiff3

# database
brew install pgcli

# miscellaneous:
## calendar app in statusbar
# https://www.mowglii.com/itsycal/
## extra mouse buttons in firefox
# https://sensible-side-buttons.archagon.net/
## misc
# https://www.videolan.org/vlc/download-macosx.html
## [ license ] great alt-tab switcher
# https://contexts.co/
brew install --cask \
  itsycal \
  vlc \
  contexts \
  sensiblesidebuttons \
  deepl

################################################################################
# INSTALL via mas
# https://github.com/mas-cli/mas
# where 'mas' itself is installed via 'brew'
################################################################################

# Clocker:
# mas info 1056643111: Clocker 24.03 [Free], By: Abhishek Banthia, From: https://apps.apple.com/us/app/clocker/id1056643111?mt=12&uo=4
mas install 1056643111 || mas upgrade 1056643111
