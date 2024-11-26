" TODO: fix this to work correctly for nvim without backwards-compatibility shims
" * https://tkg.codes/guide-to-modern-neovim-setup-2021/
" * https://stackoverflow.com/questions/48700563/how-do-i-install-plugins-in-neovim-correctly
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.config/nvim/.vimrc
