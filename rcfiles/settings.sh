alias tree="tree -C"
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
export EDITOR=vim
# Should your editor deals with streamed vs on disk files differently, also set...
export K9S_EDITOR=vim
