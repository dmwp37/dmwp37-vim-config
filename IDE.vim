if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=$VIMFILES/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('$VIMFILES/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

" my scripts
NeoBundle 'a.vim'
NeoBundle 'jiangmiao/auto-pairs'
NeoBundle 'tpope/vim-abolish'
NeoBundle 'bufexplorer.zip'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'mbbill/echofunc'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'wesleyche/SrcExpl'
NeoBundle 'tpope/vim-surround'
NeoBundle 'taglist.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/vimshell'
NeoBundle 'VisIncr'
NeoBundle 'Visual-Mark'
NeoBundle 'DoxyGen-Syntax'
NeoBundle 'xuhdev/SingleCompile'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'rust-lang/rust.vim'
NeoBundle 'cespare/vim-toml'
NeoBundle 'chase/vim-ansible-yaml'
NeoBundle 'godlygeek/tabular'
NeoBundle 'plasticboy/vim-markdown'

if !has('unix') || has('win32unix')
  NeoBundleLazy 'Valloric/YouCompleteMe'
  autocmd FileType c,cpp NeoComplCacheLock
  autocmd FileType c,cpp NeoBundleSource YouCompleteMe
  autocmd FileType c,cpp nnoremap <buffer> <C-k> :YcmCompleter GoTo<CR>
endif

if &term != "win32"
  NeoBundle 'CSApprox'
endif

if &encoding == 'utf-8'
  "NeoBundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
  NeoBundle 'bling/vim-airline'
endif

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

" neocomplcache settings
" http://www.cnblogs.com/likeyu/archive/2012/03/24/2415070.html
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Case sensitive
let g:neocomplcache_enable_ignore_case = 0
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
" AutoComplPop like behavior.
let g:neocomplcache_enable_auto_select = 0
" When you input 'ho-a',neocomplcache will select candidate 'a'.
let g:neocomplcache_enable_quick_match = 1
" Disable dictionary_complete
let g:neocomplcache_disabled_sources_list = {
    \ '_' : ['dictionary_complete'],
    \ 'text' : [],
    \ }
" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions',
    \ 'css' : $VIMFILES.'/dict/css.dic',
    \ 'php' : $VIMFILES.'/dict/php.dic',
    \ 'javascript' : $VIMFILES.'/dict/javascript.dic',
    \ }

inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<TAB>"
inoremap <expr><C-TAB>  pumvisible() ? "\<C-p>" : "\<TAB>"
" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
" NeoBundle key-mappings.
inoremap <expr><C-z>  pumvisible() ? neocomplcache#undo_completion() : "\<C-o>U"
inoremap <expr><C-g>  neocomplcache#undo_completion()
inoremap <expr><C-l>  neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
" Close popup by <Space>.
inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

" YCM
let g:ycm_key_invoke_completion = '<C-j>'
let g:ycm_error_symbol = '✗'
let g:ycm_warning_symbol = '⚠'
let g:ycm_extra_conf_globlist = [$VIMFILES.'/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/*']
let g:ycm_global_ycm_extra_conf = $VIMFILES.'/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

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

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck


