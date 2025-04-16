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
autoload -U compinit; compinit

################################################################################
# Source other config files
# opinionated: within the dir containing the this file (i.e. .zshrc), there will be a:
#  .zshrc and .config/zshrc.d
#  .zshrc and .config/shell_settings_agnostic.sh
################################################################################
# DEV NOTE: 
# DEV: equ to BASH_SOURCE: https://stackoverflow.com/questions/9901210/bash-source0-equivalent-in-zsh
# DEV: > Here % indicates prompt expansion on the value,
# DEV: > %N indicates "The name of the script, sourced file, or shell function that zsh is currently executing,
pushd "$(dirname "$(readlink -f "${(%):-%N}")")" > /dev/null

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
