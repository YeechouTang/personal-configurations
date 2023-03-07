" My Dependencies
" Vim Plug     https://github.com/junegunn/vim-plug
" Solarized Colorscheme https://github.com/altercation/vim-colors-solarized

call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes

" filesystem
Plug 'preservim/nerdtree'
" snippet
" Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" auto-complete
" Plug 'jiangmiao/auto-pairs'  " has side effects for .vimrc comments
Plug 'preservim/nerdcommenter'
Plug 'godlygeek/tabular'
" search
" Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' } " need Python Vim
Plug 'Lokaltog/vim-easymotion'  " use <leader> <leader>
" all lanugage support
Plug 'sheerun/vim-polyglot'
" do syntax check
Plug 'dense-analysis/ale'

" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()
" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting


" NERDTree configs
" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
" Start NERDTree when Vim starts with a directory argument.
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') &&
    \ b:NERDTree.isTabTree() | quit | endif
noremap <leader>nt :NERDTreeToggle<CR>
" s: vsplit file

" ultisnips
" Trigger configuration.
let g:UltiSnipsExpandTrigger="<c-x>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" default snippets for all languages:
" if  : if without else
" ife : if $1 else $2
" eif : else if ($1) { .. }
" el  : else ..
" wh  : while (cond) ...

" NERD Commenter
filetype plugin on "required
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" comment: <leader> cc  uncoment: <leader> cu
" linux kernel style: <leader> cs  alternate comment (// for c) <leader> ca

" LeaderF
" :LeaderfInstallCExtension / :LeaderfUninstallCExtension "the C extension
noremap <leader>f :Leaderf file<CR>
noremap <leader>j :LeaderfFunction<CR>
noremap <leader>t :LeaderfTag<CR>
" default shortcut: <leader>f
" <C-R> switch between fuzzy search mode and regex mode
" <C-F> switch between full path search mode and name only search mode
" <Tab> switch to normal mode
" <C-J> / <C-K> move the cursor downward/upward in the result window
" <C-U> / <C-W> clear all the prompt / word"
" <C-T> / <C-]> / <C-X> open in new tab/vertical/horizontal split window
" <Up> / <Down> recall last/next input pattern from history

" my ctags configs
set tags+=/home/tangyizhou/git/hulk/tags
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
" Don't ignore case if uppercase char presented
set smartcase
" Disable error bells
set noerrorbells
" Minimal number of screen lines to keep above and below the cursor
set scrolloff=3
" reload files when changed on disk
set autoread
" do not keep a backup file
set nobackup

set encoding=utf-8
set fileencodings=utf-8,ucs-bom,cp936,gb18030,gb2312,gbk,big5,euc-jp,euc-kr,latin1
set termencoding=utf-8

" GUI configuration begin

"syntax enable
"set background=dark
"colorscheme solarized  " may be conflict with mobaxterm

set cursorline
highlight CursorLine term=bold cterm=bold guibg=Grey40

" Enable syntax highlighting
syntax on
" Line number. May introduce display bugs when delete lines.
" set number
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
	call append(line("."),   " * Copyright (C) Shopee Singapore PTE Ltd. ".strftime("%Y. All rights reserved."))
	call append(line(".")+1, " * Description:")
	call append(line(".")+2, " * Author: Linux kernel team of Engineering Infrastructure")
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

" https://github.com/ryanpcmcquen/fix-vim-pasting
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
    set pastetoggle=<Esc>[201~
    set paste
    return ""
endfunction

" web page
noremap <leader>gh :! open https://github.com<CR>
