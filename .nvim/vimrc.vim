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
set wildignorecase
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
set ttimeoutlen=50 " time in milliseconds to wait for a key code sequence to complete.
set timeoutlen=500 " time in milliseconds to wait for a mapped sequence to complete.
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
set nobackup
set nowritebackup

" always show the signcolumn, otherwise it would shift the text
" each time, diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " recently vim can merge signcolumn and number column into one.
  set signcolumn=number
else
  set signcolumn=yes
endif

" ===
" === Other stuff
" ===

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2

set re=0 " regexpengine.
set laststatus=2 " this value of this option influences when the last window will have a status line, value `2` is always.

" give more space for displaying messages.
set cmdheight=1
" don't pass messages to |ins-completion-menu|
set shortmess+=c

" let block cursor everywhere
set guicursor=n-v-c-sm:block
