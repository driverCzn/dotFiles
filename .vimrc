set nocompatible               " be iMproved
filetype off                   " required!

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
" Plugin  'tpope/vim-fugitive'
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"Plugin 'crusoexia/vim-monokai'
Plugin 'godlygeek/tabular'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'mattn/emmet-vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-surround'
Plugin 'majutsushi/tagbar'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-repeat'
"Plugin 'kien/rainbow_parentheses.vim'
"Plugin 'jeaye/color_coded'
"Plugin 'scrooloose/syntastic'
Bundle 'luochen1990/rainbow'
"Plugin 'tomasr/molokai'
Plugin 'vim-scripts/awk.vim'
Plugin 'tpope/vim-markdown'
Plugin 'vim-scripts/bash-support.vim'
Plugin 'suan/vim-instant-markdown'
"Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'vim-scripts/fcitx.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'nvie/vim-flake8'
Plugin 'fs111/pydoc.vim'
Plugin 'klen/python-mode'

call vundle#end()            " required
filetype plugin indent on     " required!

set nu
syntax enable
set background=dark
set clipboard=unnamed
" Show whitespace
" Must be inserted BEFORE the colorscheme
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/
colorscheme solarized
let g:solarized_termcolors=256
let python_highlight_all=1

autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd BufNewFile *.c,*.sh :call SetTitle()
autocmd BufNewFile *.py 0r ~/.python_header
autocmd BufNewFile *.py normal G

func SetTitle()
    if &filetype == 'c'
        call setline(1, "#include<stdio.h>")
    endif
    "if &filetype == 'sh'
        "call setline(1, "#!/bin/bash")
    "endif

    autocmd BufNewFile * normal G
endfunc

let g:pymod_repo_extended_complete = 1
let g:pymod_syntax = 1
let g:ctrlp_max_height=30
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1
"let g:color_coded_filetypes = ['c', 'cpp', 'py']
"let g:color_coded_enabled = 1

let g:BASH_AuthorName   = 'driverczn'
let g:BASH_Email        = 'driverczn@gmail.com'

"将leader设为逗号
let mapleader = ","
let g:mapleader = ","
"YouCompleteMe 功能
" 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
let g:ycm_confirm_extra_conf=0
" 补全功能在注释中同样有效
let g:ycm_complete_in_comments=1
" 开启 YCM 基于标签引擎
let g:ycm_collect_identifiers_from_tags_files=1
" 从第一个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=1
" 语法关键字补全
let g:ycm_seed_identifiers_with_syntax=1
"标准库tags，这个没有也没关系，只要.ycm_extra_conf.py文件中指定了正确的标准库路径
set tags+=/data/misc/software/misc./vim/stdcpp.tags
"让ycm使用ultisnips插件
let g:ycm_use_ultisnips_completer = 1
let g:ycm_complete_in_strings = 1
let g:ycm_key_list_previous_completion = ['<S-TAB>', '<Up>']
let g:UltiSnipsSnippetDirectories=["bundle/vim-snippets/UltiSnips"]
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
let g:ycm_show_diagnostics_ui = 1
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

let g:syntastic_error_symbol = '✗'  "set error or warning signs
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_check_on_open=1
let g:syntastic_enable_highlighting = 0
let g:syntastic_python_checker="flake8,pyflakes,pep8,pylint"
let g:syntastic_python_checkers=['pyflakes']
highlight SyntasticErrorSign guifg=white guibg=black

let g:syntastic_cpp_include_dirs = ['/usr/include/']
let g:syntastic_cpp_remove_include_errors = 1
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libstdc++'
let g:syntastic_enable_balloons = 1 "whether to show balloons

autocmd InsertLeave * if pumvisible() == 0|pclose|endif "离开插入模式后自动关闭预览窗口
let g:ycm_semantic_triggers =  {
            \   'c' : ['->', '.'],
            \   'cpp,objcpp' : ['->', '.', '::'],
            \   'perl' : ['->'],
            \   'php' : ['->', '::'],
            \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
            \   'ruby' : ['.', '::'],
            \   'lua' : ['.', ':'],
            \ }
" Expand snippet or return
let g:ulti_expand_res = 1
function! Ulti_ExpandOrEnter()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res
        return ''
    else
        return "\<return>"
endfunction

