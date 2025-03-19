#!/usr/bin/env bash
# enable touchid for sudo
sed "s/^#auth/auth/" /etc/pam.d/sudo_local.template | sudo tee /etc/pam.d/sudo_local
# install brew , then brew install tools
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

set -x
# all the good unix utils
brew install coreutils
brew install findutils
## pretty video screensaver from appletv
# https://aerialscreensaver.github.io/installation.html
brew install --cask aerial 

brew install openoffice libreoffice

brew install openjdk
echo 'export PATH="/usr/local/opt/openjdk/bin:$PATH"' >> ~/.zshrc

# enhanced cat
brew install bat
# cli for file structures
brew install tree

# difftool
brew install kdiff3

# git productivity
# https://github.com/jesseduffield/lazygit#installation
brew install jesseduffield/lazygit/lazygit

# containerized lightweight k8s using rancher k3d
brew install k3d
k3d completion "$(basename $SHELL)" > ~/.zshrc_completion_zshrc

# for k8s
brew install helm
helm completion "$(basename $SHELL)" > ~/.zshrc_completion_helm

# cli for json and yaml
brew install jq yq

# cli web browser
brew install lynx

# https://github.com/wulkano/Kap - record screen snippet as gif
brew install --cask kap

# https://formulae.brew.sh/formula/sl - steam-locomotive
brew install sl

# difftools
brew install meld
brew install ydiff

# database
brew install pgcli

# misc
brew install --cask \
  itsycal \
  clocker \
  vlc \
  contexts \
  sensiblesidebuttons \
  deepl

## calendar app in statusbar
# https://www.mowglii.com/itsycal/
## extra mouse buttons in firefox
# https://sensible-side-buttons.archagon.net/
## misc
# https://www.videolan.org/vlc/download-macosx.html
## [ license ] great alt-tab switcher
# https://contexts.co/

