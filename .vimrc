" no vi-compatible
set nocompatible
set encoding=utf-8 " Necessary to show Unicode glyphs

" Setting up Vundle - the vim plugin bundler
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle..."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let iCanHazVundle=0
endif

" required for vundle
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'
Bundle 'mkitt/tabline.vim'

" Bundles from GitHub repos:

" Vim Airline
Bundle 'bling/vim-airline'

" HTML
Bundle 'amirh/HTML-AutoCloseTag'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'gorodinskiy/vim-coloresque'
Bundle 'd11wtq/tomorrow-theme-vim'
Bundle 'tpope/vim-haml'

" Fugitive
" Bundle 'fugitive.vim'
" Better file browser
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
" Code commenter
Bundle 'scrooloose/nerdcommenter'
" Class/module browser
Bundle 'majutsushi/tagbar'
" Code and files fuzzy finder
Bundle 'kien/ctrlp.vim'
" Zen coding
Bundle 'mattn/emmet-vim'
" Git integration
Bundle 'motemen/git-vim'
" Tab list panel
Bundle 'kien/tabman.vim'
" Surround
Bundle 'tpope/vim-surround'
" Autoclose
Bundle 'Townk/vim-autoclose'

Bundle "pangloss/vim-javascript"
Bundle "wavded/vim-stylus"
Bundle "scrooloose/syntastic"
Bundle "digitaltoad/vim-jade"

" Bundles from vim-scripts repos

" Python code checker
Bundle 'pyflakes.vim'
Bundle 'hynek/vim-python-pep8-indent'
Bundle 'davidhalter/jedi-vim'
" Search results counter
Bundle 'IndexedSearch'
" XML/HTML tags navigation
Bundle 'matchit.zip'
Bundle 'othree/html5.vim'
" Gvim colorscheme
Bundle 'ScrollColors'
Bundle 'flazz/vim-colorschemes'
" Yank history navigation
Bundle 'YankRing.vim'
" EasyMotion
Bundle 'EasyMotion'
" AutoComplete
" Bundle 'Valloric/YouCompleteMe'
Bundle 'Shougo/neocomplete.vim'
Bundle 'Shougo/neosnippet'
Bundle 'Shougo/neosnippet-snippets'
" Jinja2
Bundle 'lepture/vim-jinja'
" Tabular
Bundle 'godlygeek/tabular'
" Undo
Bundle 'Gundo'
" Ag
Bundle 'rking/ag.vim'
Bundle 'kchmck/vim-coffee-script'
" Pep8
Bundle 'tell-k/vim-autopep8'
" GoLang
Bundle 'fatih/vim-go'
Bundle 'cespare/vim-go-templates'
" Javascript
Bundle 'Shutnik/jshint2.vim'

" Installing plugins the first time
if iCanHazVundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
endif

" allow plugins by file type
filetype plugin indent on

" tabs and spaces handling
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

let mapleader = ','
let maplocalleader = '\'

" tablength exceptions
autocmd FileType html setlocal shiftwidth=4 tabstop=4
autocmd FileType htmldjango setlocal shiftwidth=4 tabstop=4
autocmd FileType javascript setlocal shiftwidth=4 tabstop=4
autocmd FileType coffee setlocal shiftwidth=2 tabstop=2
autocmd BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab
" automatically close autocompletion window
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
" run pep8+pyflakes+pylint validator with \8
autocmd FileType python map <buffer> <leader>8 :PyLint<CR>
autocmd InsertEnter *.json setlocal conceallevel=0 concealcursor=
autocmd InsertLeave *.json setlocal conceallevel=0 concealcursor=inc
au BufNewFile,BufRead *.ejs set filetype=html
au FileType python setlocal formatprg=autopep8\ -aa\ --indent-size\ 0\ -

" always show status bar
set ls=2

" backup and noswap
set noswapfile
set nobackup
set autoread
syntax on
set history=1000
set backspace=indent,eol,start


" incremental search
set incsearch

" highlighted search results
set hlsearch

" smartcase
set ignorecase
set smartcase

" line numbers
set nu

" toggle Tagbar display
map <F4> :TagbarToggle<CR>
" autofocus on Tagbar open
let g:tagbar_autofocus = 1

" NERDTree (better file browser) toggle
map <F3> :NERDTreeTabsToggle<CR>

" tab navigation
map tn :tabn<CR>
map tp :tabp<CR>
map tm :tabm
map tt :tabnew
map <S-l> :tabn<CR>
map <S-h> :tabp<CR>
set switchbuf+=usetab,newtab

