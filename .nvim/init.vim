" ===
" === Autoload
" ===

if empty(glob($HOME.'/.nvim/autoload/plug.vim'))
  silent !curl -fLo $HOME/.nvim/autoload/plug.vim --create-dirs
            \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" set line number.
set mouse=a
set nu
" be improved
filetype on
filetype plugin indent on

" ======
" ====== Editor behavior
" ======

set cursorline
set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase
set showcmd " show command in the last line of the screen.
set linespace=4 " number of pixel lines inserted between characters.
set termguicolors
set hidden " a buffer becomes hidden when it is abandoned.

set autochdir

set shiftwidth=4
set tabstop=4 " numbers of spaces that a <Tab> in the file counts for.
set softtabstop=4 " numbers of spaces that a <Tab> counts for while performing eidting operation.
set expandtab " use the appropriate number of spaces to insert a <Tab>.
set wildmenu " command-line completion operates in an enhanced mode.
set wrap
set autoindent
set list " show tabs as CTRL-I is displayed, display $ after end of line.
set listchars=tab:\|\ ,trail:▫
set scrolloff=5
set ttimeoutlen=0 " time in milliseconds to wait for a key code sequence to complete.
set notimeout " determine the behavior when part of a mapped key sequence has been received.
set viewoptions=cursor,folds,slash,unix " changes the effect of :mkview command.
set tw=0 " maximum width of text that is being inserted, a longer line will be broken after white space to get this width.
set indentexpr= " expression which is evaluted to obtain the proper indent for a line.
set foldmethod=indent
set foldlevel=99
set foldenable
set formatoptions-=tc " this is a sequence of letters which describes how automatic formatting is to be done.
set splitright
set splitbelow
set noshowmode " if in insert, replace or visual mode put a message on the last line when showmode.
set shortmess+=c " avoid the hit-enter prompts caused by file messages(don't give `ins-completion-menu` messages)
set inccommand=split " shows partial off-screen results in a preview window.
set completeopt=longest,noinsert,menuone,noselect,preview " for insert mode completion.
set lazyredraw " the screen will not be redrawn while executin macros, registers and other command that have not been typed.

set colorcolumn=120
set updatetime=1000 " if this many millseconds nothing is typed the swap file will be written to disk.
set virtualedit=block " the cursor can be positioned where there is no actual character.
set clipboard+=unnamedplus

" ===
" === Other stuff
" ===

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" ======
" ====== Basic key mappings
" ======

let mapleader="\<space>"
nnoremap <LEADER>rc :source % <CR>
noremap ; :
noremap n nzz
noremap N Nzz

" save and quit.
noremap S :w<CR>
noremap Q :q<CR>

" open the vimrc file anytime.
noremap <LEADER>re :e $HOME/.nvim/init.vim<CR>

nnoremap Y y$
vnoremap Y "+y

" indentation
nnoremap < <<
nnoremap > >>

" search
noremap <LEADER><CR> :nohlsearch<CR>

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
noremap <LEADER>w <C-w>w
noremap <LEADER>h <C-w>h
noremap <LEADER>j <C-w>j
noremap <LEADER>k <C-w>k
noremap <LEADER>l <C-w>l
noremap <LEADER>q <C-w>j:q<CR> " close the window below the current window.
nnoremap <LEADER>z :AnyJump<CR> " jump to definition under cursor.
xnoremap <LEADER>z :AnyJumpVisual<CR> " jump to selected text in visual mode.
nnoremap <LEADER>ab :AnyJumpBack<CR> " open previous opened file(after jump).
nnoremap <LEADER>al :AnyJumpLastResults<CR> open last closed search window again.

noremap sk :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap sj :set splitbelow<CR>:split<CR>
noremap sh :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap sl :set splitright<CR>:vsplit<CR>

" ======
" ====== Tab movement
" ======

" create a new tab.
noremap tj :tabe<CR>
noremap tJ :tab split<CR>

" move around tabs
noremap tn :-tabnext<CR>
noremap tp :+tabnext<CR>

noremap s <nop> " disable the default s key.

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2

" ===
" === Install plugins
" ===
set rtp+=$HOME/.nvim
call plug#begin('$HOME/.nvim/plugged')

" themes
Plug 'connorholyday/vim-snazzy'
Plug 'davidklsn/vim-sialoquent'
Plug 'phanviet/vim-monokai-pro'

" behaviors
Plug 'ojroques/vim-scrollstatus'
Plug 'itchyny/lightline.vim'
Plug 'kien/rainbow_parentheses.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' } " displays the colours in the file async.
Plug 'RRethy/vim-illuminate' " highlights other uses of the current words under the cursor automatically.

" file navigation
Plug 'pechorin/any-jump.vim'
Plug 'psliwka/vim-smoothie'

" git
Plug 'tpope/vim-fugitive' " git plugin.
Plug 'airblade/vim-gitgutter' " shows a git diff in the sign column.

call plug#end()

set re=0 " regexpengine.
let g:gitgutter_sign_modified = '•'
let g:gitgutter_sign_added = '❖'
highlight GitGutterAdd guifg = '#A3E28B'

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

" colorschemes
colorscheme snazzy
" colorscheme monokai_pro
" colorscheme sialoquent
set laststatus=2 " this value of this option influences when the last window will have a status line, value `2` is always.

" rainbow configs.
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
" au VimEnter * RainbowParenthesesToggle
" au Syntax * RainbowParenthesesLoadRound
" au Syntax * RainbowParenthesesLoadSquare
" au Syntax * RainbowParenthesesLoadBraces

