" vim:fdm=marker:

" VIM configuration
" by Mathias Brouilly


set nocompatible " Vim not vi
filetype off     " Required !

" BUNDLE {{{

set rtp+=~/.vim/bundle/vundle/
silent! call vundle#rc()

if exists('*vundle#rc')

  " Let Vundle manage Vundle, required
  Plugin 'gmarik/vundle'
  " BUNDLES
  " Libraries
  Plugin 'mattn/webapi-vim'
  " Navigation
  Plugin 'scrooloose/nerdtree'
  Plugin 'kien/ctrlp.vim'
  " Helpers
  Plugin 'tpope/vim-surround'
  Plugin 'terryma/vim-multiple-cursors'
  Plugin 'tpope/vim-commentary'
  Plugin 'Raimondi/delimitMate'
  Plugin 'nathanaelkane/vim-indent-guides'
  Plugin 'junegunn/vim-easy-align'
  Plugin 'Valloric/MatchTagAlways'
  Plugin 'editorconfig/editorconfig-vim'
  Plugin 'terryma/vim-expand-region'
  Plugin 'csscomb/vim-csscomb'
  " Syntax
  Plugin 'othree/javascript-libraries-syntax.vim'
  Plugin 'othree/yajs.vim'
  Plugin 'othree/es.next.syntax.vim'
	Plugin 'leafgarland/typescript-vim'
  Plugin 'moll/vim-node'
  Plugin 'elzr/vim-json'
  Plugin 'hail2u/vim-css3-syntax'
  Plugin 'wavded/vim-stylus'
  Plugin 'othree/html5.vim'
  Plugin 'mustache/vim-mustache-handlebars'
	Plugin 'digitaltoad/vim-pug'
  Plugin 'spf13/PIV'
  Plugin 'evanmiller/nginx-vim-syntax'
  Plugin 'plasticboy/vim-markdown'
  Plugin 'dsawardekar/wordpress.vim'
  " Snippets
  Plugin 'AutoComplPop'
  Plugin 'mattn/emmet-vim'
  Plugin 'SirVer/ultisnips'
  Plugin 'honza/vim-snippets'
  Plugin 'mattn/gist-vim'
  " Ctags
  Plugin 'majutsushi/tagbar'
  " Version control
  Plugin 'tpope/vim-fugitive'
  " Tmux
	Plugin 'tmux-plugins/vim-tmux'
  Plugin 'wellle/tmux-complete.vim'
  " Writing
  Plugin 'suan/vim-instant-markdown'

endif

" }}}

" GENERAL Settings

filetype plugin indent on " Automatically detect file types, required
syntax on

" UI {{{

set number                     " Add line number
set cursorline                 " Highlight the current line
set ruler                      " Add info on current position
set noerrorbells vb t_vb=      " No bell or blink
set showcmd                    " Shows command or number of lines selected
set showmode                   " Shows the current mode
set backspace=indent,eol,start " Allow backspacing over everything in insert mode
set virtualedit=block          " Allow cursor to go anywhere in visual block mode

" }}}

" FOLDS {{{

set nofoldenable " Switch off folding
set foldmethod=indent

" }}}

" WRITING, READING {{{

set autoread    " Auto reload externally changed files
set noautowrite " Do not auto write
set modifiable

" Max memory to use for pattern matching
set maxmempattern=20000

" }}}

" INDENTATION {{{

set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set smarttab
set smartindent
set autoindent
set preserveindent
set wrap
set linebreak " Do not wrap text in the middle of a word
set nolist
set textwidth=0
set formatoptions+=cql

" }}}

" FILE ENCODING {{{

set fileencoding=utf-8
set fileformats=unix,mac,dos " Support all file format

" }}}

" THEMES {{{

" Kivabien
set t_Co=256
set background=dark
colorscheme kivabien

" }}}

" KEYBOARD {{{

set ttyfast        " Improve redrawing
set ttyscroll=3
set notimeout      " Speed up response to Esc key
set ttimeout
set timeoutlen=400 " Waiting period for another key to be pressed (milliseconds)
set lazyredraw     " Avoid scrolling problems

" }}}

" WINDOW, MOUSE {{{

"set title            " Window/Terminal title
set titlestring=%F
set shortmess=atI     " Don't show intro messages

set mouse=a           " Mouse support
set ttymouse=xterm2

set clipboard=unnamed " Copy/Paste friendly, require vim > 7.3

if has('gui_running')

  set guioptions-=T   " Hide toolbar
  set guioptions-=m   " Hide menu bar