" navigate windows with meta+arrows
map <c-l> <c-w>l
map <c-h> <c-w>h
map <c-k> <c-w>k
map <c-m> <c-w>j


" old autocomplete keyboard shortcut
imap <C-J> <C-X><C-O>

" show pending tasks list
" map <F2> :TaskList<CR>

" save as sudo
ca w!! w !sudo tee "%"

" Toggle Paste
set pastetoggle=<leader>p

" CtrlP (new fuzzy finder)
if exists("g:ctrlp_user_command")
  unlet g:ctrlp_user_command
endif
if executable('ag')
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command =
    \ 'ag %s --files-with-matches -g "" --ignore "\.git$\|\.hg$\|\.svn$"'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
else
  " Fall back to using git ls-files if Ag is not available
  let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others']
endif
" Default to filename searches - so that appctrl will find application
" controller
"let g:ctrlp_by_filename = 1
" Don't jump to already open window. This is annoying if you are maintaining
" several Tab workspaces and want to open two windows into the same file.
let g:ctrlp_switch_buffer = 0

let g:ctrlp_map = ',e'
nmap ,g :CtrlPBufTag<CR>
nmap ,G :CtrlPBufTagAll<CR>
nmap ,f :CtrlPLine<CR>
nmap ,m :CtrlPMRUFiles<CR>
" to be able to call CtrlP with default search text
function! CtrlPWithSearchText(search_text, ctrlp_command_end)
    execute ':CtrlP' . a:ctrlp_command_end
    call feedkeys(a:search_text)
