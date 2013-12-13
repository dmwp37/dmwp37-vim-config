" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" language settings
if !has("win32") || has("gui_running")
    set encoding=utf-8
    set fileencodings=utf-8,gbk,ucs-bom,cp936,chinese
    set ambiwidth=double
endif

language messages en_US.UTF-8

if has('win32')
    set fileencoding=chinese
else
    set fileencoding=utf-8
endif

if has('win32')
    let $VIMFILES = $VIM.'/vimfiles'
else
    let $VIMFILES = $HOME.'/.vim'
endif

" set for the plugin
source $VIMFILES/IDE.vim

" this is for windows gvim
if has("win32") && has("gui_running")
    set guioptions-=T
    set guioptions+=A
    set guifont=DejaVu_Sans_Mono_for_Powerline:h12:cANSI
    set guifontwide=Fixedsys:h12
endif

if has("win32")
    "Windows options here
    source $VIMRUNTIME/vimrc_example.vim
    source $VIMRUNTIME/mswin.vim
    unmap <C-Y>
    unmap <C-Z>
    iunmap <C-Y>
endif

" window movement
if has("win32")
    noremap <C-Up>    <C-W>k
    noremap <C-Down>  <C-W>j
    noremap <C-Right> <C-W>l
    noremap <c-Left>  <C-W>h
else
    noremap [A <C-W>k
    noremap [B <C-W>j
    noremap [C <C-W>l
    noremap [D <C-W>h
" insert mode movement
    inoremap [A <Up>
    inoremap [B <Down>
    inoremap [C <Right>
    inoremap [D <Left>
endif
" Disable the command 'K' (keyword lookup) by mapping it
" to an "empty command".  (thanks, Lawrence! :-):
" map K :<CR>
map K :<BS>

" When I let Vim write the current buffer I frequently mistype the
" command ":w" as ":W" - so I have to remap it to correct this typo:
nmap :W :w

" Don't use Ex mode, use Q for formatting
"map Q gq

" Map CTRL-h to toggle "highlight search result" mode
map <C-H>  :se invhls<CR>

" set mouse=a
" set selectmode+=mouse
set nowrap
set ai
set wm=8
set ts=4
set sw=4
set et

syntax on

" set cmdheight=2
" set shell=bash

set viminfo='20,\"50    " read/write a .viminfo file, don't store more
                        " than 50 lines of registers

set laststatus=2
set expandtab
set cursorline
set ruler
set tabstop=4
set shiftwidth=4
set textwidth=72
set autoindent          " always set autoindenting on

set autowrite
set notitle icon
set nobackup
set writebackup

set showmatch
set incsearch
set nohlsearch
set ignorecase
set infercase
set smartcase

set backspace=indent,eol,start
set joinspaces
set nrformats=hex
set formatoptions+=n2		" in plain text, gq recognizes numbered lists 

set helpheight=0
set cmdheight=1
set shortmess=filnrxt
set scrolloff=3
set sidescroll=1
set showcmd
set showmode
set modeline
" set nofoldenable			" switch off folding by default (startup time!)
set switchbuf=useopen,usetab,newtab

set noautochdir
set nostartofline
set ttyfast
set lazyredraw
set updatecount=0       " don't create swap file 
set updatetime=100      " saves power on notebooks
"set visualbell          " this would make the flicker

set suffixes=.o,.bak
set wildchar=<TAB>
set wildmode=list:full
set wildmenu

" Point to dictionary
set dict+=$VIMFILES/dict/simple.dic
" Set path to include files for '[I'
if has('win32')
set path=.,c:/cygwin/usr/include,c:/cygwin/lib/gcc/i686-pc-cygwin/4.8.2/include
else
set path=.,/usr/include,/usr/lib/gcc/i686-pc-cygwin/4.8.2/include
endif
" Set the filename completion order
set complete=.,w,b,u,i
set completeopt-=preview

if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

  filetype plugin indent on

  autocmd BufEnter * if &filetype == "" | setlocal ft=text | endif
  autocmd FileType text source $VIMFILES/vimrc.wordlist
  autocmd FileType text setlocal textwidth=78

augroup makefile
  au!

  " Don't expand tabs in makefiles
  autocmd BufReadPost,FileReadPost [m|M]akefile* set noet
augroup END

endif

" Set nice colors
if &term == "xterm"
    set t_Co=256
    colorscheme molokai
endif

" highlight status color debug
function! SyntaxItem()
    return synIDattr(synID(line("."),col("."),1),"name")
endfunction
"set statusline+=%{SyntaxItem()}


