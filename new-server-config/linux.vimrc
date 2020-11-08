" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

set nu
set ruler
set showmode
set hlsearch
set incsearch
syntax on

setlocal cindent
setlocal cinoptions=:0,l1,t0,t0,(0
set autoindent

set noexpandtab
set tabstop=8
set softtabstop=8
set shiftwidth=8
set ts=8

set listchars=tab:>-,trail:-,extends:#,nbsp:-
set list
