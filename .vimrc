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

" Bundles from GitHub repos:

" Fugitive
Bundle 'fugitive.vim'
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
" Terminal Vim with 256 colors colorscheme
Bundle 'fisadev/fisa-vim-colorscheme'
" Surround
Bundle 'tpope/vim-surround'
" Autoclose
Bundle 'Townk/vim-autoclose'
" Python mode (indentation, doc, refactor, lints, code checking, motion and
" operators, highlighting, run and ipdb breakpoints)
" Bundle 'klen/python-mode'
" Jslint.vim
" Bundle 'wookiehangover/jshint.vim'
" Javascript
Bundle "pangloss/vim-javascript"
Bundle "wavded/vim-stylus"
Bundle "scrooloose/syntastic"

" Bundles from vim-scripts repos

" Python code checker
Bundle 'pyflakes.vim'
" Search results counter
Bundle 'IndexedSearch'
" XML/HTML tags navigation
Bundle 'matchit.zip'
" Gvim colorscheme
Bundle 'Wombat'
" Yank history navigation
Bundle 'YankRing.vim'
" EasyMotion
Bundle 'EasyMotion'
" Neo
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/neosnippet'
Bundle 'honza/vim-snippets'
" Jinja2
Bundle 'lepture/vim-jinja'
" Tabular
Bundle 'godlygeek/tabular'
" Undo
Bundle 'Gundo'
" Ag
Bundle 'rking/ag.vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'kshenoy/vim-signature'
" Autopep8
Bundle 'tell-k/vim-autopep8'

" Installing plugins the first time
if iCanHazVundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
endif

" allow plugins by file type
filetype plugin on
filetype indent on

" tabs and spaces handling
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

let mapleader = ','
let maplocalleader = '\'

" tablength exceptions
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType coffee setlocal shiftwidth=2 tabstop=2

" always show status bar
set ls=2

" backup and noswap
set noswapfile
set nobackup
set autoread
set history=1000
set backspace=indent,eol,start
syntax on

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

" navigate windows with meta+arrows
map <c-l> <c-w>l
map <c-h> <c-w>h
map <c-k> <c-w>k
map <c-m> <c-w>j

" automatically close autocompletion window
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" old autocomplete keyboard shortcut
imap <C-J> <C-X><C-O>

" show pending tasks list
" map <F2> :TaskList<CR>

" save as sudo
ca w!! w !sudo tee "%"

" Toggle Paste
set pastetoggle=<leader>p

" CtrlP (new fuzzy finder)
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

" Ignore files on NERDTree
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']

" python-mode settings
" don't show lint result every time we save a file
let g:pymode_lint_write = 0
" run pep8+pyflakes+pylint validator with \8
autocmd FileType python map <buffer> <leader>8 :PyLint<CR>
" rules to ignore (example: "E501,W293")
let g:pymode_lint_ignore = ""
" don't add extra column for error icons (on console vim creates a 2-char-wide
" extra column)
let g:pymode_lint_signs = 0
" don't fold python code on open
let g:pymode_folding = 1
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

" use 256 colors when possible
if &term =~? 'mlterm\|xterm\|screen-256'
    let &t_Co = 256
    " color
    colorscheme fisa
else
    " color
    colorscheme delek
endif

" colors for gvim
if has('gui_running')
    colorscheme wombat
endif

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