endfunction
" CtrlP with default text
nmap ,wg :call CtrlPWithSearchText(expand('<cword>'), 'BufTag')<CR>
nmap ,wG :call CtrlPWithSearchText(expand('<cword>'), 'BufTagAll')<CR>
nmap ,wf :call CtrlPWithSearchText(expand('<cword>'), 'Line')<CR>
nmap ,we :call CtrlPWithSearchText(expand('<cword>'), '')<CR>
nmap ,pe :call CtrlPWithSearchText(expand('<cfile>'), '')<CR>
nmap ,wm :call CtrlPWithSearchText(expand('<cword>'), 'MRUFiles')<CR>
" Don't change working directory
let g:ctrlp_working_path_mode = 0
" Ignore files on fuzzy finder
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|\.hg|\.svn)$',
  \ 'file': '\.pyc$\|\.pyo$',
  \ }
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*,*/.meteor/*
let g:ctrlp_show_hidden = 1

" Ignore files on NERDTree
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']

" python-mode settings
let g:pymode = 1
" don't show lint result every time we save a file
let g:pymode_lint_write = 0
" rules to ignore (example: "E501,W293")
let g:pymode_lint_ignore = ""
" don't add extra column for error icons (on console vim creates a 2-char-wide
" extra column)
let g:pymode_lint_signs = 0
" don't fold python code on open
let g:pymode_folding = 0
" don't load rope by default. Change to 1 to use rope
let g:pymode_rope = 1

" rope (from python-mode) settings
nmap ,d :RopeGotoDefinition<CR>
nmap ,o :RopeFindOccurrences<CR>

" don't let pyflakes allways override the quickfix list
let g:pyflakes_use_quickfix = 0

" tabman shortcuts
let g:tabman_toggle = 'tl'
let g:tabman_focus  = 'tf'

colorscheme codeschool

" when scrolling, keep cursor 3 lines away from screen border
set scrolloff=3

" autocompletion of files and commands behaves like shell
" (complete only the common part, list the options that match)
set wildmode=list:longest

" Fix to let ESC work as espected with Autoclose plugin
let g:AutoClosePumvisible = {"ENTER": "\<C-Y>", "ESC": "\<ESC>"}

" to use fancy symbols for powerline, uncomment the following line and use a
" patched font (more info on the README.rst)
" let g:Powerline_symbols = 'fancy'
let g:Powerline_theme = 'default'

" Toggle noh
map  <c-x> :set hls!<CR>
imap <c-x> <ESC>:set hls!<CR>a
vmap <c-x> <ESC>:set hls!<CR>gv

" Shifting lines
vnoremap < <gv
vnoremap > >gv

" Mapping W and Q
:command WQ wq
:command Wq wq
:command W w
:command Q q

" Golden-ratio {
    " Don't resize automatically.
    let g:golden_ratio_autocommand = 0
    " Mnemonic: - is next to =, but instead of resizing equally, all windows are
    " resized to focus on the current.
    nmap <C-w>- <Plug>(golden_ratio_resize)
    " Fill screen with current window.
    nnoremap <C-w>+ <C-w><Bar><C-w>_
" }

" Tabularize {
    nmap <Leader>a& :Tabularize /&<CR>
    vmap <Leader>a& :Tabularize /&<CR>
    nmap <Leader>a= :Tabularize /=<CR>
    vmap <Leader>a= :Tabularize /=<CR>
    nmap <Leader>a: :Tabularize /:<CR>
    vmap <Leader>a: :Tabularize /:<CR>
    nmap <Leader>a:: :Tabularize /:\zs<CR>
    vmap <Leader>a:: :Tabularize /:\zs<CR>
    nmap <Leader>a, :Tabularize /,<CR>
    vmap <Leader>a, :Tabularize /,<CR>
    nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
    vmap <Leader>a<Bar> :Tabularize /<Bar><CR>
" }

" Highlight whitespace {
    set list
    set listchars=tab:,.,trail:.,extends:#,nbsp:. " Highlight problematic whitespace
" }

nnoremap <localleader>u :GundoToggle<CR>

" 80 columns
let &colorcolumn=join(range(81,999),",")
let &colorcolumn="80,".join(range(400,999),",")

" Go ctags
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

" neocomplete {{{
    " Disable AutoComplPop.
    let g:acp_enableAtStartup = 0
    " Use neocomplete.
    let g:neocomplete#enable_at_startup = 1
    " Use smartcase.
    let g:neocomplete#enable_smart_case = 1
    " Set minimum syntax keyword length.
    let g:neocomplete#sources#syntax#min_keyword_length = 3
    let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

    " Define dictionary.
    let g:neocomplete#sources#dictionary#dictionaries = {
                \ 'default' : '',
                \ 'vimshell' : $HOME.'/.vimshell_hist',
                \ 'scheme' : $HOME.'/.gosh_completions'
                \ }

    " Define keyword.
    if !exists('g:neocomplete#keyword_patterns')
        let g:neocomplete#keyword_patterns = {}
    endif
    let g:neocomplete#keyword_patterns['default'] = '\h\w*'

    " Plugin key-mappings.
    inoremap <expr><C-g>     neocomplete#undo_completion()
    inoremap <expr><C-l>     neocomplete#complete_common_string()

    " Recommended key-mappings.
    " <CR>: close popup and save indent.
    inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
    function! s:my_cr_function()
        return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
        " For no inserting <CR> key.
        "return pumvisible() ? "\<C-y>" : "\<CR>"
    endfunction
    " <TAB>: completion.
    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    " <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
    inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
    " Close popup by <Space>.
    "inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

    " AutoComplPop like behavior.
    "let g:neocomplete#enable_auto_select = 1

    " Shell like behavior(not recommended).
    "set completeopt+=longest
    "let g:neocomplete#enable_auto_select = 1
    "let g:neocomplete#disable_auto_complete = 1
    "inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

    " Enable omni completion.
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

    " Enable heavy omni completion.
    if !exists('g:neocomplete#sources#omni#input_patterns')
        let g:neocomplete#sources#omni#input_patterns = {}
    endif
    "let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
    "let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
    "let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

    " For perlomni.vim setting.
    " https://github.com/c9s/perlomni.vim
    let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
" }}}

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'
au BufRead,BufNewFile *.tpl set filetype=gotplhtml

" Extra space for Nerd Commentor
let NERDSpaceDelims=1

" Quickfix enter jump
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>

" use jedi instead of ycm for python
let g:ycm_filetype_specific_completion_to_disable = { 'python' : 1 }
let g:ycm_filetype_blacklist = { 'python' : 1 }
let g:jedi#completions_command = "<TAB>"

" use jshint2
let jshint2_save = 1
" jshint validation
nnoremap <silent><F1> :JSHint<CR>
inoremap <silent><F1> <C-O>:JSHint<CR>
vnoremap <silent><F1> :JSHint<CR>

" show next jshint error
nnoremap <silent><F2> :lnext<CR>
inoremap <silent><F2> <C-O>:lnext<CR>
vnoremap <silent><F2> :lnext<CR>

" show previous jshint error
nnoremap <silent><F3> :lprevious<CR>
inoremap <silent><F3> <C-O>:lprevious<CR>
vnoremap <silent><F3> :lprevious<CR>
