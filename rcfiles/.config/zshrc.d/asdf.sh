# ASDF
# https://asdf-vm.com/guide/getting-started.html#_2-configure-asd
### ---
### Add shims directory to path (required) 
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
### ---
### Set up shell completions (optional) 
## run-once:
# mkdir -p "${ASDF_DATA_DIR:-$HOME/.asdf}/completions"
# asdf completion zsh > "${ASDF_DATA_DIR:-$HOME/.asdf}/completions/_asdf"
## Then add the following to your .zshrc:
# append completions to fpath
fpath=(${ASDF_DATA_DIR:-$HOME/.asdf}/completions $fpath)
