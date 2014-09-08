" vim:fdm=marker:

" VIM configuration
" by Mathias Brouilly

set nocompatible    "vim not vi
filetype off        "required !

" BUNDLE {{{

set rtp+=~/.vim/bundle/vundle/
silent! call vundle#rc()

if exists('*vundle#rc')

    " Let Vundle manage Vundle, required
    Bundle 'gmarik/vundle'
    " BUNDLES
    " Libraries
    Bundle 'mattn/webapi-vim'
    " Navigation
    Bundle 'scrooloose/nerdtree'
    Bundle 'kien/ctrlp.vim'
    " Helpers
    Bundle 'tpope/vim-surround'
    Bundle 'terryma/vim-multiple-cursors'
    Bundle 'tpope/vim-commentary'
    Bundle 'Raimondi/delimitMate'
    Bundle 'nathanaelkane/vim-indent-guides'
    Bundle 'junegunn/vim-easy-align'
    Bundle 'Valloric/MatchTagAlways'
    Bundle 'editorconfig/editorconfig-vim'
    " Syntax
    Bundle 'pangloss/vim-javascript'
    Bundle 'kchmck/vim-coffee-script'
    Bundle 'elzr/vim-json'
    Bundle 'hail2u/vim-css3-syntax'
    Bundle 'wavded/vim-stylus'
    Bundle 'othree/html5.vim'
    Bundle 'digitaltoad/vim-jade'
    Bundle 'mustache/vim-mustache-handlebars'
    Bundle 'spf13/PIV'
    Bundle 'evanmiller/nginx-vim-syntax'
    Bundle 'plasticboy/vim-markdown'
    " Snippets
    Bundle 'mattn/emmet-vim'
    Bundle 'SirVer/ultisnips'
    Bundle 'honza/vim-snippets'
    Bundle 'mattn/gist-vim'
    " Ctags
    Bundle 'majutsushi/tagbar'
    " Version control
    Bundle 'tpope/vim-fugitive'
    " Tmux
    Bundle 'wellle/tmux-complete.vim'
    " Writing
    Bundle 'junegunn/goyo.vim'

endif

" }}}

" GENERAL Settings

filetype plugin indent on   "automatically detect file types, required
syntax on

" UI {{{

set number                          "add line number
set cursorline                      "highlight the current line
set ruler                           "add info on current position
set noerrorbells vb t_vb=           "no bell or blink
set showcmd                         "shows command or number of lines selected
set showmode                        "shows the current mode
set backspace=indent,eol,start      "allow backspacing over everything in insert mode
set virtualedit=block               "allow cursor to go anywhere in visual block mode

" }}}

" FOLDS {{{

set nofoldenable                "switch off folding
set foldmethod=indent

" }}}

" WRITING, READING {{{

set autoread                    "auto reload externally changed files
set noautowrite                 "do not auto write
set modifiable

"max memory to use for pattern matching
set maxmempattern=20000

" }}}

" INDENTATION {{{

set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set smarttab
set smartindent
set autoindent
set preserveindent  
set wrap
set linebreak                   "do not wrap text in the middle of a word
set nolist
set textwidth=0
set formatoptions+=cql

" }}}

" FILE ENCODING {{{

set fileencoding=utf-8
set fileformats=unix,mac,dos    "support all file format

" }}}

" THEMES {{{

" Kivabien
set t_Co=256
set background=dark
colorscheme kivabien

" }}}

" KEYBOARD {{{

set ttyfast                     "improve redrawing
set ttyscroll=3
set notimeout                   "speed up response to Esc key
set ttimeout
set timeoutlen=400              "waiting period for another key to be pressed (milliseconds)
set lazyredraw                  "avoir scrolling problems

" }}}

" WINDOW, MOUSE {{{

set title                       "window/terminal title
set titlestring=%F
set shortmess=atI               "don't show intro messages

set mouse=a                     "mouse support
set ttymouse=xterm2

set clipboard=unnamed           "copy and paste friendly, require vim > 7.3

if has('gui_running')  

    set guioptions-=T           "hide toolbar
    set guioptions-=m           "hide menu bar

endif

set scrolljump=6                "jump 6 line when running out of screen
set scrolloff=6                 "indicate jump out of screen 6 lines before end of screen

set splitright                  "when splitting vertically, split to the right
set splitbelow                  "when splitting horizontally, split below

" }}}

" SEARCH {{{

set hlsearch                    "enable search highlighting
set incsearch                   "incrementally match the search
set ignorecase                  "make searches case insensitive<F2><F2>
set nowrapscan                  "stop searching at end of file

