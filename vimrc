syntax enable
set smartindent
set nu
syntax on
set tabstop=2
set shiftwidth=2
set expandtab
set foldmethod=syntax
set foldlevelstart=5

set laststatus=2
set statusline=[%n]\ %<%f%h%m

noremap <F4> :set hlsearch! hlsearch?<CR>

map <C-\> :NERDTreeToggle<CR>
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

map <C-S-f> :Ack!<Space>
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

call plug#begin()
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'SirVer/ultisnips'
Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
call plug#end()

set autowrite
set showcmd
autocmd Filetype go command! -bang Gv call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang Gh call go#alternate#Switch(<bang>0, 'split')

let mapleader = "g"
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>i  <Plug>(go-info)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nnoremap <leader>q :cclose<CR>
autocmd FileType go nnoremap <leader>Q :lclose<CR>
autocmd FileType go map <leader>n :cnext<CR>
autocmd FileType go map <leader>p :cprevious<CR>
autocmd FileType go map <leader>f :GoTestFunc<CR>
autocmd FileType go map <leader>T :Gh<CR>
autocmd FileType go map <leader>Tv :Gv<CR>
autocmd FileType go map <leader>I :GoImports<CR>
autocmd FileType go map <leader>9 :GoDecls<CR>
autocmd FileType go map <leader>R :GoRename<CR>

let g:go_auto_sameids = 1
let g:go_fmt_command = "goimports"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint', 'errcheck']
