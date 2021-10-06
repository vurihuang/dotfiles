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
noremap <leader>fr :w<CR>:source $MYVIMRC<CR>

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

nnoremap <LEADER>1 1gt
nnoremap <LEADER>2 2gt
nnoremap <LEADER>3 3gt
nnoremap <LEADER>4 4gt
nnoremap <LEADER>5 5gt
nnoremap <LEADER>0 :tablast<CR>

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

nnoremap <LEADER>gd <Plug>(coc-definition)
nnoremap <LEADER>gi <Plug>(coc-implementation)
nnoremap <LEADER>gr <Plug>(coc-references)

" golang
autocmd FileType go nnoremap <BUFFER> <LEADER>lr <Plug>(go-run)
autocmd FileType go nnoremap <BUFFER> <LEADER>ld :GoDef<CR>

" floaterm
nnoremap <silent> <leader>ix :FloatermNew --width=0.9 --height=0.8<CR>
tnoremap <silent> <leader>ix <C-\><C-n>:FloatermNew<CR>
nnoremap <silent> <leader>ip :FloatermPrev<CR>
tnoremap <silent> <leader>ip <C-\><C-n>:FloatermPrev<CR>
nnoremap <silent> <leader>in :FloatermNext<CR>
tnoremap <silent> <leader>in <C-\><C-n>:FloatermNext<CR>
nnoremap <silent> <leader>it :FloatermToggle<CR>
tnoremap <silent> <leader>it <C-\><C-n>:FloatermToggle<CR>
nnoremap <silent> <leader>if :FloatermNew --width=0.9 --height=0.8 fzf<CR>
nnoremap <silent> <leader>ig :FloatermNew --width=0.9 --height=0.9 lazygit<CR>
nnoremap <silent> <leader>il :CocList floaterm<CR>
nnoremap <silent> <leader>ir :FloatermNew --width=0.9 --height=0.8 ranger<CR>

" markdown
nnoremap <leader>mt :RemoveToc<CR>:GenTocMarked<CR>:call ShortTierToc()<CR>
nnoremap <LEADER>mu :UpdateToc<CR>
nnoremap <LEADER>mp :MarkdownPreview<CR>

" easy align
" around all operators with =
xnoremap <leader>aa :EasyAlign*=<CR>
nnoremap <leader>aa :EasyAlign*=<CR>
" markdown table align left
xnoremap <leader>at :EasyAlign*\|<CR>
nnoremap <leader>at :EasyAlign*\|<CR>
" around 1st colon
xnoremap <leader>ac :EasyAlign:<CR>
nnoremap <leader>ac :EasyAlign:<CR>
" easy-align notes
" :EasyAlign\    around 1st whitespaces
" :EasyAlign2\   around 2nd whitespaces
" :EasyAlign-\   around the last whitespaces
" :EasyAlign-2\  around the 2nd to last whitespaces
" :EasyAlign:    around 1st colon(key: value)
" :EasyAlign:>l1 around 1st colon(key : value)
" :EasyAlign=    around 1st operators with =
" :EasyAlign3=   around 3rd operators with =
" :EasyAlign*=   around all operators with =
" :EasyAlign**=  left-right alternating around =
" :EasyAlign!=   right alignment around 1st =
" :EasyAlign!**= right-left alternating around =

let g:which_key_map = {
    \ '1': 'tab 1',
    \ '2': 'tab 2',
    \ '3': 'tab 3',
    \ '4': 'tab 4',
    \ '5': 'tab 5',
    \ '0': 'tab last'
    \ }
let g:which_key_map.f = {
    \ 'name': '+file',
    \ 'i': 'vimrc.vim',
    \ 'k': 'keys.vim',
    \ 'p': 'plugins.vim',
    \ 's': 'save-file',
    \ 'r': 'reload-file',
    \ 'l': ['Files', 'files'],
    \ 'g': ['GFiles', 'git-files']
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
    \ 'z': ['<C-w>m', 'window-zoom'],
    \ 'q': ['quit', 'quit']
    \ }

let g:which_key_map.g = {
    \ 'name': '+goto',
    \ 'd': ['<Plug>(coc-definition)', 'goto-definition'],
    \ 'i': ['<Plug>(coc-implementation)', 'goto-implementation'],
    \ 'r': ['<Plug>(coc-references)', 'goto-references']
    \ }

let g:which_key_map.l = {
    \ 'name': '+lsp',
    \ 'd': 'definition',
    \ 'r': 'run'
    \ }

let g:which_key_map.i = {
    \ 'name': '+term',
    \ 'x': 'new-term',
    \ 't': 'toggle-term',
    \ 'p': 'prev-term',
    \ 'n': 'next-term',
    \ 'f': 'fzf',
    \ 'g': 'git',
    \ 'l': 'terms',
    \ 'r': 'ranger'
    \ }

let g:which_key_map.t = {
    \ 'name': '+tabs',
    \ 'p': ['tabprevious', 'prev-tab'],
    \ 'n': ['tabnext', 'next-tab'],
    \ }

let g:which_key_map.b = {
    \ 'name': '+buffers',
    \ 'l': ['Buffers', 'buffers'],
    \ 's': ['BufstopPreview', 'switch-buffer'],
    \ 'p': ['bp', 'prev-buffer'],
    \ 'n': ['bn', 'next-buffer'],
    \ 'd': ['bd', 'delete-buffer']
    \ }

let g:which_key_map.m = {
    \ 'name': '+markdown',
    \ 't': 'generate-toc',
    \ 'u': 'update-toc',
    \ 'p': 'markdown-preview'
    \ }

let g:which_key_map.a = {
    \ 'name': '+a',
    \ 'a': 'equal-align',
    \ 't': 'table-align',
    \ 'c': 'colon-align'
    \}

" to register the descriptions when using the on-demandcload feature.
autocmd! User vim-which-key call which_key#register(' ', 'g:which_key_map')

function ShortTierToc()
    exe "/-toc .* -->"
    let lstart=line('.')
    exe "/-toc -->"
    let lnum=line('.')
    execute lstart.",".lnum."g/           /d"
endfunction

