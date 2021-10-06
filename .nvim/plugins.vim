" ===
" === Install plugins
" ===
call plug#begin('$HOME/.config/nvim/plugged')

" haven't try
" Plug 'majutsushi/tagbar'
" Plug 'dhruvasagar/vim-table-mode'
" Plug 'dkarter/bullets.vim'
" Plug 'jceb/vim-orgmode'

" themes
Plug 'connorholyday/vim-snazzy'
Plug 'davidklsn/vim-sialoquent'
Plug 'phanviet/vim-monokai-pro'
Plug 'morhetz/gruvbox'

" behaviors
Plug 'ojroques/vim-scrollstatus'
Plug 'kien/rainbow_parentheses.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' } " displays the colours in the file async.
Plug 'RRethy/vim-illuminate' " highlights other uses of the current words under the cursor automatically.
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
Plug 'dhruvasagar/vim-zoom'
Plug 'voldikss/vim-floaterm'
Plug 'junegunn/vim-easy-align'

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
Plug 'jiangmiao/auto-pairs'

" markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'mzlogin/vim-markdown-toc'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" golang
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries', 'tag': '*' }
Plug 'dgryski/vim-godef'

" bookmark
" Plug 'MattesGroeger/vim-bookmarks'

call plug#end()

" git
let g:gitgutter_sign_modified = '•'
let g:gitgutter_sign_added    = '❖'
highlight GitGutterAdd guifg  = '#A3E28B'

let g:lazygit_floating_window_winblend       = 0 " transparency of floating window
let g:lazygit_floating_window_scaling_factor = 1.0 " scaling factor for floating window
let g:lazygit_floating_window_corner_chars   = ['╭', '╮', '╰', '╯'] " customize lazygit popup window corner characters
let g:lazygit_use_neovim_remote              = 1 " for neovim-remote support

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
let g:vmt_auto_update_on_save     = 0
let g:vmt_cycle_list_item_markers = 1
let g:vmt_fence_text              = 'TOC'
let g:vmt_fence_closing_text      = '/TOC'

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" golang
let g:go_fmt_command                         = "goimports"
let g:go_autodetect_gopath                   = 1
let g:go_list_type                           = "quickfix"
let g:go_template_autocreate                 = 0 " disable auto fills the buffer content when a new file is created.
let g:go_textobj_enabled                     = 0 " disable adds custom text objects.
let g:go_auto_type_info                      = 1 " show the type info for the word under the cursor automatically.
let g:go_version_warning                     = 1
let g:go_highlight_types                     = 1
let g:go_highlight_fields                    = 1
let g:go_highlight_functions                 = 1
let g:go_highlight_function_calls            = 1
let g:go_highlight_function_parameters       = 1
let g:go_highlight_operators                 = 1
let g:go_highlight_extra_types               = 1
let g:go_highlight_methods                   = 1
let g:go_highlight_generate_tags             = 1
let g:go_highlight_space_tab_error           = 1 " highlight instances of tabs following spaces.
let g:go_highlight_structs                   = 1
let g:go_highlight_string_spellcheck         = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_variable_assignments      = 0 " disable highlight variable names in variable assignments.
let g:go_highlight_variable_declarations     = 0 " disable highlight variable names in variable declarations.
let g:go_highlight_format_strings            = 1 " highlight printf-style formatting verbs inside string literals.
let g:go_highlight_array_whitespace_error    = 1 " highlight white space after [].
let g:go_highlight_build_constraints         = 1 " highlight build constraints.
let g:go_echo_go_info                        = 0 " disable show the identifier information when code completion is done.
let g:go_doc_popup_window                    = 1 " use the popup-window for GoDoc, rather than the preview-window.
let g:go_def_mapping_enabled                 = 0 " disable the default mapping of C-] and (gd) for GoDef.
let g:go_doc_keywordprg_enabled              = 0 " disable run godoc on words under the cursor with K.

let g:godef_split = 2

