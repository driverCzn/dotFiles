call plug#begin('~/.vim/plugged')

" EASYMOTION
Plug 'Lokaltog/vim-easymotion'

" THEME OR COLOR
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plugin 'altercation/vim-colors-solarized'
"Plug 'luochen1990/rainbow'
"Plugin 'kien/rainbow_parentheses.vim'
"Plugin 'jeaye/color_coded'
"Plugin 'octol/vim-cpp-enhanced-highlight'

" AUTO-COMPLETION
"Plugin 'Valloric/YouCompleteMe'
Plug 'roxma/nvim-completion-manager'  " I PREFER THIS
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'roxma/clang_complete'

" TYPING
Plug 'tommcdo/vim-exchange'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdcommenter'
Plug 'godlygeek/tabular'

" INTEGRATION
"Plug 'pix/vim-hints_man'  " Don't know how to use

"Plugin 'mattn/emmet-vim'
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nu
syntax enable
set clipboard=unnamed

" Theme settings
let g:enable_bold_font = 1
"let g:enable_italic_font = 1  # let comments to be in italic
set background=dark
colorscheme hybrid_material

" airline status-line config
let g:airline_theme='hybridline'
let g:airline_powerline_fonts=0

" NCM-UltiSnips
let g:UltiSnipsExpandTrigger        = "<tab>"
let g:UltiSnipsJumpForwardTrigger   = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger  = "<c-k>"
let g:UltiSnipsRemoveSelectModeMappings = 0
"let g:UltiSnipsExpandTrigger        = "<Plug>(ultisnips_expand)"
"inoremap <silent> <c-u> <c-r>=cm#sources#ultisnips#trigger_or_popup("\<Plug>(ultisnips_expand)")<cr>

" clang_complete config
let g:clang_library_path='/usr/lib/llvm-4.0/lib/libclang.so.1'
" <Plug>(clang_complete_goto_declaration_preview)
au FileType c,cpp  nmap <leader>g <Plug>(clang_complete_goto_declaration)

"将leader设为逗号
let mapleader = ","
let g:mapleader = ","

"hi Normal ctermfg=252 ctermbg=none
set so=3                       " Set 3 lines to the cursor - when moving vertically using j/k
set autoread                   " Set to auto read when a file is changed from the outside
set nu
set termguicolors              " enable TrueColor
set cursorline
set cursorcolumn
set hls                        " highlight search
set ignorecase                 " 搜索忽略大小写
set incsearch                  " 输入同时搜索
set ruler                      " 任务栏标尺
set showcmd                    " 右下角显示待输入命令
set backspace=indent,eol,start " 让backspace能在行尾删除
set expandtab                  " 用空格代替tab
set textwidth=79               " 文本最大长度79，目前不知道有什么用
set colorcolumn=80             " 在第80列显示竖条
set nowrap                     " don't automatically wrap on load
set fo-=t                      " don't automatically wrap text when typing
set noshowmode
set magic                      " For regular expressions turn magic on
set smarttab                   " Be smart when using tabs ;)
set laststatus=2
set showtabline=2
set mouse=a
"set mouse-=c
"set completeopt=longest,menu
set nobackup
set nowritebackup
set noswapfile
set relativenumber
set fileencodings=utf8,gb2312,gbk,gb18030,big5
"set spell
" make tabs visible
set list
set listchars=tab:>-,trail:-
" 统一缩进为4
set tabstop=4
set softtabstop=4
set shiftwidth=4

map <Leader> <Plug>(easymotion-prefix)
"切换窗口
"nnoremap <C-h> <C-w>h
"nnoremap <C-j> <C-w>j
"nnoremap <C-k> <C-w>k
"nnoremap <C-l> <C-w>l

"insert mode shortcut
inoremap <c-f> <right>
inoremap <c-b> <left>
inoremap <c-e> <end>
inoremap <c-a> <home>

" transform between hex and raw
nnoremap <leader>h :%!xxd<cr>
nnoremap <leader>r :%!xxd -r<cr>
"默认开启normal和visual模式的正则表达式搜索
nnoremap / /\v
vnoremap / /\v
"nnoremap <tab> %  " conflicts with jump list
"vnoremap <tab> %

" NERDTree
map <F3> :NERDTreeToggle<CR>
imap <F3> <ESC>:NERDTreeToggle<CR>

" Fast saving && quitting
nmap <leader><leader>w :w!<cr>
nmap <leader>q :q!<cr>
nmap <leader>x :x!<cr>
nmap <leader>o :only<cr>
"nmap ; :

" Easy moving between tabs
map <leader>n <esc>:tabprevious<cr>
map <leader>m <esc>:tabnext<cr>

" Easier moving of code blocks
vnoremap < <gv
vnoremap > >gv

" Vim-repeat 配置
silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)

"C，C++ 按F5编译运行 " TODO
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        "exec "!gcc -m32 % -o %< -std=c99"
        exec "!clang % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %< -std=c++11"
        exec "!time ./%<"
    elseif &filetype == 'java'
        exec "!javac %"
        exec "!time java %<"
    elseif &filetype == 'sh'
        :!time bash %
    elseif &filetype == 'python'
        exec "!time python3 %"
    elseif &filetype == 'html'
        exec "!google-chrome-stable % &"
    elseif &filetype == 'go'
        exec "!go build %<"
        exec "!time go run %"
    elseif &filetype == 'mkd'
        exec "!~/.vim/markdown.pl % > %.html &"
        exec "!google-chrome %.html &"
    endif
endfunc

"C,C++的调试
map <F8> :call Rungdb()<CR>
func! Rungdb()
    exec "w"
    exec "!g++ % -g -o %<"
    exec "!gdb ./%<"
endfunc

function! MyTabFunction ()
    let line = getline('.')
    let substr = strpart(line, -1, col('.')+1)
    let substr = matchstr(substr, "[^ \t]*$")
    if strlen(substr) == 0
        return "\<tab>"
    endif
    return pumvisible() ? "\<c-n>" : "\<c-x>\<c-o>"
endfunc
inoremap <tab> <c-r>=MyTabFunction()<cr>

" 设置快速编辑.vimrc快捷键
"map <silent> <leader>ee :e ~/.vimrc<cr>
map <silent> <leader>ee :e ~/.config/nvim/init.vim<cr>
" 设置快速编辑.zshrc快捷键
map <silent> <leader>z :e ~/.zshrc<cr>
