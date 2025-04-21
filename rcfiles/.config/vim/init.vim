" TODO: fix this to work correctly for nvim without backwards-compatibility shims
" * https://tkg.codes/guide-to-modern-neovim-setup-2021/
" * https://stackoverflow.com/questions/48700563/how-do-i-install-plugins-in-neovim-correctly
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
if exists('g:vscode')
  " see vimrc; one-off copypasta as using the whole file causes weird theming
  " ... issues
  :noremap <silent> <Space> :silent noh<Bar>echo<CR>
  " NOTE: "Reload Window" to try out various edits, see https://stackoverflow.com/questions/42002852/how-to-restart-vscode-after-editing-extensions-config
  ;
else
  source ~/.config/nvim/.vimrc
endif
