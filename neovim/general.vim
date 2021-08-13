" general.vimrc

if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
  set termguicolors
endif

set number
set nowrap
set hls
set guifont=Meslo:h13

" Opens new windows to the right and to the bottom
set splitbelow
set splitright

set showcmd
set cursorline

" Highlight the matching brackets/braces
set showmatch

set autoindent

filetype plugin indent on
