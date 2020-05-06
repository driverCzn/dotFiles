set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'ycm-core/YouCompleteMe'
let g:ycm_confirm_extra_conf = 0
let g:ycm_key_list_select_completion = ['<Down>']  " handle ycm-ultisnip conflict
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
Plugin 'rdnetto/YCM-Generator'
Bundle 'luochen1990/rainbow'
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
Plugin 'majutsushi/tagbar'
Plugin 'preservim/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'vim-airline/vim-airline'
let g:airline_powerline_fonts = 1
Plugin 'wincent/command-t'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'python-mode/python-mode'
let g:pymode_rope = 1
let g:pymode_rope_rename_bind = '<leader>R'
let g:pymode_rope_completion = 0  " avoid conflict with ycm
Plugin 'jrosiek/vim-mark'
Plugin 'tpope/vim-obsession'
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//
Plugin 'tpope/vim-commentary'
Plugin 'tmux-plugins/vim-tmux'
Plugin 'zeek/vim-zeek'
Plugin 'mephux/bro.vim'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'junegunn/vim-easy-align'
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)


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
set nu
set rnu
set tabstop=4
set softtabstop=4
set expandtab
set ignorecase
set shiftwidth=4
set cindent
set cinoptions=>1s
set mouse=a
set scrolloff=5
" set mousemodel=popup_setpos
nmap <F3> :tabedit 
nmap <F5> :source ~/.vimrc<CR>
nmap <F8> :TagbarToggle<CR>
nmap <C-s> :w<CR>
nmap <C-q> :q<CR>
nmap <C-M-q> :q!<CR>
noremap yy "+yy
noremap y "+y
vmap < <gv
vmap > >gv
map <C-M-n> :tabnext<CR>
map <C-M-p> :tabNext<CR>
map <C-M-h> <C-w><C-h>
map <C-M-l> <C-w><C-l>
map <C-M-j> <C-w><C-j>
map <C-M-k> <C-w><C-k>
nmap <C-M-g> :YcmCompleter GoTo<CR>
"autocmd VimEnter * nested :call tagbar#autoopen(1)
"autocmd FileType * nested :call tagbar#autoopen(0)
"autocmd BufEnter * nested :call tagbar#autoopen(0)
" autocmd vimenter * NERDTree

map <F4> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!gcc % -o %<"
        " exec "!clang % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %< -std=c++11"
        exec "!time ./%<"
    elseif &filetype == 'java'
        exec "!javac %"
        exec "!time java %<"
    elseif &filetype == 'sh'
        exec "!time bash %"
    elseif &filetype == 'python'
        exec "!time python3 %"
    elseif &filetype == 'go'
        exec "!go build %<"
        exec "!time go run %"
    elseif &filetype == 'html'
        exec "!google-chrome-stable % &"
    elseif &filetype == 'mkd'
        exec "!~/.vim/markdown.pl % > %.html &"
        exec "!google-chrome %.html &"
    elseif &filetype == 'zeek'
        exec "!zeek %"
    endif
endfunc
