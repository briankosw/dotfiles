"general.vimrc

if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
  set termguicolors
endif

set encoding=UTF8
syntax enable
set number
set colorcolumn=80
set splitbelow
set splitright
set nowrap
set hls
set guifont=Meslo:h13
set termguicolors
"Set tab and shift width to 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab
set showcmd
set cursorline
set showmatch
filetype on

" Set netrw style
let g:netrw_liststyle = 3
" Remove netrw banner
let g:netrw_banner = 0
" Set width of netrw
let g:netrw_winsize = 15

" Ignore certain files in netrw
let g:netrw_list_hide= '__pycache__'

" Automatically open netrw on startup
augroup ProjectDrawer
  autocmd!
  autocmd VimEnter * :Lexplore
  autocmd TabNew * call feedkeys(":Vexplore\<CR>", 'n')
  autocmd VimEnter * :wincmd p
augroup END
"
let g:NetrwIsOpen=0

function! ToggleNetrw()
    if g:NetrwIsOpen
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout " . i 
            endif
            let i-=1
        endwhile
        let g:NetrwIsOpen=0
    else
        let g:NetrwIsOpen=1
        silent Lexplore
    endif
endfunction

" close if final buffer is netrw or the quickfix
augroup finalcountdown
  au!
  autocmd WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&filetype") == "netrw" || &buftype == 'quickfix' |q|endif
  autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) || &buftype == 'quickfix' | q | endif
augroup END


"Highlight searches with yellow background and black foreground
hi Search ctermbg=Magenta ctermfg=Black cterm=none

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red
