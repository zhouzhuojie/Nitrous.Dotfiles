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

" terminalkeys
Bundle 'nacitar/terminalkeys.vim'

" Vim Airline
Bundle 'vim-airline/vim-airline'

" Test
Bundle 'janko-m/vim-test'

" GitGutter
Bundle 'airblade/vim-gitgutter'

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
Bundle 'ctrlpvim/ctrlp.vim'
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
Bundle 'Valloric/YouCompleteMe'
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
" avro
Bundle 'dln/avro-vim'
" thrift
Bundle 'solarnz/thrift.vim'

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
nmap <silent> gf :NERDTreeFind<CR>

" tab navigation
map tn :tabn<CR>
map tp :tabp<CR>
map tm :tabm
map tt :tabnew
map <S-l> :tabn<CR>
map <S-h> :tabp<CR>
set switchbuf+=usetab,newtab

" navigate windows with meta+arrows
nmap <tab> <c-w>p

" jk to be esc
imap jk <ESC>
imap kj <ESC>

" show pending tasks list
" map <F2> :TaskList<CR>

" save as sudo
ca w!! w !sudo tee "%"

" Toggle Paste
set pastetoggle=<leader>p

nnoremap gk :Ag! "\b<C-R><C-W>\b"<CR>:cw<CR>

" CtrlP (new fuzzy finder)
if exists("g:ctrlp_user_command")
  unlet g:ctrlp_user_command
endif
if executable('ag')
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command =
    \ 'ag %s --hidden -U --files-with-matches -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
let g:ctrlp_switch_buffer = 't'

let g:ctrlp_map = ',e'
" Don't change working directory
let g:ctrlp_working_path_mode = 0
" Ignore files on fuzzy finder
let g:ctrlp_show_hidden = 1

" Ignore files on NERDTree
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']

" don't let pyflakes allways override the quickfix list
let g:pyflakes_use_quickfix = 0

" tabman shortcuts
let g:tabman_toggle = 'tl'
let g:tabman_focus  = 'tf'

" theme settings
set t_Co=256
set background=dark
colorscheme molokai

" when scrolling, keep cursor 3 lines away from screen border
set scrolloff=3

" try to fix slow on .go files
set nocursorline
syntax sync minlines=256
set re=1

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
    set listchars=tab:├─,trail:␠,nbsp:⎵
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

" Extra space for Nerd Commentor
let NERDSpaceDelims=1

" Quickfix enter jump
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>

" use jshint2
let jshint2_save = 1
" jshint validation
nnoremap <silent><F1> :JSHint<CR>
inoremap <silent><F1> <C-O>:JSHint<CR>
vnoremap <silent><F1> :JSHint<CR>

" show next jshint error
nnoremap <silent><F5> :lnext<CR>
inoremap <silent><F5> <C-O>:lnext<CR>
vnoremap <silent><F5> :lnext<CR>

" show previous jshint error
nnoremap <silent><F6> :lprevious<CR>
inoremap <silent><F6> <C-O>:lprevious<CR>
vnoremap <silent><F6> :lprevious<CR>

" ycm
set completeopt-=preview
let g:ycm_add_preview_to_completeopt=0

" vim-go
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck', 'go']
let g:go_list_type = "quickfix"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 0
let g:go_highlight_interfaces = 0
let g:go_highlight_operators = 0
let g:go_highlight_build_constraints = 1
let g:go_term_enabled = 1
let g:go_alternate_mode = "tabedit"
let g:syntastic_aggregate_errors = 1
let g:go_fmt_command = "goimports"
nmap gc :GoCallers<CR>
nmap gi :GoInfo<CR>
nmap <silent> <leader>t :TestFile<CR>
nmap <silent> <leader>f :TestNearest<CR>
nmap <leader>a :GoAlternate<CR>
nmap <leader>g :GoCoverageToggle<CR>
