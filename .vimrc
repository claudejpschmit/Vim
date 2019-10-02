
"Vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'Valloric/ListToggle'
Plugin 'scrooloose/syntastic'
"Plugin 'rdnetto/YCM-Generator'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" YouCompleteMe
"map <F5> :YcmForceCompileAndDiagnostics<CR>

"let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
" Do not ask when starting vim
"let g:ycm_confirm_extra_conf = 0
"let g:syntastic_always_populate_loc_list = 1
"let g:ycm_collect_identifiers_from_tags_files = 1
"set tags = ./.tags

" PATHOGEN
call pathogen#infect()
let g:cssColorVimDoNotMessMyUpdatetime = 1
let g:tagbar_usearrows = 1
nmap <F8> :TagbarToggle<CR>

map <F4> :set spelllang=en_gb <CR>

"Supertab
au FileType python set omnifunc=pythoncomplete#Complete
"let g:SuperTabDefaultCompletionType = "context"

"Gundo
map <leader>g :GundoToggle<CR>

"Powerline
"set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
"let g:Powerline_symbols = 'fancy'

" Arduino
autocmd! BufNewFile,BufRead *.pde setlocal ft=arduino
autocmd! BufNewFile,BufRead *.ino setlocal ft=arduino

"Fugitive
"call fugitive#statusline()


"Ctags
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
set tags=./tags;/

:nmap \o :set paste!<CR>
:nmap j gj
:nmap k gk
:cnoremap <C-a>  <Home>
:cnoremap <C-b>  <Left>
:cnoremap <C-f>  <Right>
:cnoremap <C-d>  <Delete>
:cnoremap <M-b>  <S-Left>
:cnoremap <M-f>  <S-Right>
:cnoremap <M-d>  <S-right><Delete>
:cnoremap <Esc>b <S-Left>
:cnoremap <Esc>f <S-Right>
:cnoremap <Esc>d <S-right><Delete>
:cnoremap <C-g>  <C-c>
:nmap \t :set expandtab tabstop=4 shiftwidth=4 softtabstop=4<CR>

set nocompatible

"Encoding
set enc=utf-8

"C++
au BufRead *.cpp set tabstop=4
au BufRead *.cpp set shiftwidth=4
au BufRead *.c set tabstop=4
au BufRead *.c set shiftwidth=4
au BufRead *.hpp set tabstop=4
au BufRead *.hpp set shiftwidth=4
au BufRead *.h set tabstop=4
au BufRead *.h set shiftwidth=4

"Python:
au BufRead *.py set tabstop=4
au BufRead *.py set shiftwidth=4

"HTML:
au BufRead *.html set tabstop=4
au BufRead *.html set shiftwidth=4


set number
syntax on
set bg=dark
colorscheme kolor

set shiftwidth=4
set tabstop=4
set expandtab
set showcmd                   " Show (partial) command in status line.
set showmatch                 " Show matching brackets.
set ignorecase                " Do case insensitive matching
set smartcase                 " Do smart case matching
set incsearch                 " Incremental search
set hlsearch                  " highlight the search
set hidden                    " Hide buffers when they are abandoned

set ruler                     " show the line number on the bar
set nocompatible              " vim, not vi
set autoindent                " auto/smart indent
set undolevels=1000           " 1000 undos
set updatecount=100           " switch every 100 chars
set complete=.,w,b,u,U,t,i,d  " do lots of scanning on tab completion
set ttyfast                   " we have a fast terminal
set noerrorbells              " No error bells please
set shell=bash
set fileformats=unix
set ff=unix

set t_Co=256
"colorscheme gardener

filetype on                   " Enable filetype detection
filetype indent on            " Enable filetype-specific indenting
filetype plugin on            " Enable filetype-specific plugins

" spelling
if v:version >= 700
  " Enable spell check for text files
  autocmd BufNewFile,BufRead *.txt setlocal spell spelllang=en_gb
  autocmd BufNewFile,BufRead *.mkd setlocal spell spelllang=en_gb
  " Set a line width for text files
  autocmd BufNewFile,BufRead *.txt set tw=72
  "autocmd BufNewFile,BufRead *.mkd set tw=72
  autocmd BufNewFile,BufRead requirements.txt set nospell
  autocmd BufNewFile,BufRead requirements.txt set tw=0
endif

" toggle paste mode
nmap <LocalLeader>pp :set paste!<cr>

"Make cursor behave as expected at wrapped lines
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk

set mouse=a                   " Enable mouse

"Folding/hiding functions:
set foldmethod=indent
set foldcolumn=3

set noerrorbells
set visualbell
set t_vb=

" Show me show me show me!
set   ruler
set   title
set   showmode
set   showcmd
set   showmatch    " matching bracket
set   laststatus=2 " show the status line always
" but not all the messages
set   shortmess=atTI
set   ttyscroll=0

" Email/News
" ==========
"
" Clear Empty Lines
map ,cel :%s/^\s\+$//e
map ,cqoq :%s/^>\s\+/> /e
" remove all > On blah... stuff left behind in quoted text - huggie
nmap ,cqmh :g/^\([>*] \)\+On.*wrote:$/d<CR>
" Kill empty quoted lines
nmap ,ceql :g/^\(> \)\{2,}\s*$/d<CR>
nmap ,cqel :%s/^> \s*$//<CR>
"    ,Sl = "squeeze lines"
"    Turn all blocks of empty lines (within current visual)
"    into *one* empty line:
map ,dl :g/^$/,/./-j

" Condense multiple Re:'s
map ,re 1G/^Subject:<CR>:s/\(Re: \)\+/Re: /e<CR>

" Sven's wondeful change subject macro
map ,cs 1G/^Subject: <CR>yypIX-Old-<ESC>-W

vmap ,qp    :s/^/> /<CR>

" Mail and News autocommands
" ==========================

au BufRead /tmp/mutt* set tw=72
autocmd BufNewFile,BufRead /tmp/mutt* setlocal spell spelllang=pl
au BufRead /tmp/sup* set tw=72
autocmd BufNewFile,BufRead /tmp/sup* setlocal spell spelllang=pl
au BufRead *TODO set tw=72
autocmd BufNewFile,BufRead *TODO setlocal spell spelllang=pl

" Remove quoted On blah stuff
" au BufRead ~/.article*,~/tmp/mutt* :normal ,cqmh
" Remove empty quoted lines
"au BufRead /tmp/mutt* :normal ,ceql
" Remove the empty lines after an unquoted On blah stuff
"au BufRead /tmp/mutt* :normal ,db
" Clear empty lines and turn into space to write in
"au BufRead /tmp/mutt* :normal ,cqel
" Remove blocks of empty lines
"au BufRead /tmp/mutt* :normal ,dl
" Remove many Re:'s from the Subject line
"au BufRead /tmp/mutt* :normal ,re




