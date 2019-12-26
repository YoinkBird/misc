set nocompatible
" needs to be installed first
"so ~/.vim/vundle.vimrc

" http://stackoverflow.com/a/31695784
let g:loaded_logipat = 1

" visual appearance
set t_Co=256   " doesn't work in old versions of terminals
set number  "line numbers
set showtabline=2 " always show tabline (even for one file)

" allow backspacing over everything in insert mode
set backspace=indent,eol,start "without this, can't ^H immediately after 'i'
"fixdel
"set t_kb=^?

"indentation
set autoindent
set expandtab
set shiftwidth=2
set softtabstop=2

" no comment indent . src: https://unix.stackexchange.com/a/106538
set indentkeys-=0#


" code recognition
syntax on
if &filetype == "*"
  setfiletype perl
elseif expand('%') == "*sqlite"
  setfiletype sql
endif
filetype plugin indent on

" custom shift+%
"TEMP
"so ~/.vim/plugins/matchit/plugin/matchit.vim
"TEMP
"so ~/.vim/syntax/systemverilog.vim

""search
set ignorecase
set smartcase "search insensitive unless uppercase letters are used
set incsearch "highlight as matched
set hlsearch  " highlight search results. :noh to clear current results.

"" tags
set tags=./tags;,tags;

" mapping
" reference: http://stackoverflow.com/a/3776182
"" Disable highlight with spacebar TODO: disable during 'delete'
"  source:
"  http://unix.stackexchange.com/questions/22027/vim-dont-highlight-search-term-after-a-search-replace
"  NonRecursiveMap <don't print cmd> <Spacebar> :(don't print output) undohighlight <|> echo <CR>
:noremap <silent> <Space> :silent noh<Bar>echo<CR>

" colors
" https://alvinalexander.com/linux/vi-vim-editor-color-scheme-syntax
"+ clear with ':highlight clear cursorcolumn'
"+ clear with ':highlight cursorcolumn ctermbg=None'
" visual cues
set cursorcolumn
highlight cursorcolumn term=underline ctermbg=None
highlight cursorcolumn ctermbg=DarkGrey
set cursorline

" better mouse scrolling
set mouse=a

" gvim
if has("gui_running")
  colorscheme desert
endif

" tips
" scroll both windows
" :windo set scrollbind
