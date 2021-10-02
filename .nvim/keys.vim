" ======
" ====== Basic key mappings
" ======
" disable the default s key.
nnoremap <space> <Nop>
noremap s <nop>
let mapleader=' '
let g:mapleader=' '
let g:maplocalleader=','
nnoremap <silent> <leader>      :<C-u>WhichKey ' '<CR>
nnoremap <silent> <localleader> :<C-u>WhichKey ','<CR>

noremap ; :
noremap n nzz
noremap N Nzz

" open the vimrc file anytime.
noremap <leader>fi :e $HOME/.config/nvim/vimrc.vim<CR>
noremap <leader>fk :e $HOME/.config/nvim/keys.vim<CR>
noremap <leader>fp :e $HOME/.config/nvim/plugins.vim<CR>
noremap <leader>fs :w<CR>
noremap <leader>fr :w<CR>:source %<CR>

nnoremap Y y$
vnoremap Y "+y

" indentation
nnoremap < <<
nnoremap > >>

" search
noremap <LEADER>sn :nohlsearch<CR>

" folding
noremap <silent> <LEADER>o za

" ======
" ====== Cursor movement
" ======
noremap W 5w
noremap B 5B

" ======
" ====== Window movement
" ======
nnoremap <LEADER>z :AnyJump<CR> " jump to definition under cursor.
xnoremap <LEADER>z :AnyJumpVisual<CR> " jump to selected text in visual mode.
nnoremap <LEADER>ab :AnyJumpBack<CR> " open previous opened file(after jump).
nnoremap <LEADER>al :AnyJumpLastResults<CR> open last closed search window again.

" ======
" ====== Tab movement
" ======

" create a new tab.
noremap tj :tabe<CR>
noremap tJ :tab split<CR>

" move around tabs
noremap tn :-tabnext<CR>
noremap tp :+tabnext<CR>

let g:which_key_map = {}
let g:which_key_map.f = {
    \ 'name': '+file',
    \ 's': 'save-file',
    \ 'r': 'reload-file',
    \ }

let g:which_key_map.w = {
    \ 'name': '+windows',
    \ '-': ['<C-w>s', 'split-window-below'],
    \ '|': ['<C-w>v', 'split-window-right'],
    \ 'd': ['<C-w>c', 'delete-window'],
    \ 'h': ['<C-w>h', 'window-left'],
    \ 'j': ['<C-w>j', 'window-below'],
    \ 'k': ['<C-w>k', 'window-up'],
    \ 'l': ['<C-w>l', 'window-right'],
    \ 'o': ['<C-w>w', 'other-window'],
    \ 'z': ['<C-w>m', 'window-zoom']
    \ }

" to register the descriptions when using the on-demandcload feature.
autocmd! User vim-which-key call which_key#register(' ', 'g:which_key_map')

