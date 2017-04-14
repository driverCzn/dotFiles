set nocompatible               " be iMproved
filetype off                   " required!

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
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
Plugin 'scrooloose/syntastic'  " works fine with python virtualenv
Plugin 'luochen1990/rainbow'
"Plugin 'vim-scripts/awk.vim'
"Plugin 'tpope/vim-markdown'
"Plugin 'vim-scripts/bash-support.vim'
"Plugin 'suan/vim-instant-markdown'
"Plugin 'octol/vim-cpp-enhanced-highlight'
"Plugin 'vim-scripts/fcitx.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'nvie/vim-flake8'
Plugin 'fs111/pydoc.vim'
Plugin 'klen/python-mode'
Plugin 'rking/ag.vim'
"Plugin 'Yggdroot/indentLine' "此插件无法处理太多列，会导致卡顿，可关闭
"Plugin 'ternjs/tern_for_vim'
"Plugin 'pangloss/vim-javascript'
Plugin 'tommcdo/vim-exchange'

call vundle#end()            " required
filetype plugin indent on     " required!

set nu
syntax enable
set background=dark
set clipboard=unnamed
" Show whitespace
" Must be inserted BEFORE the colorscheme
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
" Auto change work directory
"autocmd BufEnter * if expand("%:p:h") !~ '^/tmp' | silent! lcd %:p:h | endif
"au InsertLeave * match ExtraWhitespace /\s\+$/

colorscheme solarized
if has('gui_running')
    set background=light
else
    set background=dark
endif

let g:solarized_bold=1
let g:solarized_underline=1
let g:solarized_italic=1
let g:solarized_termcolors=256
let g:airline_theme='hybridline'
let g:airline_powerline_fonts=1
let g:tagbar_ctags_bin='/usr/bin/ctags'
let g:indentLine_char = '┊'
let g:indentLine_enabled = 1
let g:indentLine_fileType = [] " denotes that all file types are supported
let python_highlight_all=1
" for conflict between pymode's complete_on_dot and ycm's prompt
let g:pymode_rope_complete_on_dot = 0
let g:pymode_python = "python"
" pymod's breakpoint
let g:pymode_breakpoint = 1
" let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']
let asmsyntax="nasm"

autocmd FileType javascript nnoremap <leader>d :TernDef<CR>
autocmd FileType javascript setlocal omnifunc=tern#Complete

autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd BufNewFile *.py 0r ~/.python_header
autocmd BufNewFile *.py normal G

let g:pymod_repo_extended_complete = 1
let g:pymod_syntax = 1
let g:ctrlp_max_height=30
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1

"将leader设为逗号
let mapleader = ","
let g:mapleader = ","
"YouCompleteMe 功能
" 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
let g:ycm_confirm_extra_conf=1
let g:ycm_complete_in_comments=1
let g:ycm_complete_in_strings=1
" 开启 YCM 基于标签引擎
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
" 从第一个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=2
" 语法关键字补全
let g:ycm_seed_identifiers_with_syntax=1
"标准库tags，这个没有也没关系，只要.ycm_extra_conf.py文件中指定了正确的标准库路径
set tags+=/data/misc/software/misc./vim/stdcpp.tags
"让ycm使用ultisnips插件
let g:ycm_use_ultisnips_completer = 1
let g:UltiSnipsExpandTrigger = "<tab>"
let g:ycm_key_list_select_completion = ['<c-n>', '<c-j>']
let g:ycm_key_list_previous_completion = ['<c-p>', '<c-k>']
let g:UltiSnipsSnippetDirectories = ["bundle/vim-snippets/UltiSnips"]
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_show_diagnostics_ui = 1
let g:ycm_autoclose_preview_window_after_completion = 0
let g:ycm_server_python_interpreter = "/usr/bin/python2"
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_key_invoke_completion = '<C-Space>'
let g:ycm_cache_omnifunc = 1
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>*'
let g:ycm_disable_for_files_larger_than_kb = 1000
let g:ycm_server_use_vim_stdout = 0
let g:ycm_server_keep_logfiles = 1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.'],
  \   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
  \             're!\[.*\]\s'],
  \   'ocaml' : ['.', '#'],
  \   'cpp,objcpp' : ['->', '.', '::'],
  \   'perl' : ['->'],
  \   'php' : ['->', '::'],
  \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
  \   'ruby' : ['.', '::'],
  \   'lua' : ['.', ':'],
  \   'erlang' : [':'],
  \ }

