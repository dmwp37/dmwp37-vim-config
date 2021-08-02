if has('vim_starting')
  set nocompatible               " Be iMproved
"  set runtimepath+=$VIMFILES/bundle/neobundle.vim/
endif

" Let VimPlug manage packages
call plug#begin('~/.vim/bundle')

Plug 'vim-scripts/a.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-abolish'
Plug 'vim-scripts/bufexplorer.zip'
Plug 'kien/ctrlp.vim'
Plug 'Lokaltog/vim-easymotion'
Plug 'mbbill/echofunc'
Plug 'scrooloose/nerdtree'
Plug 'wesleyche/SrcExpl'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/taglist.vim'
Plug 'Shougo/vimproc'
Plug 'Shougo/vimshell'
Plug 'vim-scripts/VisIncr'
Plug 'vim-scripts/Visual-Mark'
Plug 'xuhdev/SingleCompile'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-fugitive'
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'cespare/vim-toml', { 'for': 'toml' }
Plug 'chase/vim-ansible-yaml', { 'for': 'yaml' }
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'terryma/vim-multiple-cursors'
Plug 'terryma/vim-expand-region'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

if &encoding == 'utf-8'
  Plug 'bling/vim-airline'
endif

call plug#end()

" vim-airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" Enable matchit plugin
source $VIMRUNTIME/macros/matchit.vim

" auto-pairs settings
let g:AutoPairsFlyMode = 0

" Grep options
let g:Grep_Skip_Dirs='RCS CVS SCCS .git'
if has('win32')
  let g:Grep_Cygwin_Find=1  " change \ to /
  let g:Grep_Find_Path='"""'.$VIMRUNTIME.'\find'.'"""' " don't use win find
  let g:Grep_Xargs_Options='-n 180 --null' " fix cannot fork
endif

"echofunc settings
    inoremap <c-]> <c-r>=EchoFunc()<cr>
if !has('gui_running')
  " when in terminal mode the ALT key is not supported
  let g:EchoFuncKeyNext='-'
  let g:EchoFuncKeyPrev='='
endif


" Easymotion settings
hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade  Comment

" CtrlP settings
set wildignore+=.git/*,*.so,*.swp,*.zip
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn)$',
    \ 'file': '\v\.(exe|so|dll)$',
    \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
    \ }

" deoplete 
let g:deoplete#enable_at_startup = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Multi Cursor Find
vnoremap <leader>mf :MultipleCursorsFind 

" Recursive grep search
nnoremap <silent> <F3> :Rgrep<CR>
nnoremap <silent> <F4> :cn!<CR>:echo<CR>
if has("gui_running")
  nnoremap <silent> <S-F4> :cp!<CR>:echo<CR>
else
  nnoremap <silent> <Undo> :cp!<CR>:echo<CR>
endif

"SingleCompile settings
nmap <F5> :SCCompileRun<CR>

" <F12> is generate tags see trinity.vim
let g:SrcExpl_isUpdateTags = 0

" Open and close all the three plugins on the same time
nmap <F8>   :TrinityToggleAll<CR>

" Open and close the srcexpl.vim separately
nmap <F9>   :TrinityToggleSourceExplorer<CR>

" Open and close the taglist.vim separately
nmap <F10>  :TrinityToggleTagList<CR>

" Open and close the NERD_tree.vim separately
nmap <F11>  :TrinityToggleNERDTree<CR>


" Required:
filetype plugin indent on

