call plug#begin(stdpath('data').'/plugged')

Plug 'junegunn/vim-plug'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'liuchengxu/vim-which-key'
Plug 'vim-airline/vim-airline'
Plug 'edkolev/tmuxline.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'christoomey/vim-tmux-runner'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'easymotion/vim-easymotion'
Plug 'zeek/vim-zeek'
Plug 'jiangmiao/auto-pairs'
Plug 'honza/vim-snippets'
Plug 'morhetz/gruvbox'
Plug 'ekalinin/Dockerfile.vim'
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-surround'

autocmd vimenter * ++nested colorscheme gruvbox

if has('nvim') || has('patch-8.0.902')
  Plug 'mhinz/vim-signify'
else
  Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
endif

call plug#end()

nnoremap <space>n :e ~/dotFiles/init_2021.vim<cr> 

set nu
set rnu
set ignorecase
set smartcase
" set autochdir
set sw=4
set hidden
set cmdheight=2

" 2 spaces filetypes
autocmd Filetype yaml setlocal sw=2
autocmd Filetype html setlocal sw=2
autocmd Filetype json setlocal sw=2

let g:mapleader = ","

imap <C-l> <Plug>(coc-snippets-expand)


nnoremap <space>e :CocCommand explorer<cr>
nnoremap <space>d :CocDiagnostics<cr>

" Disable tmux navigator when zooming the Vim pane
let g:tmux_navigator_disable_when_zoomed = 1

let g:airline#extensions#tabline#enabled = 1

nnoremap <c-n> :bnext<cr>
nnoremap <c-p> :bprev<cr>

nnoremap <c-q> :q<cr>
nnoremap <c-s> :w<cr>

nnoremap <space>vr :VtrSendLinesToRunner<cr>
vnoremap <space>vr :VtrSendLinesToRunner<cr>

" default updatetime 4000ms is not good for async update
set updatetime=100

nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

" Alt-j/k inserts blank line below/above
"+https://vim.fandom.com/wiki/Quickly_adding_and_deleting_empty_lines
nnoremap <silent><a-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><a-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>

" EasyMotion config
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

" add ; at end of line
nnoremap <a-;> A;<ESC>
xnoremap <a-;> <c-v>$A;<ESC>

nnoremap <space>c :CocCommand 
nnoremap <space>t :Tags<cr> 

" <space>r varies on filetype
" autocmd Filetype python nnoremap <space>r :CocCommand python.execInTerminal<cr>
autocmd Filetype python nnoremap <space>r :!/usr/bin/env python %<cr>

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" new line in insert mode
inoremap <c-a> <esc>o

" move cursor in insert mode
inoremap <c-f> <right>
inoremap <c-g> <s-right>

au BufEnter *.cpp set makeprg=g++\ -g\ %\ -o\ %< 
au BufEnter *.c set makeprg=gcc\ -g\ %\ -o\ %< 
" au BufEnter *.py set makeprg=python\ % 
" au BufEnter *.[rR] set makeprg=Rscript\ %
map <F5> :call CompileGcc()<CR>
func! CompileGcc()
    exec "w" 
    silent make
    exec "!%<"
endfunc
