" ===
" === Install plugins
" ===
call plug#begin('$HOME/.config/nvim/plugged')

" themes
Plug 'connorholyday/vim-snazzy'
Plug 'davidklsn/vim-sialoquent'
Plug 'phanviet/vim-monokai-pro'
Plug 'morhetz/gruvbox'

" behaviors
Plug 'ojroques/vim-scrollstatus'
Plug 'itchyny/lightline.vim'
Plug 'kien/rainbow_parentheses.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' } " displays the colours in the file async.
Plug 'RRethy/vim-illuminate' " highlights other uses of the current words under the cursor automatically.
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
Plug 'dhruvasagar/vim-zoom'
Plug 'voldikss/vim-floaterm'

" file navigation
Plug 'pechorin/any-jump.vim'
Plug 'psliwka/vim-smoothie'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mihaifm/bufstop'

" git
Plug 'tpope/vim-fugitive' " git plugin.
Plug 'airblade/vim-gitgutter' " shows a git diff in the sign column.

" completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'mzlogin/vim-markdown-toc'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
" Plug 'majutsushi/tagbar'

call plug#end()

" git
let g:gitgutter_sign_modified = '•'
let g:gitgutter_sign_added = '❖'
highlight GitGutterAdd guifg = '#A3E28B'

" lightline
let g:lightline = {
  \ 'active': {
  \   'left': [
  \             [ 'mode', 'paste' ],
  \             [ 'fugitive', 'readonly', 'filename', 'modified' ]
  \           ],
  \   'right': [
  \              ['lineinfo'],
  \              ['percent'],
  \              ['fileformat', 'fileencoding', 'filetype', 'charvaluehex']
  \            ]
  \ },
  \ 'component': {
  \   'readonly': '%{&filetype=="help"?"":&readonly?"⭤":""}',
  \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
  \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
  \ },
  \ 'component_visible_condition': {
  \   'readonly': '(&filetype!="help"&& &readonly)',
  \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
  \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
  \ },
  \ 'component_function': { 'percent': 'ScrollStatus' },
  \ 'separator': { 'left': '', 'right': '' },
  \ 'subseparator': { 'left': '∿', 'right': '❂' }
  \ }

" rainbow parentheses
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" coc
" highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

augroup CocGroup
  autocmd!
  " setup formatexpr specified filetypes.
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" floaterm

" bufstop
let g:BufstopSorting = "none"

" markdown
let g:vmt_auto_update_on_save = 0
