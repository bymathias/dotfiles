" vim:fdm=marker:
" ~/.vimrc
"
" VIM configuration
" Maintainer: Mathias Brouilly
" Repository: github.com/bymathias/dotfiles


set nocompatible " Vim not vi
" filetype off     " Required

" PLUGINS {{{

silent! if plug#begin('~/.vim/plugins')

  " NAVIGATION
  Plug 'scrooloose/nerdtree'

  " EDITING
  Plug 'tpope/vim-commentary'
  Plug 'Raimondi/delimitMate'
  Plug 'tpope/vim-surround'
  Plug 'Valloric/MatchTagAlways'
  Plug 'junegunn/vim-easy-align', { 'on': ['<Plug>(EasyAlign)', 'EasyAlign'] }
  Plug 'terryma/vim-expand-region'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'editorconfig/editorconfig-vim' " Require EditorConfig core
  if executable('npm')
    Plug 'csscomb/vim-csscomb'         " Require npm package 'csscomb'
  endif

  " SYNTAX
  Plug 'othree/yajs.vim'
  Plug 'othree/es.next.syntax.vim'
  Plug 'othree/javascript-libraries-syntax.vim'
  Plug 'leafgarland/typescript-vim'
  Plug 'moll/vim-node'
  Plug 'elzr/vim-json', { 'for': 'json'}
  Plug 'hail2u/vim-css3-syntax'
  Plug 'othree/html5.vim'
  Plug 'Glench/Vim-Jinja2-Syntax'
  Plug 'mustache/vim-mustache-handlebars'
  Plug 'digitaltoad/vim-pug', { 'for': 'pug' }
  Plug 'StanAngeloff/php.vim', { 'for': 'php' }
  Plug 'dsawardekar/wordpress.vim', { 'for': 'php' }
  Plug 'evanmiller/nginx-vim-syntax', { 'for': 'nginx' }
  Plug 'godlygeek/tabular' | Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
  Plug 'markcornick/vim-bats'
  Plug 'maksimr/vim-jsbeautify'

  " COMPLETION & SNIPPETS
  Plug 'mattn/webapi-vim' " Required by 'gist-vim' and 'emmet-vim'
  Plug 'AutoComplPop'
  Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
  Plug 'mattn/emmet-vim'
  Plug 'mattn/gist-vim'
  Plug 'heavenshell/vim-jsdoc'

  " CTAGS
  Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }

  " UI
  Plug 'Yggdroot/indentLine'

  " VERSION CONTROL
  Plug 'tpope/vim-fugitive'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'airblade/vim-gitgutter'

  " WRITING
  if executable('npm')
    Plug 'suan/vim-instant-markdown', { 'for': 'markdown' } " Require npm package 'instant-markdown-d'
  endif
  Plug 'junegunn/goyo.vim', { 'for': 'markdown' }

  " TMUX
  Plug 'tmux-plugins/vim-tmux'

  " ------------------------------------
  " Add plugins to &runtimepath
  call plug#end()

endif

" Check if plugin directory exists
function! HasPlugDirectory(name)
  return isdirectory(glob(g:plug_home . '/' . a:name))
endfunction

" }}}

" filetype plugin indent on " Automatically detect file types, required
syntax on

" Color Scheme {{{

if !has('gui_running')
  " Enable full-color support
  set t_Co=256
endif

" Use default colorscheme
set background=dark
colorscheme default

" }}}

" USER INTERFACE {{{

set number                     " Add line number
set cursorline                 " Highlight the current line
set ruler                      " Add info on current position
set noerrorbells vb t_vb=      " No bell or blink
set showcmd                    " Shows command or number of lines selected
set showmode                   " Shows the current mode
set backspace=indent,eol,start " Allow backspacing over everything in insert mode
set virtualedit=block          " Allow cursor to go anywhere in visual block mode

" }}}

" FOLDING {{{

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

" augroup indentation_config
"   autocmd!
"   autocmd BufNewFile,BufReadPost *.{css,js,json,html} setl shiftwidth=2 tabstop=2 softtabstop=2 expandtab
" augroup END

" }}}

