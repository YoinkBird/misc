################################################################################
# Powerlevel10k:
################################################################################
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
################################################################################
# END Powerlevel10k
################################################################################

################################################################################
# general zsh settings
################################################################################
# initialise completions with ZSH's compinit (src: https://asdf-vm.com/guide/getting-started.html#_2-configure-asdf)
# from 'man zshbuiltins':
# -U : alias expansion is suppressed when the function is loaded
# -z : mark the function to be autoloaded using the zsh style
autoload -Uz compinit && compinit

################################################################################
# Source other config files
# opinionated: within the dir containing the this file (i.e. .zshrc), there will be a:
#  .zshrc and .config/zshrc.d
#  .zshrc and .config/shell_settings_agnostic.sh
################################################################################
# DEV NOTE: 
# DEV NOTE: disabling, but keeping for reference for the zsh syntax
# DEV: equ to BASH_SOURCE: https://stackoverflow.com/questions/9901210/bash-source0-equivalent-in-zsh
# DEV: > Here % indicates prompt expansion on the value,
# DEV: > %N indicates "The name of the script, sourced file, or shell function that zsh is currently executing,
# pushd "$(dirname "$(readlink -f "${(%):-%N}")")" > /dev/null
# popd > /dev/null

# DECISION: source from system-configured dir, even though it _mostly_ symlinks back to the config-as-code repo. Rationale: need to _not_ track some of the config files, and the easiest way to do that is to simply not have them in the repo in the first place. Plus, this "feels" better - setting up the configs from the system-path instead of the repo-path, even if most of them are just links back to the repo-path
pushd $HOME > /dev/null
# opinionated: source this shell-agnostic settings file
. .config/shell_settings_agnostic.sh

# Source all files from zshrc.d dir
# DEV NOTE: 'N' null_glob option, src: https://unix.stackexchange.com/a/26825
for CFG_FILE in .config/zshrc.d/*(N); do
  . "${CFG_FILE}"
done
popd > /dev/null

################################################################################
# Powerlevel10k:
################################################################################
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
################################################################################
# END Powerlevel10k
################################################################################

# MUST be at end
test -e "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" && \
  source "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
