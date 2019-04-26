call plug#begin('~/.config/nvim/plugged')
Plug 'stamblerre/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}
Plug 'neomake/neomake'
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'Shougo/denite.nvim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'tpope/vim-markdown'
Plug 'scrooloose/nerdcommenter'
Plug 'majutsushi/tagbar'
Plug 'tacahiroy/ctrlp-funky'

call plug#end()

call neomake#configure#automake('w')
call neomake#configure#automake('nw', 750)
call neomake#configure#automake('rw', 1000)
call neomake#configure#automake('nrwi', 500)

let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#go#gocode_binary = '~/.gotools/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']

let g:go_bin_path = expand("~/.gotools")
let g:go_fmt_command = "goimports"

map <C-e> :NERDTreeToggle<CR>

" deoplete
imap <expr> <tab>   pumvisible() ? "\<c-n>" : "\<tab>"
imap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<tab>"
imap <expr> <cr>    pumvisible() ? deoplete#close_popup() : "\<cr>"

set clipboard=unnamed    " On mac and Windows, use * register for copy-paste
set shiftwidth=8
set nu
set relativenumber
set statusline=%f
set nobackup
set noswapfile
set autoread
set autowrite
set confirm

let mapleader = ","
let maplocalleader = ";"

nnoremap <leader>v :execute "rightbelow split" . bufname("#")<cr>
inoremap jk <esc>
inoremap <c-u> viwgU
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
nnoremap aa ^
onoremap p i(

nnoremap <silent> <leader>tt :TagbarToggle<CR>

nnoremap <leader>fu :CtrlPFunky<Cr>
nnoremap <leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

nnoremap <silent> <leader>gr :Gread<CR>

augroup filetype_vim
   autocmd!
    autocmd FileType vim set foldmethod=marker
augroup END

autocmd FileType javascript nnoremap <buffer> <localleader>c I"<esc>

iabbrev fucn func
iabbrev waht what
iabbrev tehn then
iabbrev diff difference
iabbrev dict //********dict: word data:

au FileType go nmap <leader>r <Plug>(go-run)

