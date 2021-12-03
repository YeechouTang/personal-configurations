"ctags config
"set tags+=/home/tangyizhou/git/linux-kernel/tags
" my cscope settings
if has("cscope")
	set cscopeprg=/usr/bin/cscope
	set cscopetagorder=0
	set cscopetag
	set cscopequickfix=s-,c-,d-,i-,t-,e-
	set nocscopeverbose
	if filereadable("cscope.out")
		cscope add cscope.out
	elseif $CSCOPE_DB != ""
		cscope add $CSCOPE_DB
	endif
	set cscopeverbose
endif
" Ctrl + shift + -
" find target definition
nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
" the functions which calls target
nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>
" the functions which target calls
nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>
" search the string
nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>
" egrep search
nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>

" Enable mouse in insert mode
set mouse=i
" Optimize for fast terminal connections
set ttyfast
" Allow backspace in insert mode
set backspace=indent,eol,start
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Disable error bells
set noerrorbells
" Minimal number of screen lines to keep above and below the cursor
set scrolloff=3

set encoding=utf-8
set fileencodings=utf-8,ucs-bom,cp936,gb18030,gb2312,gbk,big5,euc-jp,euc-kr,latin1

" GUI configuration begion

"syntax enable
"set background=dark
"colorscheme solarized  " may be conflict with mobaxterm

set cursorline
highlight CursorLine term=bold cterm=bold guibg=Grey40

" Enable syntax highlighting
syntax on
" line number
set number
" Enhance command-line completion
set wildmenu
" Show the current mode
set showmode
" Show the cursor position
set ruler
" Always show status line
set laststatus=2
" Show the (partial) command as it’s being typed
set showcmd

" Show invisible characters
set listchars=tab:▸\ ,trail:·,extends:#,nbsp:-
set list

" vimdiff color scheme
if &diff
     "colorscheme pablo
"    new line
     highlight DiffAdd ctermbg=235  ctermfg=108  guibg=#262626 guifg=#87af87 cterm=reverse gui=reverse
"    deleted line
     highlight DiffDelete ctermbg=235  ctermfg=131  guibg=#262626 guifg=#af5f5f cterm=reverse gui=reverse
"    different line
     highlight DiffChange ctermbg=235  ctermfg=103  guibg=#262626 guifg=#8787af cterm=reverse gui=reverse
"    different text
     highlight DiffText ctermbg=235  ctermfg=208  guibg=#262626 guifg=#ff8700 cterm=reverse gui=reverse
endif
" end of GUI configuration

" Linux kernel codestyle
set noexpandtab
set tabstop=8
set softtabstop=8
set shiftwidth=8

setlocal cindent
setlocal cinoptions=:0,l1,t0,(0
set autoindent

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%121v.\+/
" end of linux kernel codestyle

" configurations not use
"set paste  "conflict with 'showmode'

" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>

" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" insert file header automatically
function! SetHeader()
	call setline(1,          "/*")
	call append(line("."),   " * Copyright (C) Huawei Technologies Co., Ltd. ".strftime("%Y. All rights reserved."))
	call append(line(".")+1, " * Description:")
	call append(line(".")+2, " * Author: Huawei OS Kernel Lab")
	call append(line(".")+3, " * Create: ".strftime("%a %b %d %H:%M:%S %Y"))
	call append(line(".")+4, " */")
	""position to the end of the file
	autocmd BufNewFile * normal G
endfunction
noremap <leader>sh :call SetHeader()<CR>

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" web page
noremap <leader>gh :! open https://github.com<CR>
