func! upeoe#before() abort
  let g:vimfiler_direction = "topleft"
  let g:tagbar_left = 0
  let g:Tlist_Ctags_Cmd = "/usr/local/bin/ctags"
endf

func! upeoe#after() abort
  set norelativenumber
  set number
  set colorcolumn=120
  set clipboard=unnamed
  set guicursor=n-v-c:block-blinkon0,i-ci-ve:block-blinkon10,r-cr:hor20,o:hor50

  let g:indentLine_setConceal = 0

  set nocompatible

  set hlsearch
  " auto matching target when typing
  set incsearch
  set ruler
  " auto indent
  set ai
  " smart indent
  set si
  set noerrorbells
  set novisualbell
  " ignore case when search
  set ignorecase smartcase
  " set auto read when file changed
  set autoread
  let g:spacevim_sidebar_width = 20
endf

