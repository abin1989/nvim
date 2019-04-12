set shiftwidth=4
set nu
set relativenumber
set statusline=%f

let mapleader = ","
let maplocalleader = ";"

inoremap <c-u> viwgU
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
nnoremap aa ^
onoremap p i(

augroup filetype_vim
   autocmd!
    autocmd FileType vim set foldmethod=marker
augroup END

autocmd FileType javascript nnoremap <buffer> <localleader>c I"<esc>

iabbrev fucn func
iabbrev waht what
iabbrev tehn then
iabbrev diff difference