let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
let g:rainbow_conf = {
\   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
\   'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
\   'operators': '_,_',
\   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\   'separately': {
\       '*': {},
\       'tex': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
\       },
\       'lisp': {
\           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
\       },
\       'vim': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
\       },
\       'html': {
\           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
\       },
\       'css': 0,
\   }
\}
"highlight YcmErrorLine ctermbg=darkgrey
set cursorline
"hi CursorLine   cterm=NONE ctermbg=darkgrey ctermfg=NONE guibg=NONE guifg=NONE
hi Normal ctermfg=252 ctermbg=none
set so=3                       " Set 7 lines to the cursor - when moving vertically using j/k
set mouse-=a
set autoread                   " Set to auto read when a file is changed from the outside
set cursorcolumn
set nu
set hls                        " highlight search
set ignorecase                 " 搜索忽略大小写
set smartcase
set incsearch                  " 输入同时搜索
set ruler                      " 任务栏标尺
set showcmd                    " 右下角显示待输入命令
set backspace=indent,eol,start " 让backspace能在行尾删除
set expandtab                  " 用空格代替tab
set textwidth=79               " 文本最大长度79，目前不知道有什么用
set colorcolumn=80
set nowrap"don't automatically wrap on load
set fo-=t" don't automatically wrap text when typing
set showmode
set magic                      " For regular expressions turn magic on
set smarttab                   " Be smart when using tabs ;)
set laststatus=2
set completeopt=longest,menu
set nobackup
set nowritebackup
set noswapfile
set relativenumber
" make tabs visible
set list
set listchars=tab:>-,trail:-
" 统一缩进为4
set tabstop=4
set softtabstop=4
set shiftwidth=4

map <Leader> <Plug>(easymotion-prefix)
"切换窗口
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"默认开启normal和visual模式的正则表达式搜索
nnoremap / /\v
vnoremap / /\v
nnoremap <tab> %
vnoremap <tab> %

map <F3> :NERDTreeToggle<CR>
imap <F3> <ESC>:NERDTreeToggle<CR>
map! <C-O> <C-Y>,

" Fast saving && quitting
nmap <leader><leader>w :w!<cr>
nmap <leader>q :q!<cr>
nmap <leader>x :x!<cr>
nmap <leader>o :only<cr>

" Easy moving between tabs
map <leader>n <esc>:tabprevious<cr>
map <leader>m <esc>:tabnext<cr>

" Easier moving of code blocks
vnoremap < <gv " better indentation
vnoremap > >gv " better indentation
" Hex mode
nmap <leader><leader>h :%!xxd<cr>
nmap <leader><leader>b :%!xxd -r<cr>

" Vim-repeat 配置
silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)

"C，C++ 按F5编译运行
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!gcc % -o %< -std=c99"
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
        exec "!google-chrome % &"
    elseif &filetype == 'go'
        " exec "!go build %<"
        exec "!time go run %"
    elseif &filetype == 'mkd'
        exec "!~/.vim/markdown.pl % > %.html &"
        exec "!google-chrome %.html &"
    endif
endfunc"
"C,C++的调试
map <F8> :call Rungdb()<CR>
func! Rungdb()
    exec "w"
    exec "!g++ % -g -o %<"
    exec "!gdb ./%<"
endfunc

function! g:UltiSnips_Complete()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res == 0
        if pumvisible()
            return "\<C-n>"
        else
            call UltiSnips#JumpForwards()
            if g:ulti_jump_forwards_res == 0
               return "\<TAB>"
            endif
        endif
    endif
    return ""
endfunction

" Enter to expand snippet
inoremap <return> <C-R>=Ulti_ExpandOrEnter()<CR>

" 配置文件.vimrc更改后自动重新载入使设置生效
"autocmd! bufwritepost .vimrc source ~/.vimrc
"设置重新载入.vimrc快捷键
map <silent> <leader>ss :source ~/.vimrc<cr>
" 设置快速编辑.vimrc快捷键
map <silent> <leader>ee :e ~/.vimrc<cr>
" 设置快速编辑.zshrc快捷键
map <silent> <leader>z :e ~/.zshrc<cr>
" 设置快速编辑.ycm_extra_conf.py快捷键
map <silent> <leader>y :e ~/.ycm_extra_conf.py<cr>

set path+=.,~/src/apue.3e/**
