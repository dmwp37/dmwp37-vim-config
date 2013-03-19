filetype off
set rtp+=$VIMFILES/bundle/vundle/
call vundle#rc('$VIMFILES/bundle')

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" my scripts
Bundle 'a.vim'
Bundle 'tpope/vim-abolish'
Bundle 'bufexplorer.zip'
Bundle 'CSApprox'
Bundle 'kien/ctrlp.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'mbbill/echofunc'
Bundle 'matchit.zip'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/neosnippet'
Bundle 'scrooloose/nerdtree'
Bundle 'Lokaltog/vim-powerline'
Bundle 'wesleyche/SrcExpl'
Bundle 'ervandew/supertab'
Bundle 'tpope/vim-surround'
Bundle 'abudden/TagHighlight'
Bundle 'taglist.vim'
Bundle 'Shougo/vimproc'
Bundle 'Shougo/vimshell'
Bundle 'VisIncr'
Bundle 'Visual-Mark'
Bundle 'DoxyGen-Syntax'
Bundle 'xuhdev/SingleCompile'


" TagHighlight Settings
if ! exists('g:TagHighlightSettings')
    let g:TagHighlightSettings = {}
endif
if has('win32')
    let g:TagHighlightSettings['ForcedPythonVariant'] = 'compiled'
elseif has('win32unix')
    let g:TagHighlightSettings['ForcedPythonVariant'] = 'python' 
    let g:TagHighlightSettings['PathToPython'] = '/usr/bin/python'
    let g:TagHighlightSettings['CtagsExecutable'] = '/usr/bin/ctags'
    let Tlist_Ctags_Cmd="/usr/bin/ctags"
endif

" Grep options
let g:Grep_Skip_Dirs='RCS CVS SCCS .git'
if has('win32')
    let g:Grep_Cygwin_Find=1  " change \ to /
    let g:Grep_Find_Path=$VIMRUNTIME.'\find' " don't use win find
    let g:Grep_Xargs_Options='-n 256 --null' " fix cannot fork
endif

"echofunc settings
    inoremap <c-]> <c-r>=EchoFunc()<cr>
if !has('gui_running')
    " when in terminal mode the ALT key is not supported
    let g:EchoFuncKeyNext='-'
    let g:EchoFuncKeyPrev='='
endif

" Powerline Settings
let g:Powerline_colorscheme='solarized256'
let g:Powerline_stl_path_style='full'
let g:Powerline_symbols='fancy'

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

" snippets settings
let g:neosnippet#snippets_directory=$VIMFILES.'/snippets'
let g:neosnippet#disable_select_mode_mappings=0

" supertab settins
let g:SuperTabDefaultCompletionType="context" 
let g:SuperTabRetainCompletionType=2

" neocomplcache settings
" http://www.cnblogs.com/likeyu/archive/2012/03/24/2415070.html

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
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

let g:neocomplcache_snippets_dir=$VIMFILES."/snippets"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<TAB>"
inoremap <expr><C-TAB>  pumvisible() ? "\<C-p>" : "\<TAB>"
" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
" Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-z>  pumvisible() ? neocomplcache#undo_completion() : "\<C-o>U"
"inoremap <expr><C-l>  neocomplcache#complete_common_string()

" SuperTab like snippets behavior.
"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"
" Recommended key-mappings.
" <CR>: close popup and save indent.
" inoremap <expr><CR>  neocomplcache#close_popup() . "\<CR>"
inoremap <expr><CR> pumvisible() ? neocomplcache#close_popup() : "\<CR>"
" <TAB>: completion. THIS HAS NO USE WHEN WITH SNIPMATE
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <SPACE>: completion.
"inoremap <expr><space>  pumvisible() ? neocomplcache#close_popup() . "\<SPACE>" : "\<SPACE>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#close_popup()."\<C-h>"
inoremap <expr><ESC> neocomplcache#close_popup()."\<ESC>"
"inoremap <expr><C-y>  neocomplcache#close_popup()
"inoremap <expr><C-e>  neocomplcache#cancel_popup()
" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
"inoremap <expr><CR>  neocomplcache#close_popup() . "\<CR>"
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

" Recursive grep search
nnoremap <silent> <F3> :Rgrep<CR>
nnoremap <silent> <F4> :cn!<CR>:echo<CR>
if has("gui_running")
    nnoremap <silent> <S-F4> :cp!<CR>:echo<CR>
else
    nnoremap <silent> <Undo> :cp!<CR>:echo<CR>
endif

"SingleCompile settings
nmap <F5> :SCCompileRun<cr>

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

