"ctags config
"set tags+=/home/tangyizhou/git/linux-kernel/tags

set nu
set showmode
set ruler
set hlsearch
set incsearch
syntax on

set encoding=utf-8
set fileencodings=utf-8,ucs-bom,cp936,gb18030,gb2312,gbk,big5,euc-jp,euc-kr,latin1

set cursorline
highlight CursorLine term=bold cterm=bold guibg=Grey40

"linux kernel codestyle
set noexpandtab
set tabstop=8
set softtabstop=8
set shiftwidth=8

setlocal cindent
setlocal cinoptions=:0,l1,t0,(0
set autoindent

set listchars=tab:>-,trail:-,extends:#,nbsp:-
set list

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%121v.\+/
"end of linux kernel codestyle

"configurations not use
"set paste  "conflict with 'showmode'

""insert file header automatically when create .c,.h files
autocmd BufNewFile *.[ch] exec ":call SetTitle()"
""insert file header automatically
func SetTitle()
        call setline(1, "/*")
        call append(line("."), " * Copyright (C) Company Co., Ltd. ".strftime("%Y. All rights reserved."))
        call append(line(".")+1, " * Description:")
        call append(line(".")+2, " * Author: Tang")
        call append(line(".")+3, " * Create: ".strftime("%a %b %d %H:%M:%S %Y"))
        call append(line(".")+4, " */")
        ""position to the end of the file
        autocmd BufNewFile * normal G
endfunc

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

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
