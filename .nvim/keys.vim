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

" coc mappings
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" floaterm mappings
nnoremap <silent> <leader>tx :FloatermNew<CR>
tnoremap <silent> <leader>tx <C-\><C-n>:FloatermNew<CR>
nnoremap <silent> <leader>tp :FloatermPrev<CR>
tnoremap <silent> <leader>tp <C-\><C-n>:FloatermPrev<CR>
nnoremap <silent> <leader>tn :FloatermNext<CR>
tnoremap <silent> <leader>tn <C-\><C-n>:FloatermNext<CR>
nnoremap <silent> <leader>tt :FloatermToggle<CR>
tnoremap <silent> <leader>tt <C-\><C-n>:FloatermToggle<CR>
nnoremap <silent> <leader>tf :FloatermNew fzf<CR>
nnoremap <silent> <leader>tg :FloatermNew tig<CR>
nnoremap <silent> <leader>tl :CocList floaterm<CR>
nnoremap <silent> <leader>tr :FloatermNew ranger<CR>

let g:which_key_map = {}
let g:which_key_map.f = {
    \ 'name': '+file',
    \ 'i': 'vimrc.vim',
    \ 'k': 'keys.vim',
    \ 'p': 'plugins.vim',
    \ 's': 'save-file',
    \ 'r': 'reload-file'
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

let g:which_key_map.g = {
    \ 'name': '+goto',
    \ 'd': ['<Plug>(coc-definition)', 'goto-definition'],
    \ 'i': ['<Plug>(coc-implementation)', 'goto-implementation'],
    \ 'r': ['<Plug>(coc-references)', 'goto-references']
    \ }

let g:which_key_map.t = {
    \ 'name': '+term',
    \ 'x': 'new-term',
    \ 't': 'toggle-term',
    \ 'p': 'prev-term',
    \ 'n': 'next-term',
    \ 'f': 'fzf',
    \ 'g': 'git',
    \ 'l': 'list-term',
    \ 'r': 'ranger'
    \ }

" to register the descriptions when using the on-demandcload feature.
autocmd! User vim-which-key call which_key#register(' ', 'g:which_key_map')