" }}}

" COMPLETION {{{

set showfulltag                                 "show the full tag when completing

set wildmenu                                    "better command line completion
set wildmode=list:longest,full

set wildignore+=*.jpg,*.png,*.jpeg              "ignore images..
set wildignore+=*.ico,*.bmp,*.gif      
set wildignore+=*.DS_Store,*.log,*.sw?          "ignore log files
set wildignore+=*/.git/*,*/.svn/*               "ignore source control files

if has('autocmd')

    "auto enable autocomplete for html, css, javascript, php..
    autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
    autocmd FileType css set omnifunc=csscomplete#CompleteCSS
    autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType php set omnifunc=phpcomplete#CompletePHP
    autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags

endif

" }}}

" HISTORY, UNDO {{{

set noswapfile                  "turn off swap files
set nobackup                    "turm off backup files
set nowb
set history=500                 "longer history than 20(default)

if has('persistent_undo')

    set undodir=~/.vim/undo     "set the undo directory
    set undofile                "set undo file even when closed
    set undolevels=500          "maximum number of changes that can be undone
    set undoreload=5000 

endif

" }}}

" FILE HANDLING {{{

let php_htmlInStrings=1         "highlight html syntax within strings
let php_sql_query=1             "highlight sql queries
" let php_folding=1               "enable folding for classes and functions

if has('autocmd')

    au BufNewFile,BufRead *.rss set ft=xml                                      "treat .rss files as xml
    au BufNewFile,BufRead *.{markdown,md,mkd} set ft=markdown                   "these are markdown
    au BufNewFile,BufRead /opt/nginx/{conf,sites-available}/* set ft=nginx      "nginx syntax highlighting
    au BufNewFile,BufRead *.cson set ft=coffee
    au BufNewFile,BufRead *.{stylus,styl} set ft=stylus.css                     "css autocomplete for stylus

    au BufNewFile,BufReadPost *.{json,jade,stylus,styl} setl shiftwidth=2 tabstop=2 softtabstop=2 expandtab
    "disable automatic comment insertion
    au FileType * setl formatoptions-=c formatoptions-=r formatoptions-=o
    "comments used to indicate folds for vim files
    au FileType vim setl foldenable foldmethod=marker
    "auto reload .vimrc
    au BufWritepost .vimrc source $MYVIMRC

endif

" }}}

" TABS {{{

"based on: github.com/mkitt/tabline.vim

set showtabline=1

if exists('+showtabline')

    function! MyTabs()
        let s = ''
        for i in range(tabpagenr('$'))
            let tab = i + 1
            let winnr = tabpagewinnr(tab)                   "gets current window of current tab
            let buflist = tabpagebuflist(tab)               "list of buffers associated with the windows in the current tab
            let bufnr = buflist[winnr - 1]                  "current buffer number
            let bufname = bufname(bufnr)                    "gets the name of the current buffer in the current window of the current tab
            let bufmodified = getbufvar(bufnr, "&mod")

            let s .= '%' . tab . 'T'
            let s .= (tab == tabpagenr() ? '%#TabLineSel#' : '%#TabLine#')                      "if this tab is the current tab...set the right highlighting
            let s .= ' ' . tab .'-'
            let s .= (bufname != '' ? ''. fnamemodify(bufname, ':t') . ' ' : 'NO NAME ')

            if bufmodified
                let s .= '[+] '
            endif
        endfor

        let s .= '%#TabLineFill#'                           "blank highlighting between the tabs and the righthand close 'X'
        return s
    endfunction

    set tabline=%!MyTabs()

endif

" }}}

" STATUS LINE {{{
    
set laststatus=2                    "always show statusline

if has('statusline')

    function! FileSize()
        let bytes = getfsize(expand('%:p'))
        if bytes <= 0
            return ''
        endif
        if bytes < 1024
            return ' ' . bytes . 'B'
        else
            return ' ' . (bytes / 1024) . 'K'
        endif
    endfunction
        
    set statusline=
    set stl+=\ %m                   "modified flag [+/-]
    set stl+=\ %Y                   "file type
    set stl+=\ %{&ff}               "file format
    set stl+=\ %{&enc}              "file encoding
    set stl+=\ %r                   "readonly flag [RO]
    set stl+=\|
    if exists('*vundle#rc') 
        set stl+=\ %{fugitive#statusline()}         "git current branch
    endif
    set stl+=\ %f                   "relative path to file
    set stl+=%=                     "right align following items
    set stl+=%t                     "file name
    set stl+=%{FileSize()}          "file size
    set stl+=\ \%*
    set stl+=%1*\ %l\/%L            "infos line number
    set stl+=\ \|\ %p%%             "percent through file
    set stl+=\ \%*
                                                   
endif

" }}}

" KEY BINDINGS {{{

let mapleader = ','                 "set the leader key            

" map 'jj' to 'exit insert mode' 
:imap jj <esc>

"quickly edit/auto reload the vimrc file
nmap <leader>ev :tabedit $MYVIMRC<cr>

"change the cwd to the directory of current file
cmap cwd cd %:p:h

"write file using sudo 
cmap w!! w !sudo tee % >/dev/null

"commons
map <leader>w :w<cr>
map <leader>q :q<cr>

"tab mappings
map tn :tabnext<cr>
map tp :tabprevious<cr>
map tf :tabfirst<cr>
map tl :tablast<cr>
map tc :tabclose<cr>
map tm :tabmove<cr>

nmap <leader>tn :tabnew<cr>
nmap <leader>te :tabedit<space>

"switch between window
nmap <leader><space> <C-w>w
nmap <leader>h <C-w>h
nmap <leader>j <C-w>j   
nmap <leader>k <C-w>k   
nmap <leader>l <C-w>l

"clearing highlighted searches
nmap <leader>/ :nohlsearch<cr>

"autocomplete with Ctrl + Space
inoremap <Nul> <C-x><C-o>

"insert blank lines without going into insert mode
nmap go o<esc>
nmap gO O<esc>

"toggle vim paste mode 
"prevent auto-indenting and auto-expansion when pasting from clipboard
set pastetoggle=<F9>

if has('spell')

    "turn on spell checking en/fr
    nmap <F10>e :set spell spelllang=en<cr>
    nmap <F10>f :set spell spelllang=fr<cr>
    "turn off spell check hightlighting
    nmap <F10>/ :set nospell<cr>

    "spell check when writing commit logs
    autocmd filetype svn,*commit* setlocal spell textwidth=72

endif

" }}}

" PLUGINS SETUP {{{

if exists('*vundle#rc')

    " NERDTree
    let g:NERDTreeWinSize=25                                "set nerdtree width
    let NERDTreeMinimalUI=1                                 "disable the label 'Press ? for help'
    let g:NERDTreeDirArrows=0
    let NERDTreeMouseMode=3                                 "single click to open any node
    " Highlight the selected entry in the tree
    let NERDTreeHighlightCursorline=1
    " Ignore these files extensions
    let NERDTreeIgnore=[ '\.DS_Store$', '\.swp$', 'node_modules', 'bower_components' ]
    " Open NERDTree
    map <leader>n :NERDTreeToggle<cr>
    " Open directory of the current file in NERDTree
    nmap <leader>cn :NERDTree %<cr>
    " Open NERDTree on startup, when no file has been specified
    autocmd VimEnter * if !argc() | NERDTree | endif

    " CtrlP
    "open CtrlP
    nmap <leader>p :CtrlP<cr>
    "ignore these files extensions
    let g:ctrlp_custom_ignore=[ '\.DS_Store$', '\.swp$', 'node_modules', 'bower_components' ]

    " Toggle Tagbar window
    nmap <F8> :TagbarToggle<cr>

    " Nginx syntax
    nmap <leader>gx :set syntax=nginx<cr>

    " PHP
    let g:DisableAutoPHPFolding=1

    " Easy align
    vnoremap <silent> <Enter> :EasyAlign<cr>

    " Vim indent guides
    let g:indent_guides_auto_colors=0
    autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=234
    autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=235

    " MatchTagsAlways
    let g:mta_use_matchparen_group=0
    let g:mta_set_default_matchtag_color=0
    hi MatchTag ctermfg=227 ctermbg=234

    " Emmet
    let g:user_emmet_expandabbr_key='<C-e>'
    " Map Emmet expand to tab key
    imap <expr><tab> emmet#isExpandable() ? "\<C-e>" : "\<tab>"
    let g:use_emmet_complete_tag=1
    let g:user_emmet_settings = webapi#json#decode(join(readfile(expand('~/.vim/snippets.json')), "\n"))

    " Ultisnips
    let g:UltiSnipsExpandTrigger='<C-u>'
    let g:UltiSnipsListSnippets='<C-l>'
    let g:UltiSnipsJumpForwardTrigger='<C-n>'
    let g:UltiSnipsJumpBackwardTrigger='<C-b>'

    " Markdown
    let g:vim_markdown_folding_disabled=1

    " Goyo
    let g:goyo_width='120'

endif

" }}}
