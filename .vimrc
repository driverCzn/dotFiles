set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'ycm-core/YouCompleteMe'
Bundle 'luochen1990/rainbow'
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
Plugin 'majutsushi/tagbar'
Plugin 'vim-airline/vim-airline'
Plugin 'wincent/command-t'

" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'https://git.wincent.com/command-t.git'

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
"
set ignorecase
set shiftwidth=4
set cindent
set cinoptions=>0.5s
set mouse=a
nmap <F3> :tabedit 
nmap <F5> :source ~/.vimrc<CR>
" nmap <F8> :TagbarToggle<CR>
nmap <C-s> :w<CR>
nmap <C-q> :q<CR>
nmap <C-M-q> :q!<CR>
noremap yy "+yy
noremap y "+y
map <C-M-n> :tabnext<CR>
map <C-M-p> :tabNext<CR>
map <C-M-h> <C-w><C-h>
map <C-M-l> <C-w><C-l>
map <C-M-j> <C-w><C-j>
map <C-M-k> <C-w><C-k>
autocmd VimEnter * nested :call tagbar#autoopen(1)
autocmd FileType * nested :call tagbar#autoopen(0)
autocmd BufEnter * nested :call tagbar#autoopen(0)

