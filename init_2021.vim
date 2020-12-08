call plug#begin(stdpath('data').'/plugged')

Plug 'junegunn/vim-plug'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'liuchengxu/vim-which-key'
Plug 'vim-airline/vim-airline'
Plug 'edkolev/tmuxline.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'christoomey/vim-tmux-runner'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

if has('nvim') || has('patch-8.0.902')
  Plug 'mhinz/vim-signify'
else
  Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
endif

call plug#end()

set nu
set rnu

imap <C-l> <Plug>(coc-snippets-expand)


nnoremap <space>e :CocCommand explorer<cr>

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