endif

set scrolljump=6      " Jump 6 line when running out of screen
set scrolloff=6       " Indicate jump out of screen 6 lines before end of screen

set splitright        " When splitting vertically, split to the right
set splitbelow        " When splitting horizontally, split below

" }}}

" SEARCH {{{

set hlsearch   " Enable search highlighting
set incsearch  " Incrementally match the search
set ignorecase " Make searches case insensitive<F2><F2>
set nowrapscan " Stop searching at end of file

" }}}

" COMPLETION {{{

set showfulltag                        " Show the full tag when completing

set wildmenu                           " Better command line completion
set wildmode=list:longest,full

set wildignore+=*.jpg,*.png,*.jpeg     " Ignore images..
set wildignore+=*.ico,*.bmp,*.gif
set wildignore+=*.DS_Store,*.log,*.sw? " Ignore log files
set wildignore+=*/.git/*,*/.svn/*      " Ignore source control files

if has('autocmd')

  " Auto enable autocomplete for html, css, javascript, php..
  autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
  autocmd FileType css set omnifunc=csscomplete#CompleteCSS
  autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType php set omnifunc=phpcomplete#CompletePHP
  autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags

endif

" }}}

" HISTORY, UNDO {{{

set noswapfile  " Turn off swap files
set nobackup    " Turm off backup files
set nowb
set history=500 " Longer history than 20(default)

if has('persistent_undo')

  set undodir=~/.vim/undo " Set the undo directory
  set undofile            " Set undo file even when closed
  set undolevels=500      " Maximum number of changes that can be undone
  set undoreload=5000

endif

" }}}

" FILE HANDLING {{{

let php_htmlInStrings=1 " Highlight html syntax within strings
let php_sql_query=1     " Highlight sql queries
"let php_folding=1     " Enable folding for classes and functions

if has('autocmd')

  au BufNewFile,BufRead *.rss set ft=xml                                 " Treat .rss files as xml
  au BufNewFile,BufRead *.{markdown,md,mkd} set ft=markdown              " These are markdown
  au BufNewFile,BufRead /opt/nginx/{conf,sites-available}/* set ft=nginx " Nginx syntax highlighting
  au BufNewFile,BufRead *.cson set ft=coffee
  au BufNewFile,BufRead *.{stylus,styl} set ft=stylus.css                " CSS autocomplete for stylus

  au BufNewFile,BufReadPost *.{css,stylus,styl,json,jade} setl shiftwidth=2 tabstop=2 softtabstop=2 expandtab
  " Disable automatic comment insertion
  au FileType * setl formatoptions-=c formatoptions-=r formatoptions-=o
  " Comments used to indicate folds for vim files
  au FileType vim setl foldenable foldmethod=marker
  " Auto reload .vimrc
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
      let winnr = tabpagewinnr(tab)                                  " Gets current window of current tab
      let buflist = tabpagebuflist(tab)                              " List of buffers associated with the windows in the current tab
      let bufnr = buflist[winnr - 1]                                 " Current buffer number
      let bufname = bufname(bufnr)                                   " Gets the name of the current buffer in the current window of the current tab
      let bufmodified = getbufvar(bufnr, "&mod")

      let s .= '%' . tab . 'T'
      let s .= (tab == tabpagenr() ? '%#TabLineSel#' : '%#TabLine#') " If this tab is the current tab...set the right highlighting
      let s .= ' ' . tab .'-'
      let s .= (bufname != '' ? ''. fnamemodify(bufname, ':t') . ' ' : 'NO NAME ')

      if bufmodified
        let s .= '[+] '
      endif
    endfor

    let s .= '%#TabLineFill#' " Blank highlighting between the tabs and the righthand close 'X'
    return s
  endfunction

  set tabline=%!MyTabs()

endif

" }}}

" STATUS LINE {{{

set laststatus=2 " Always show statusline

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
  set stl+=\ %m                         " Modified flag [+/-]
  set stl+=\ %Y                         " File type
  set stl+=\ %{&ff}                     " File format
  set stl+=\ %{&enc}                    " File encoding
  set stl+=\ %r                         " Readonly flag [RO]
  set stl+=\|
  if exists('*vundle#rc')
    set stl+=\ %{fugitive#statusline()} " Git current branch
  endif
  set stl+=\ %f                         " Relative path to file
  set stl+=%=                           " Right align following items
  set stl+=%t                           " File name
  set stl+=%{FileSize()}                " File size
  set stl+=\ \%*
  "if exists('*vundle#rc')
  "  set stl+=%#warningmsg#
  "  set stl+=%{SyntasticStatuslineFlag()}
  "  set stl+=%*
  "endif
  set stl+=%1*\ %l\/%L                  " Infos line number
  set stl+=\ \|\ %p%%                   " Percent through file
  set stl+=\ \%*

endif

" }}}

" KEY BINDINGS {{{

" Set the leader key
let mapleader = ','

" Map 'jj' to 'exit insert mode'
:imap jj <esc>

" Quickly edit/auto reload the vimrc file
nmap <leader>ev :tabedit $MYVIMRC<cr>

" Change the cwd to the directory of current file
cmap cwd cd %:p:h

" Write file using sudo
cmap w!! w !sudo tee % >/dev/null

" Commons
map <leader>w :w<cr>
map <leader>q :q<cr>

" Tab mappings
map tn :tabnext<cr>
map tp :tabprevious<cr>
map tf :tabfirst<cr>
map tl :tablast<cr>
map tc :tabclose<cr>
map tm :tabmove<cr>

nmap <leader>tn :tabnew<cr>
nmap <leader>te :tabedit<space>

" Switch between window
nmap <leader><space> <C-w>w
nmap <leader>h <C-w>h
nmap <leader>j <C-w>j
nmap <leader>k <C-w>k
nmap <leader>l <C-w>l

" Clearing highlighted searches
nmap <leader>/ :nohlsearch<cr>

" Autocomplete with Ctrl + Space
" inoremap <Nul> <C-x><C-o>

" Insert blank lines without going into insert mode
nmap go o<esc>
nmap gO O<esc>

" Toggle vim paste mode
" Prevent auto-indenting and auto-expansion when pasting from clipboard
set pastetoggle=<F9>

if has('spell')

  " Turn on spell checking en/fr
  nmap <F10>e :set spell spelllang=en<cr>
  nmap <F10>f :set spell spelllang=fr<cr>
  " Turn off spell check hightlighting
  nmap <F10>/ :set nospell<cr>

  " Spell check when writing commit logs
  autocmd filetype svn,*commit* setlocal spell textwidth=72

endif

" }}}

" PLUGINS SETUP {{{

if exists('*vundle#rc')

  " NERDTree
  let g:NERDTreeWinSize=25 " set nerdtree width
  let NERDTreeMinimalUI=1  " disable the label 'Press ? for help'
  let g:NERDTreeDirArrows=0
  let NERDTreeMouseMode=3  " single click to open any node
  " Ignore these files extensions
  let NERDTreeIgnore=[ '\.DS_Store$', '\.swp$', 'node_modules', 'bower_components' ]
  " Open NERDTree
  map <leader>n :NERDTreeToggle<cr>
  " Open directory of the current file in NERDTree
  nmap <leader>cn :NERDTree %<cr>
  " Open NERDTree on startup, when no file has been specified
  autocmd VimEnter * if !argc() | NERDTree | endif
	" Mirror NERDTree in tabs
	autocmd BufWinEnter * NERDTreeMirror
  " Highlight the selected entry in the tree
  " let NERDTreeHighlightCursorline=1
  " Highlight the selected buffer in the tree
	autocmd BufEnter * if &modifiable | NERDTreeFind | wincmd p | endif
	" Disable collapsing of directory names
	let NERDTreeCascadeSingleChildDir=1

  " CtrlP
  " Open CtrlP
  nmap <leader>p :CtrlP<cr>
  " Ignore these files extensions
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
  " Enable emmet only for html and css
  " let g:user_emmet_install_global = 0
  " autocmd FileType html,css EmmetInstall
  let g:user_emmet_expandabbr_key='<Nul>'
  " Map Emmet expand to tab key
  " imap <expr><tab> emmet#isExpandable() ? '\<C-e>' : '\<tab>'
  let g:use_emmet_complete_tag=1

  " Ultisnips
  let g:UltiSnipsExpandTrigger='<Tab>'
  let g:UltiSnipsJumpForwardTrigger='<Tab>'
  let g:UltiSnipsJumpBackwardTrigger='<C-Tab>'
  let g:UltiSnipsListSnippets='<C-l>'

  let g:UltiSnipsSnippetsDir='~/.dotfiles/vim/csnippets'
  let g:UltiSnipsSnippetDirectories=['UltiSnips', 'mysnippets']

  " Markdown
  let g:vim_markdown_folding_disabled=1

endif

" }}}
