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

" navigation
" vvv remember to use h,j,k,l for jumping
set relativenumber

"indentation
set autoindent
set expandtab
set shiftwidth=2
set softtabstop=2

" no comment indent . src: https://unix.stackexchange.com/a/106538
set indentkeys-=0#

" always unix. src: https://stackoverflow.com/a/45459733. also set git autocrlf=false in ~/.gitconfig. src: https://stackoverflow.com/a/2825829
set ffs=unix
" stop touching things. stopit. stopstopstop:  When writing a file and this option is on, <EOL> at the end of file will be restored if missing.
set nofixendofline

" code recognition
syntax on
"if &filetype == "*"
"  setfiletype perl
if expand('%') == "*sqlite"
  setfiletype sql
elseif expand('%') == "*hcl"
  setfiletype tf
endif
filetype plugin indent on

" markdown settings
let g:markdown_fenced_languages=['bash=sh', 'sh', 'json=javascript', 'diff']

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
" term colors, via https://askubuntu.com/a/126
set termguicolors

" better mouse scrolling
set mouse=a

" netrw
" enable numbers, src: https://stackoverflow.com/a/8731175
" +  /usr/local/Cellar/vim/8.2.2800/share/vim/vim82/autoload/netrw.vim
" + call s:NetrwInit("g:netrw_bufsettings" , "noma nomod nonu nobl nowrap ro nornu")
let g:netrw_bufsettings = "noma nomod nu nobl nowrap ro nornu"

" gvim
if has("gui_running")
  colorscheme desert
endif

" do not automatically read the file
set noautoread

" tips
" scroll both windows
" :windo set scrollbind
"
"

" session
" Go away and come back
" src: http://vim.wikia.com/wiki/Go_away_and_come_back via https://stackoverflow.com/a/31978241 
"
function! MakeSession()
  let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
  if (filewritable(b:sessiondir) != 2)
    exe 'silent !mkdir -p ' b:sessiondir
    redraw!
  endif
  let b:filename = b:sessiondir . '/session.vim'
  exe "mksession! " . b:filename
endfunction

function! LoadSession()
  let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
  let b:sessionfile = b:sessiondir . "/session.vim"
  if (filereadable(b:sessionfile))
    exe 'source ' b:sessionfile
  else
    echo "No session loaded."
  endif
endfunction

" Adding automatons for when entering or leaving Vim
if(argc() == 0)
  au VimEnter * nested :call LoadSession()
endif
au VimLeave * :call MakeSession()
