call plug#begin('~/.config/nvim/plugged')
Plug 'stamblerre/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}
Plug 'stamblerre/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
"Plug 'neomake/neomake'
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
Plug 'bling/vim-bufferline'
Plug 'ianva/vim-youdao-translater'
Plug 'AndrewRadev/splitjoin.vim' "gJ命令切片多行合并成一行，或gS命令一行拆分成多行插件
Plug 'SirVer/ultisnips'

call plug#end()

"call neomake#configure#automake('w')
"call neomake#configure#automake('nw', 750)
"call neomake#configure#automake('rw', 1000)
"call neomake#configure#automake('nrwi', 500)

let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#go#gocode_binary = '~/.gotools/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']

let g:go_bin_path = expand("~/.gotools")

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
set completeopt-=preview "关闭gocode自动新建窗口功能

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



nnoremap <leader>nt :split ~/.cloud/temp.md<cr>

" 搜索文件下方法
nnoremap <leader>fu :CtrlPFunky<Cr>
nnoremap <leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

nnoremap <silent> <leader>gr :Gread<CR>

augroup filetype_vim
   autocmd!
    autocmd FileType vim set foldmethod=marker
augroup END

" 根据文件类型自动处理
autocmd FileType javascript nnoremap <buffer> <localleader>c I"<esc>
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <leader>m  <Plug>(go-imports) " 导入包
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle) "显示测试代码覆盖率，再按一次，取消显示测试覆盖率


" 纠正或者缩写
iabbrev fucn func
iabbrev waht what
iabbrev tehn then
iabbrev diff difference
iabbrev dict //********dict: word data:
iabbrev logg log "github.com/sirupsen/logrus"

" ctrlsf配置
nmap     <C-F>f <Plug>CtrlSFPrompt
vmap     <C-F>f <Plug>CtrlSFVwordPath
vmap     <C-F>F <Plug>CtrlSFVwordExec
nmap     <C-F>n <Plug>CtrlSFCwordPath
nmap     <C-F>p <Plug>CtrlSFPwordPath
nnoremap <C-F>o :CtrlSFOpen<CR>
nnoremap <C-F>t :CtrlSFToggle<CR>
inoremap <C-F>t <Esc>:CtrlSFToggle<CR>
let g:ctrlsf_auto_focus = {
    \ "at": "done",
    \ "duration_less_than": 1000
    \ }

nnoremap <leader>yd  :<C-u>Ydc<CR><CR>  " 词典

map <C-n> :cnext<CR> " 跳转到下一个错误
map <C-m> :cprevious<CR> " 跳转到上一个错误
nnoremap <leader>a :cclose<CR> " 关闭错误提示窗口
let g:go_list_type = "quickfix"


" run :GoBuild or :GoTestCompile based on the go file,根据文件名，执行:Gobuild或者:GoTestCompile
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

" 代码排版和自动导入包
let g:go_fmt_command = "goimports"

" 代码检测
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_metalinter_deadline = "5s"

" xxx.go与xxx_test.go之间切换
autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

let g:go_def_mode = 'godef' "跳转到定义的地方，比guru速度要快
let g:go_decls_includes = "func,type" "ctrlp插件设置搜索的类型
"let g:go_auto_type_info = 1 " 开启自动GoInfo, 显示函数声明
"set updatetime=100 " 设置GoInfo显示的延迟时间
autocmd FileType go nmap <Leader>i <Plug>(go-info) "显示函数声明
let g:go_auto_sameids = 1 "自动高亮当前位置的单词
autocmd FileType go nmap <Leader>gr <Plug>(go-referrers) " 函数被调用列表