" Status Line {
    set statusline=%f       "tail of the filename

    "display a warning if fileformat isnt unix
    set statusline+=%#warningmsg#
    set statusline+=%{&ff!='unix'?'['.&ff.']':''}
    set statusline+=%*

    "display a warning if file encoding isnt utf-8
    set statusline+=%#warningmsg#
    set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
    set statusline+=%*

    set statusline+=%h      "help file flag
    set statusline+=%y      "filetype
    set statusline+=%r      "read only flag
    set statusline+=%m      "modified flag

    set statusline+=%{fugitive#statusline()}

    "display a warning if &et is wrong, or we have mixed-indenting
    set statusline+=%#error#
    set statusline+=%{StatuslineTabWarning()}
    set statusline+=%*
    set statusline+=%{StatuslineLongLineWarning()}

    set statusline+=%#warningmsg#
    set statusline+=%*

    "display a warning if &paste is set
    set statusline+=%#error#
    set statusline+=%{&paste?'[paste]':''}
    set statusline+=%*

    set statusline+=%=      "left/right separator
    set statusline+=%{StatuslineCurrentHighlight()}\ \ "current highlight
    set statusline+=%c,     "cursor column
    set statusline+=%l/%L   "cursor line/total lines
    set statusline+=\ %P    "percent through file
    set laststatus=2

    "recalculate the trailing whitespace warning when idle, and after saving
    autocmd cursorhold,bufwritepost * unlet! b:statusline_trailing_space_warning

    "return the syntax highlight group under the cursor ''
    function! StatuslineCurrentHighlight()
        let name = synIDattr(synID(line('.'),col('.'),1),'name')
        if name == ''
            return ''
        else
            return '[' . name . ']'
        endif
    endfunction

    "recalculate the tab warning flag when idle and after writing
    autocmd cursorhold,bufwritepost * unlet! b:statusline_tab_warning

    "return '[&et]' if &et is set wrong
    "return '[mixed-indenting]' if spaces and tabs are used to indent
    "return an empty string if everything is fine
    function! StatuslineTabWarning()
        if !exists("b:statusline_tab_warning")
            let b:statusline_tab_warning = ''

            if !&modifiable
                return b:statusline_tab_warning
            endif

            let tabs = search('^\t', 'nw') != 0

            "find spaces that arent used as alignment in the first indent column
            let spaces = search('^ \{' . &ts . ',}[^\t]', 'nw') != 0

            if tabs && spaces
                let b:statusline_tab_warning =  '[mixed-indenting]'
            elseif (spaces && !&et) || (tabs && &et)
                let b:statusline_tab_warning = '[&et]'
            endif
        endif
        return b:statusline_tab_warning
    endfunction

    "recalculate the long line warning when idle and after saving
    autocmd cursorhold,bufwritepost * unlet! b:statusline_long_line_warning

    "return a warning for "long lines" where "long" is either &textwidth or 80 (if
    "no &textwidth is set)
    "
    "return '' if no long lines
    "return '[#x,my,$z] if long lines are found, were x is the number of long
    "lines, y is the median length of the long lines and z is the length of the
    "longest line
    function! StatuslineLongLineWarning()
        if !exists("b:statusline_long_line_warning")

            if !&modifiable
                let b:statusline_long_line_warning = ''
                return b:statusline_long_line_warning
            endif

            let long_line_lens = s:LongLines()

            if len(long_line_lens) > 0
                let b:statusline_long_line_warning = "[" .
                            \ '#' . len(long_line_lens) . "," .
                            \ 'm' . s:Median(long_line_lens) . "," .
                            \ '$' . max(long_line_lens) . "]"
            else
                let b:statusline_long_line_warning = ""
            endif
        endif
        return b:statusline_long_line_warning
    endfunction

    "return a list containing the lengths of the long lines in this buffer
    function! s:LongLines()
        let threshold = (&tw ? &tw : 80)
        let spaces = repeat(" ", &ts)

        let long_line_lens = []

        let i = 1
        while i <= line("$")
            let len = strlen(substitute(getline(i), '\t', spaces, 'g'))
            if len > threshold
                call add(long_line_lens, len)
            endif
            let i += 1
        endwhile

        return long_line_lens
    endfunction

    "find the median of the given array of numbers
    function! s:Median(nums)
        let nums = sort(a:nums)
        let l = len(nums)

        if l % 2 == 1
            let i = (l-1) / 2
            return nums[i]
        else
            return (nums[l/2] + nums[(l/2)-1]) / 2
        endif
    endfunction
" }

" Shifting lines
vnoremap < <gv
vnoremap > >gv

" neocomplcache {
    let g:acp_enableAtStartup = 0
    let g:neocomplcache_temporary_dir = "$HOME/.vim/tmp/neocomplcache"
    let g:neocomplcache_enable_at_startup = 1
    let g:neocomplcache_enable_camel_case_completion = 1
    let g:neocomplcache_enable_smart_case = 1
    let g:neocomplcache_enable_underbar_completion = 1
    let g:neocomplcache_enable_auto_delimiter = 1
    let g:neocomplcache_max_list = 15
    let g:neocomplcache_force_overwrite_completefunc = 1

    " SuperTab like snippets behavior.
    imap <silent><expr><TAB> neosnippet#expandable() ?
                \ "\<Plug>(neosnippet_expand_or_jump)" : (pumvisible() ?
                \ "\<C-e>" : "\<TAB>")
    smap <TAB> <Right><Plug>(neosnippet_jump_or_expand)

    " Define dictionary.
    let g:neocomplcache_dictionary_filetype_lists = {
                \ 'default' : '',
                \ 'vimshell' : $HOME.'/.vimshell_hist',
                \ 'scheme' : $HOME.'/.gosh_completions'
                \ }

    " Define keyword.
    if !exists('g:neocomplcache_keyword_patterns')
        let g:neocomplcache_keyword_patterns = {}
    endif
    let g:neocomplcache_keyword_patterns._ = '\h\w*'

    " Plugin key-mappings.

    " These two lines conflict with the default digraph mapping of <C-K>
    " If you prefer that functionality, add
    " let g:spf13_no_neosnippet_expand = 1
    " in your .vimrc.bundles.local file

    if !exists('g:spf13_no_neosnippet_expand')
        imap <C-k> <Plug>(neosnippet_expand_or_jump)
        smap <C-k> <Plug>(neosnippet_expand_or_jump)
    endif

    inoremap <expr><C-g> neocomplcache#undo_completion()
    inoremap <expr><C-l> neocomplcache#complete_common_string()
    inoremap <expr><CR> neocomplcache#complete_common_string()

    " <TAB>: completion.
    inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"

    " <CR>: close popup
    " <s-CR>: close popup and save indent.
    inoremap <expr><s-CR> pumvisible() ? neocomplcache#close_popup()"\<CR>" : "\<CR>"
    inoremap <expr><CR> pumvisible() ? neocomplcache#close_popup() : "\<CR>"

    " <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
    inoremap <expr><C-y> neocomplcache#close_popup()

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
    let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
    let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
    let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
    let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
    let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'

    " Enable neosnippet snipmate compatibility mode
    let g:neosnippet#enable_snipmate_compatibility = 1

    " For snippet_complete marker.
    if has('conceal')
        set conceallevel=2 concealcursor=i
    endif
" }

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
highlight OverLength ctermbg=darkred ctermfg=white guibg=#592929
match OverLength /\%81v.\+/
