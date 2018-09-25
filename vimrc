filetype plugin indent on
syntax enable
set smartindent
set nu
syntax on
set tabstop=2
set shiftwidth=2
set expandtab
set foldmethod=syntax
set foldlevelstart=5
set ruler
set laststatus=2

noremap <F4> :set hlsearch! hlsearch?<CR>

map <C-\> :NERDTreeToggle<CR>
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

map <C-S-f> :Ack!<Space>
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

noremap <A-4> :ccl<CR>
noremap <C-n> :tabnew<CR>
noremap <C-l> :tabNext<CR>
noremap <C-h> :tabp<CR>
noremap <C-k> :tabclose<CR>

let mapleader = ";"
noremap <Leader>1 :copen<CR>
noremap <Leader>2 :ccl<CR>
noremap <Leader>3 :cnext<CR>
noremap <Leader>4 :cprev<CR>
nmap ,cl :let @+=expand("%:p")<CR>

call plug#begin()
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'SirVer/ultisnips'
Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
Plug 'fatih/molokai'
Plug 'guns/vim-sexp'
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'https://github.com/tpope/vim-fugitive'
call plug#end()

set autowrite
set showcmd
autocmd Filetype go command! -bang Gt call go#alternate#Switch(<bang>0, 'tabnew')

let mapleader = "g"
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>i  <Plug>(go-info)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nnoremap <leader>q :cclose<CR>
autocmd FileType go nnoremap <leader>Q :lclose<CR>
autocmd FileType go map <leader>f :GoTestFunc<CR>
autocmd FileType go map <leader>T :Gt<CR>
autocmd FileType go map <leader>I :GoImports<CR>
autocmd FileType go map <leader>9 :GoDecls<CR>
autocmd FileType go map <leader>R :GoRename<CR>


let g:go_auto_sameids = 0
let g:go_fmt_command = "goimports"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
let g:go_metalinter_enabled = ['vet', 'errcheck']
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet', 'errcheck']
let g:go_list_type = "quickfix"

let g:rehash256 = 1
let g:molokai_original = 1
colorscheme molokai

autocmd BufWritePre * %s/\s\+$//e

if has("clipboard")
  set clipboard=unnamed " copy to the system clipboard

  if has("unnamedplus") " X11 support
    set clipboard+=unnamedplus
  endif
endif

if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif
