" Remap split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Remap Enter key for de-highlighting
nnoremap <CR> :noh<CR>

" allow backspacing over autoindent, line breaks, and start of insert
set backspace=indent,eol,start

" Map <C>-n to netrw in vertical split
nmap <C-n> :call ToggleNetrw()<CR>

" Freed <C-l> in Netrw
nmap <leader><leader><leader><leader><leader><leader>l <Plug>NetrwRefresh
