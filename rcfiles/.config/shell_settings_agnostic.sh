# tool-specific settings
# i.e. shell agnostic, not specific to bash,zsh,etc
alias tree="tree -C -I venv -I .git --gitignore"
# for 'ls'
export CLICOLOR=""
## see also https://geoff.greer.fm/lscolors/
export LSCOLORS="exfxcxdxbxegedabagacad"
# for colours in 'grep' and 'ggrep' (MacOS)
alias grep='grep --color'
alias ggrep='ggrep --colour'

# other
## follow https://askubuntu.com/a/1285068

# src: https://github.com/derailed/k9s , but also EDITOR is used by all the things
# Kubectl edit command will use this env var.
# NOTE: not sure wy, but this breaks ^a (not sure where, either zsh or macos. hasn't been issue on linux)
# % export EDITOR=vim
# % $SHELL
# % word^A
bindkey -e
export EDITOR=vim
# Should your editor deals with streamed vs on disk files differently, also set...
export K9S_EDITOR=vim

# go - set gopath if go installed
go env > /dev/null && \
  export PATH="${PATH}:$(go env GOPATH)/bin"
# REMINDER: ignore any tutorials which set GOPATH, deprecated since 1.11 with go mod, see e.g. https://stackoverflow.com/a/53026674