"""""""""syntastic""""""""""
let g:syntastic_check_on_open=1
let g:syntastic_enable_highlighting = 1
let g:syntastic_error_symbol = '✗'  "set error or warning signs
let g:syntastic_warning_symbol = '⚠'
"let g:syntastic_python_checker="flake8"
"let g:syntastic_python_checker="flake8,pyflakes,pep8,pylint"
"let g:syntastic_python_checkers=['pyflakes']
highlight SyntasticErrorSign guifg=white guibg=black

let g:syntastic_cpp_include_dirs = ['/usr/include/c++/6.2.1']
let g:syntastic_cpp_remove_include_errors = 0
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libstdc++'
let g:syntastic_enable_balloons = 1 "whether to show balloons

autocmd InsertLeave * if pumvisible() == 0|pclose|endif "离开插入模式后自动关闭预览窗口
" Expand snippet or return
let g:ulti_expand_res = 1

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
hi Normal ctermfg=252 ctermbg=none
set so=3                       " Set 3 lines to the cursor - when moving vertically using j/k
set autoread                   " Set to auto read when a file is changed from the outside
set nu
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
set showmode
set magic                      " For regular expressions turn magic on
set smarttab                   " Be smart when using tabs ;)
set laststatus=2
set completeopt=longest,menu
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
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

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
nnoremap <tab> %
vnoremap <tab> %

" NERDTree
map <F3> :NERDTreeToggle<CR>
imap <F3> <ESC>:NERDTreeToggle<CR>

" emmet
map! <C-O> <C-Y>,

" Tagbar
nmap <F9> :TagbarToggle<CR>

" Fast saving && quitting
nmap <leader><leader>w :w!<cr>
nmap <leader>q :q!<cr>
nmap <leader>x :x!<cr>
nmap <leader>o :only<cr>

" Easy moving between tabs
map <leader>n <esc>:tabprevious<cr>
map <leader>m <esc>:tabnext<cr>

nmap <leader>f :YcmCompleter FixIt<cr>
" Easier moving of code blocks
vnoremap < <gv
vnoremap > >gv

" Vim-repeat 配置
silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)

"C，C++ 按F5编译运行
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!gcc -m32 % -o %< -std=c99"
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
endfunc"
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
endfunction
inoremap <tab> <c-r>=MyTabFunction()<cr>

"function! g:UltiSnips_Complete()
    "call UltiSnips#ExpandSnippet()
    "if g:ulti_expand_res == 0
        "if pumvisible()
            "return "\<C-n>"
        "else
            "call UltiSnips#JumpForwards()
            "if g:ulti_jump_forwards_res == 0
               "return "\<TAB>"
            "endif
        "endif
    "endif
    "return ""
"endfunction

" Enter to expand snippet
"function! Ulti_ExpandOrEnter()
    "call UltiSnips#ExpandSnippet()
    "if g:ulti_expand_res
        "return ''
    "else
        "return "\<return>"
"endfunction
"inoremap <return> <C-R>=Ulti_ExpandOrEnter()<CR>

" 设置快速编辑.vimrc快捷键
map <silent> <leader>ee :e ~/.vimrc<cr>
" 设置快速编辑.zshrc快捷键
map <silent> <leader>z :e ~/.zshrc<cr>
" 设置快速编辑.ycm_extra_conf.py快捷键
map <silent> <leader>y :e ~/.ycm_extra_conf.py<cr>

set path+=.,~/apue.3e/**,~/hexo_blog/source/_posts,/usr/include/c++/6.2.1/

"python with virtualenv support
"py << EOF
"import os
"import sys
"if 'VIRTUAL_ENV' in os.environ:
  "project_base_dir = os.environ['VIRTUAL_ENV']
  "activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  "execfile(activate_this, dict(__file__=activate_this))
"EOF
