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
# generated values - appended by e.g. blah_cmd >> ~/.zshrc
################################################################################