" FILE ENCODING {{{

" scriptencoding utf-8
set fileencoding=utf-8
set fileformats=unix,mac,dos " Support all file format

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

" Ignore files
set wildignore+=*.png,*.jpeg,*.jpg,*.tiff
set wildignore+=*.ico,*.bmp,*.gif
" set wildignore+=*.sqlite3,*.db
" set wildignore+=*.zip,*.tar,*.tar.gz
set wildignore+=*.doc,*.docx,*.xls,*.xlsx,*.ppt,*.pptx,*.gsheet
set wildignore+=*.pages
" set wildignore+=*.pdf
set wildignore+=*.mp4,*.mov,*.m4v,*.mp3
set wildignore+=*.dmg
set wildignore+=*.sw?
set wildignore+=*.DS_Store,Icon
set wildignore+=*/.git/*,*/.svn/*,*/.hg/*
set wildignore+=*/node_modules/**
set wildignore+=*/bower_components/**

if has('autocmd')

  " Auto enable autocomplete for html, css, javascript, php..

  augroup complete_html
    autocmd!
    autocmd FileType html,markdown set omnifunc=htmlcomplete#CompleteTags
  augroup END

  augroup complete_css
    autocmd!
    autocmd FileType css set omnifunc=csscomplete#CompleteCSS
  augroup END

  augroup complete_js
    autocmd!
    autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
  augroup END

  augroup complete_php
    autocmd!
    autocmd FileType php set omnifunc=phpcomplete#CompletePHP
  augroup END

  augroup complete_xml
    autocmd!
    autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
  augroup END

  augroup complete_python
    autocmd!
    autocmd FileType python set omnifunc=pythoncomplete#Complete
  augroup END

endif

" }}}

" HISTORY, UNDO {{{

set noswapfile  " Turn off swap files
" set directory=~/.vim/swaps
set nobackup    " Turm off backup files
set nowb
" set backupdir=~/.vim/backups
set history=500 " Longer history than 20(default)

if has('persistent_undo')

  set undodir=~/.vim/undo " Set the undo directory
  set undofile            " Set undo file even when closed
  set undolevels=500      " Maximum number of changes that can be undone
  set undoreload=5000

endif

" }}}

" FILE HANDLING {{{

let g:php_htmlInStrings=1 " Highlight html syntax within strings
let g:php_sql_query=1     " Highlight sql queries
"let php_folding=1     " Enable folding for classes and functions

if has('autocmd')

  augroup filetype_rss
    autocmd!
    " Treat .rss files as xml
    autocmd BufNewFile,BufRead *.rss set ft=xml
  augroup END

  augroup filetype_txt
    autocmd!
    " These should be .txt file
    autocmd BufNewFile,BufRead *.{txt,log},README,LICENSE set ft=text
  augroup END

  augroup filetype_markdown
    autocmd!
    " These are markdown file
    autocmd BufNewFile,BufRead *.{markdown,md,mkd} set ft=markdown
  augroup END

  augroup filetype_nginx
    autocmd!
    " Adjust the path to your nginx config, if it is different than '/etc/nginx'
    autocmd BufNewFile,BufRead /opt/nginx/{conf,sites-available}/* set ft=nginx
  augroup END

endif

" }}}

" COMMENTS {{{

if has('autocmd')

  augroup comment_config
    autocmd!
    " Disable automatic comment insertion
    autocmd FileType * setl formatoptions-=c formatoptions-=r formatoptions-=o
    " Comments used to indicate folds for vim files
    autocmd FileType vim setl foldenable foldmethod=marker
  augroup END

endif

" }}}

" TABS {{{

" Based on: github.com/mkitt/tabline.vim

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
  set stl+=\ %f                         " Relative path to file
  set stl+=%=                           " Right align following items
  silent! if HasPlugDirectory('vim-fugitive')
    set stl+=\ %{fugitive#statusline()} " Git current branch
  endif
  set stl+=\ \%*
  set stl+=%t                           " File name
  set stl+=%{FileSize()}                " File size
  set stl+=\ \%*
  set stl+=%1*\ %l\/%L                  " Infos line number
  set stl+=\ \|\ %p%%                   " Percent through file
  set stl+=\ \%*

endif

" }}}

" KEY BINDINGS {{{

" Set the leader key
let g:mapleader=','
let g:maplocalleader=','

" Map 'jj' to 'exit insert mode'
:imap jj <esc>

" Quickly edit the .vimrc file in a new tab
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

" Search and replace the word under the cursor
nmap <leader>* :%s/\<<C-r><C-w>\>//<Left>

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
  augroup spell_config
    autocmd!
    autocmd filetype svn,*commit* setlocal spell textwidth=72
  augroup END

endif

" Escape/Unescape of HTML entities
function! HtmlEscape()
  silent s/&/\&amp;/eg
  silent s/</\&lt;/eg
  silent s/>/\&gt;/eg
endfunction

function! HtmlUnEscape()
  silent s/&lt;/</eg
  silent s/&gt;/>/eg
  silent s/&amp;/\&/eg
endfunction

noremap <leader>he :call HtmlEscape()<cr>
noremap <leader>hue :call HtmlUnEscape()<cr>

" }}}

" VIMRC {{{

if has('autocmd')

  " Auto reload .vimrc
  augroup vimrc_config
    autocmd!
    autocmd BufWritepost .vimrc source $MYVIMRC
  augroup END

endif

" }}}

" PLUGINS SETTINGS {{{

" NAVIGATION
" ---------------------------------- "

" nerdtree {{{
silent! if HasPlugDirectory('nerdtree')

  let g:NERDTreeMinimalUI=1 " disable the label 'Press ? for help'
  let g:NERDTreeMouseMode=3 " single click to open any node
  let g:NERDTreeWinSize=25  " set nerdtree width
  let g:NERDTreeDirArrows=0
  " Ignore these files extensions
  let g:NERDTreeIgnore=[ '\.DS_Store$', '\.swp$', 'node_modules', 'bower_components' ]

  " Open NERDTree
  map <leader>n :NERDTreeToggle<cr>
  " Open directory of the current file in NERDTree
  nmap <leader>cn :NERDTree %<cr>

  augroup nerdtree_config
    autocmd!
    " Open NERDTree on startup, when no file has been specified
    autocmd VimEnter * if !argc() | NERDTree | endif
    " Highlight the selected buffer in the tree
    " autocmd BufEnter * if &modifiable | NERDTreeFind | wincmd p | endif
  augroup END

endif
" }}}

" EDITING
" ---------------------------------- "

" vim-commentary {{{
silent! if HasPlugDirectory('vim-commentary')

  " Add jinja comment support
  augroup jinja_comment
    autocmd!
    autocmd FileType jinja setlocal commentstring={#\ %s\ #}
  augroup END

  " If the filetype is not supported, fallback to '#'
  silent! if empty(&commentstring) | setlocal commentstring=#\ %s | endif

endif
" }}}

" MatchTagAlways {{{
silent! if HasPlugDirectory('MatchTagAlways')

  let g:mta_use_matchparen_group=0
  let g:mta_set_default_matchtag_color=0

  " Colors match 'kivabien' theme
  hi MatchTag ctermfg=227 ctermbg=234

endif
" }}}

" vim-easy-align {{{
silent! if HasPlugDirectory('vim-easy-align')

  vnoremap <silent> <Enter> :EasyAlign<cr>

endif
" }}}

" SYNTAX
" ---------------------------------- "

" javascript-libraries-syntax.vim {{{
silent! if HasPlugDirectory('javascript-libraries-syntax.vim')

  " Setup used libraries
  let g:used_javascript_libs = 'jquery, underscore, backbone, angularjs, react, handlebars, vue'

endif
" }}}

" vim-markdown {{{
silent! if HasPlugDirectory('vim-markdown')

  let g:vim_markdown_folding_disabled=1 " Disable folding
  let g:vim_markdown_frontmatter=1      " Highlight YAML front matter as used by Jekyll or Hugo
  let g:vim_markdown_json_frontmatter=1 " JSON syntax highlight requires vim-json

  set conceallevel=2                    " Enable Vim's standard conceal configuration

endif
" }}}

" vim-jsbeautify {{{
silent! if HasPlugDirectory('vim-jsbeautify')

  nmap <leader>jb :call JsBeautify()<cr>

endif
" }}}

" COMPLETION & SNIPPETS
" ---------------------------------- "

" ultisnips {{{
silent! if HasPlugDirectory('ultisnips')

  let g:UltiSnipsExpandTrigger='<Tab>'
  let g:UltiSnipsJumpForwardTrigger='<Tab>'
  let g:UltiSnipsJumpBackwardTrigger='<s-Tab>'
  let g:UltiSnipsListSnippets='<C-L>'

  let g:UltiSnipsSnippetsDir='~/.vim/csnippets'
  let g:UltiSnipsSnippetDirectories=['UltiSnips', 'csnippets']

endif
" }}}

" emmet-vim {{{
silent! if HasPlugDirectory('emmet-vim')

  " let g:user_emmet_leader_key='<C-e>'
  let g:user_emmet_expandabbr_key='<Nul>'
  let g:use_emmet_complete_tag=1
  " Enable just for html/hbs/css
  let g:user_emmet_install_global=0

  augroup emmet_config
    autocmd!
    autocmd FileType html,hbs,jinja,css EmmetInstall
  augroup END

endif
" }}}

" gist-vim {{{
silent! if HasPlugDirectory('gist-vim')

  " Open browser after the post
  let g:gist_open_browser_after_post=1

  " Copy the gist code
  if has('mac')
    let g:gist_clip_command='pbcopy'
  elseif has('unix')
    let g:gist_clip_command='xclip -selection clipboard'
  endif

endif
" }}}

" CTAGS
" ---------------------------------- "

" tagbar {{{
silent! if HasPlugDirectory('tagbar')

  " Toggle Tagbar window
  nmap <F8> :TagbarToggle<cr>

endif
" }}}

" UI
" ---------------------------------- "

" indentLine {{{
silent! if HasPlugDirectory('indentLine')

  let g:indentLine_color_term = 232
  let g:indentLine_concealcursor = 'nvc'  " Cursor lines behavior
  let g:indentLine_leadingSpaceChar = '·' " Character to show for leading spaces
  let g:indentLine_faster=1               " Better performance
  " Toggle IndentLines key
  nmap <leader>il :IndentLinesToggle<cr>

endif
" }}}

" VERSION CONTROL
" ---------------------------------- "

" vim-fugitive {{{
" silent! if HasPlugDirectory('vim-fugitive')

"   nnoremap <silent> <Leader>gs :Gstatus<CR>
"   nnoremap <silent> <Leader>gd :Gdiff<CR>
"   nnoremap <silent> <Leader>gc :Gcommit<CR>
"   nnoremap <silent> <Leader>gb :Gblame<CR>
"   nnoremap <silent> <Leader>gl :Glog<CR>
"   nnoremap <silent> <Leader>gp :Git push<CR>
"   nnoremap <silent> <Leader>gw :Gwrite<CR>
"   nnoremap <silent> <Leader>gr :Gremove<CR>

"   "autocmd BufReadPost fugitive://* set bufhidden=delete

" endif
" }}}

" nerdtree-git-plugin {{{
" silent! if HasPlugDirectory('nerdtree-git-plugin')

"   let g:NERDTreeIndicatorMapCustom = {
" 	  \ 'Modified'  : '✹',
"     \ 'Staged'    : '✚',
"     \ 'Untracked' : '✭',
"     \ 'Renamed'   : '➜',
"     \ 'Unmerged'  : '═',
"     \ 'Deleted'   : '✖',
"     \ 'Dirty'     : '✗',
"     \ 'Clean'     : '✔︎',
"     \ 'Unknown'   : '?'
"     \ }

" endif
" }}}

" WRITING
" ---------------------------------- "

" goyo.vim {{{
silent! if HasPlugDirectory('goyo.vim')

  let g:goyo_width='120'
  nnoremap <Leader>G :Goyo<cr>

endif
" }}}

" }}}
