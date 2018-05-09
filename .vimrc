" vim: ft=vim sw=2 sts=2 fdm=marker
"
" .vimrc --- Entry file for vim
"
" Maintainer: Mathias Brouilly
" Repository: github.com/bymathias/dotfiles
" License: MIT

" Use Vim settings, rather than Vi settings (much better!)
" This must be first, because it changes other options as a side effect
if &compatible
  set nocompatible
endif

" Define the entire vimrc encoding
scriptencoding utf-8

" -- PLUGGED Initialize -----------------------------------------------{{{1

silent! if plug#begin('~/.vim/plugged')

  " ---- Syntax ---------------------{{{2

  Plug 'pangloss/vim-javascript'
  Plug 'elzr/vim-json', { 'for': 'json'}
  Plug 'hail2u/vim-css3-syntax'
  Plug 'cakebaker/scss-syntax.vim'
  Plug 'othree/html5.vim'
  Plug 'mustache/vim-mustache-handlebars'
  Plug 'posva/vim-vue',
  Plug 'StanAngeloff/php.vim', { 'for': 'php' }
  Plug 'chr4/nginx.vim'
  Plug 'tpope/vim-git'
  Plug 'tmux-plugins/vim-tmux'
  Plug 'godlygeek/tabular' | Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }

  " ---- Editing/Helpers ---------------------{{{2

  Plug 'editorconfig/editorconfig-vim', { 'do': 'sudo apt -y install editorconfig' }
  Plug 'Valloric/MatchTagAlways'
  Plug 'Raimondi/delimitMate'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-surround'
  Plug 'terryma/vim-expand-region'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'junegunn/vim-easy-align', { 'on': ['<Plug>(EasyAlign)', 'EasyAlign'] }
  Plug 'maksimr/vim-jsbeautify'
  if executable('npm')
    Plug 'csscomb/vim-csscomb', { 'do': 'npm i -g csscomb' }
  endif
  Plug 'majutsushi/tagbar', {
		\ 'do': 'sudo apt install -y exuberant-ctags',
		\ 'on': 'TagbarToggle'
		\ }

  " ---- Completion ---------------------{{{2

  if executable('npm')
    Plug 'maralla/completor.vim', { 'do': 'make js' }
    Plug 'ternjs/tern_for_vim', { 'do': 'npm i' }
  else
    Plug 'vim-scripts/AutoComplPop'
  endif
  Plug 'othree/csscomplete.vim'

  " ---- Snippets ---------------------{{{2

  Plug 'mattn/webapi-vim' " Required by 'gist-vim' and 'emmet-vim'
  Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
  Plug 'mattn/emmet-vim'
  Plug 'mattn/gist-vim', { 'do': 'sudo apt -y install xclip' }

  " ---- Navigation ---------------------{{{2

  Plug 'scrooloose/nerdtree'

  " ---- User Interface ---------------------{{{2

  Plug 'itchyny/lightline.vim'
  Plug 'rakr/vim-one'

  " ---- Version control ---------------------{{{2

  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'
  Plug 'Xuyuanp/nerdtree-git-plugin'

  " ---- Writing ---------------------{{{2

  if executable('npm')
    Plug 'suan/vim-instant-markdown', {
      \ 'do': 'npm i -g instant-markdown-d && sudo apt -y install xdg-utils',
      \ 'for': 'markdown'
      \ }
  endif
  Plug 'junegunn/goyo.vim', { 'for': 'markdown' }

  " }}}2

  " Add plugins to &runtimepath
  " Automatically executes `filetype plugin indent on` and `syntax enable`.
  " see https://github.com/junegunn/vim-plug#usage
  call plug#end()
endif

" ---- g:plug.is_installed() ---------------------{{{2

" Check if plugin is installed
let g:plug = { 'plugs': get(g:, 'plugs', {}) }
function! g:plug.is_installed(name)
  return has_key(self.plugs, a:name) ? isdirectory(self.plugs[a:name].dir) : 0
endfunction

" }}}2

" }}}1

if has('autocmd')
  " Load plugins according to detected filetype
  filetype plugin indent on
endif

if has('syntax') && !exists('g:syntax_on')
  " Enable syntax highlighting
  syntax enable
endif

" -- GENERIC Settings -----------------------------------------------{{{1

" ---- Encoding ---------------------{{{2

set encoding=utf8            " Sets utf8 as standard encoding and en_US as the standard language
set fileencoding=utf-8       " Sets the character encoding for the file of this buffer
set fileformats=unix,mac,dos " Support all formats, default to unix

" ---- Read/Write ---------------------{{{2

set autoread    " Auto reload externally changed files
set noautowrite " Do not auto write
set modifiable  " Makes buffer modifiable

set wrap      " Wrap lines longer than the width of the window
set linebreak " Do not wrap text in the middle of a word
set nolist
set textwidth=0 " Disable max width of text inserted
set formatoptions+=cql

" ---- Indentation ---------------------{{{2

set expandtab      " In Insert mode: Use the appropriate number of spaces to insert a <Tab>
set autoindent     " Copy indent from current line when starting a new line
set tabstop=2      " Number of spaces that a <Tab> in the file counts for
set softtabstop=2  " Number of spaces that a <Tab> counts for while performing editing
set shiftwidth=2   " Number of spaces to use for each step of (auto)indent
set shiftround     " Indents to next multiple of 'shiftwidth'
set smarttab       " <Tab> in front of a line inserts blanks according to 'shiftwidth'
set smartindent    " Do smart autoindenting when starting a new line
set preserveindent " When changing the indent of the current line,
                   " preserve as much of the indent structure as possible

" ---- Folding ---------------------{{{2

set nofoldenable      " Switch off folding
set foldmethod=marker " Markers are used to specify folds
set foldnestmax=10    " Max fold nesting

"let php_folding=1 " Enable folding for classes and functions

" ---- Motion ---------------------{{{2

set backspace=indent,eol,start " Allow backspacing over everything in insert mode
set virtualedit=block          " Allow cursor to go anywhere in visual block mode

set scrolljump=6 " Jump 6 line when running out of screen
set scrolloff=6  " Indicate jump out of screen 6 lines before end of screen

"set sidescroll=5
"set listchars+=precedes:<,extends:>

" ---- Search ---------------------{{{2

set hlsearch   " Enable search highlighting
set incsearch  " Incrementally match the search
set ignorecase " Make searches case insensitive
set smartcase  " Try to be smart about cases
set nowrapscan " Stop searching at end of file

" Max memory to use for pattern matching
set maxmempattern=20000

" ---- History ---------------------{{{2

set history=500 " Longer history than 20(default)

if has('persistent_undo')
  set undodir=$HOME/.vim/files/undo " Set the undo directory
  set undofile                      " Set undo file even when closed
  set undolevels=500                " Maximum number of changes that can be undone
  set undoreload=5000
endif

if has('viminfo')
  " Store history infos such as cli, search..
  set viminfo='100,n$HOME/.vim/files/info/viminfo'
endif

" ---- Backup ---------------------{{{2

set noswapfile " Turn off swap files
" set directory=$HOME/files/swap//

set nobackup   " Turm off backup files
set nowb       " Backup before overwriting a file
" set backupdir=$HOME/files/backup

" ---- Filetype ---------------------{{{2

if has('autocmd')
  augroup filetype_rss
    autocmd!
    autocmd BufNewFile,BufRead *.rss set ft=xml
  augroup END

  augroup filetype_txt
    autocmd!
    autocmd BufNewFile,BufRead *.{txt,log},README,LICENSE set ft=text
  augroup END

  augroup filetype_sass
    autocmd!
    autocmd BufNewFile,BufRead *.scss set ft=scss.css
  augroup END

  augroup filetype_markdown
    autocmd!
    autocmd BufNewFile,BufRead *.{markdown,md,mkd} set ft=markdown
  augroup END

  augroup filetype_nginx
    autocmd!
    autocmd BufNewFile,BufRead /opt/nginx/{conf,sites-available}/* set ft=nginx
  augroup END
endif

" ---- Ignore files ---------------------{{{2

set wildignore+=*.png,*.jpeg,*.jpg,*.tiff
set wildignore+=*.ico,*.bmp,*.gif
set wildignore+=*.sqlite3,*.db
set wildignore+=*.zip,*.tar,*.tar.gz
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
set wildignore+=*package-lock.json

" ---- Completion ---------------------{{{2

set wildmenu                   " Better command line completion
set wildmode=list:longest,full " Completion mode used

" set complete-=i " Don't pollute the completion results
" set completeopt-=longest
" set completeopt+=menuone
" set completeopt-=menu
" if &completeopt !~# 'noinsert\|noselect'
"   set completeopt+=noselect
" endif

set showfulltag " Show the full tag when completing
                " Doesn't work well with 'longest' in 'completeopt'

set omnifunc=syntaxcomplete#Complete

if has('autocmd')
  " Auto enable autocomplete for html, css, javascript, php..
  augroup complete_html
    autocmd!
    autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
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

" ---- Comment ---------------------{{{2

if has('autocmd')
  augroup comment_config
    autocmd!
    " Disable automatic comment insertion
    autocmd FileType * setl formatoptions-=c formatoptions-=r formatoptions-=o
    " Comments used to indicate folds for vim files
    autocmd FileType vim setl foldenable foldmethod=marker
  augroup END
endif

" ---- Color ---------------------{{{2

" Ensure the background is correctly handled in tmux
" see https://sunaku.github.io/vim-256color-bce.html
if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

" If you have vim 7
if !has('gui_running')
  " Enable full-color support
  set t_Co=256
endif

" If you have vim >=8.0 or Neovim >= 0.1.5
if has('termguicolors')
  set termguicolors
  " Set Vim-specific sequences for RGB colors
  "set t_8f=x27[38;2;%lu;%lu;%lum
  "set t_8b=x27[48;2;%lu;%lu;%lum
endif

" Set 'vim-one' as colorscheme, otherwise fallback
" to default color scheme 'wombat256mod' modified or 'jellybeans'
try
  colorscheme one
  " Background has to be called after setting the colorscheme
  " see https://github.com/rakr/vim-one/issues/21
  set background=dark " for the dark version
  "set background=light " for the light version

  " Customize the line number background
  call one#highlight('LineNr', '4b5263', '222222', 'none')
  call one#highlight('VertSplit', '2c323c', '2c323c', 'none')
  call one#highlight('Folded', '828997', '2c323c', 'none')
  call one#highlight('SignColumn', '4b5263', '222222', 'none')
catch
  "set termguicolors!
  set background=dark
  colorscheme jellybeans
endtry

" ---- UI ---------------------{{{2

set number     " Display line number
set cursorline " Highlight the line of the cursor
set showmatch  " Highlight matching [{()}]

let g:php_htmlInStrings=1 " Highlight html syntax within strings
let g:php_sql_query=1     " Highlight sql queries

set showmode              " Show '--INSERT--', disabled if lightline.vim is loaded
set showcmd               " Show (partial) command in the last line of the screen
set noerrorbells vb t_vb= " No bell or blink
set shortmess=atI         " Don't show intro messages

set splitright " When splitting vertically, split to the right
set splitbelow " When splitting horizontally, split below

set ruler " Show the line and column of the cursor position
          " in statusline otherwise in the last line of the screen
          " See 'set rulerformat' to determine the content of the ruler

if has('autocmd')
  " Always show the sign column
  set signcolumn=yes

  augroup ui_config
    autocmd!
    " Don't show the sign column in NERDTree and Tagbar
    autocmd FileType tagbar,nerdtree setlocal signcolumn=no
  augroup END
endif

" ---- Statusline ---------------------{{{2

set laststatus=2 " Always show statusline

" Default statusline layout
if has('statusline')
  set statusline=
  set stl+=\ %m          " Modified flag [+/-]
  set stl+=\ %Y          " File type
  set stl+=\ \[%{&ff}\]  " File format
  set stl+=\ %{&enc}     " File encoding
  set stl+=\ %r          " Readonly flag [RO]
  set stl+=\=>
  set stl+=\ %f          " Relative path to file
  set stl+=%=            " Right align following items
  set stl+=\ \%*
  set stl+=%t            " File name
  set stl+=%{FileSize()} " File size
  set stl+=\ \%*
  set stl+=%1*\ %l\/%L   " Infos line number
  set stl+=\ \-\ %p%%    " Percent through file
  set stl+=\ \%*
endif

" ---- Tabline ---------------------{{{2

set showtabline=1

if exists('+showtabline')
  set tabline=%!DefaultTabs()
endif

" ---- Window ---------------------{{{2

set title          " Show Window/Terminal title
set titlestring=%t " Show filename

if has('gui_running')
  set guioptions-=T " Hide toolbar
  set guioptions-=m " Hide menu bar
endif

" ---- Mouse ---------------------{{{2

set mouse=a " Enable extended mouse for a(ll) modes

if exists('$TMUX')
  set ttymouse=xterm2 " Support extended mouse mode in Tmux
endif

" ---- Keyboard ---------------------{{{2

set ttyfast     " Improve redrawing
set ttyscroll=3 " Maximum number of lines to scroll the screen
set lazyredraw  " Avoid scrolling problems

set notimeout      " Speed up response to Esc key
set ttimeout
set timeoutlen=400 " Waiting period for another key to be pressed (milliseconds)

" ---- Key bindings ---------------------{{{2

" Set the leader key
let g:mapleader=','
let g:maplocalleader=','

" Map 'jj' to 'exit insert mode'
:imap jj <esc>

" Change the cwd to the directory of current file
cmap cwd cd %:p:h

" Write file using sudo
cmap w!! w !sudo tee % >/dev/null

" Quick save and quit shortcuts
map <leader>w :w<cr>
map <leader>q :q<cr>

" Stop using arrow keys!
" noremap <Up> <Nop>
" noremap <Down> <Nop>
" noremap <Left> <Nop>
" noremap <Right> <Nop>

" Switch between window
nmap <leader><space> <C-w>w
nmap <leader>h <C-w>h
nmap <leader>j <C-w>j
nmap <leader>k <C-w>k
nmap <leader>l <C-w>l

" Tab mappings
map tn :tabnext<cr>
map tp :tabprevious<cr>
map tf :tabfirst<cr>
map tl :tablast<cr>
map tc :tabclose<cr>
map tm :tabmove<cr>

nmap <leader>tn :tabnew<cr>
nmap <leader>te :tabedit<space>

" " Search and replace the word under the cursor
nmap <leader>* :%s/\<<C-r><C-w>\>//<Left>
" " Clearing highlighted searches
nmap <leader>/ :nohlsearch<cr>

" Insert blank lines without going into insert mode
nmap go o<esc>
nmap gO O<esc>

" ---- Clipboard ---------------------{{{2

" Toggle vim paste mode
" Prevent auto-indenting and auto-expansion when pasting from clipboard
set pastetoggle=<F9>

" ---- Spelling ---------------------{{{2

if has('spell')
  " Turn on spell checking en/fr
  nmap <F10>e :set spell spelllang=en<cr>
  nmap <F10>f :set spell spelllang=fr<cr>
  " Turn off spell check hightlighting
  nmap <F10>/ :set nospell<cr>

  if has('autocmd')
    augroup spell_config
      autocmd!
      " Spell check when writing commit logs
      autocmd filetype svn,*commit* setlocal spell textwidth=72
      " And markdown file
      autocmd FileType markdown setlocal spell
    augroup END
  endif
endif

" ---- Custom functions ---------------------{{{2

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

" ---- .vimrc ---------------------{{{2

" Quickly edit the .vimrc file in a new tab
nmap <leader>ev :tabedit $MYVIMRC<cr>

if has('autocmd')
  " Auto reload .vimrc when saved
  augroup vimrc_config
    autocmd!
    autocmd BufWritepost .vimrc source $MYVIMRC
  augroup END
endif

" Source local configuration if exists
if filereadable(expand("$HOME/.vimrc.local"))
  source ${HOME}/.vimrc.local
endif

" }}}2

" }}}1

" -- HELPER Functions -----------------------------------------------{{{1

" ---- FileSize() ---------------------{{{2

" Get file size (used in the default statusline)
function! FileSize()
  let bytes = getfsize(expand('%:p'))
  if bytes <= 0 | return '' | endif
  if bytes < 1024
    return ' ' . bytes . 'B'
  else
    return ' ' . (bytes / 1024) . 'K'
  endif
endfunction

" ---- DefaultTabs() ---------------------{{{2

" Default tabline layout, based on: github.com/mkitt/tabline.vim
function! DefaultTabs()
  let s = ''
  for i in range(tabpagenr('$'))
    let tab = i + 1
    let winnr = tabpagewinnr(tab)     " Gets current window of current tab
    let buflist = tabpagebuflist(tab) " List of buffers associated with the windows in the current tab
    let bufnr = buflist[winnr - 1]    " Current buffer number
    let bufname = bufname(bufnr)      " Gets the name of the current buffer in the current window of the current tab
    let bufmodified = getbufvar(bufnr, "&mod")
    let s .= '%' . tab . 'T'
    " If this tab is the current tab...set the right highlighting
    let s .= (tab == tabpagenr() ? '%#TabLineSel#' : '%#TabLine#')
    let s .= ' [' . tab .']-'
    let s .= (bufname != '' ? ''. fnamemodify(bufname, ':t') . ' ' : 'NO NAME ')
    if bufmodified
      let s .= '[+] '
    endif
  endfor
  let s .= '%#TabLineFill#' " Blank highlighting between the tabs and the righthand close 'X'
  return s
endfunction

" }}}2

" }}}1

" -- PLUGGED Settings -----------------------------------------------{{{1

" ---- vim-markdown ---------------------{{{2
" ref: https://github.com/plasticboy/vim-markdown

silent! if g:plug.is_installed('vim-markdown')
	let g:vim_markdown_folding_disabled=1 " Disable folding
	let g:vim_markdown_frontmatter=1      " Highlight YAML front matter as used by Jekyll or Hugo
	let g:vim_markdown_json_frontmatter=1 " JSON syntax highlight requires vim-json

	set conceallevel=2 " Enable Vim's standard conceal configuration
endif

" ---- editorconfig-vim ---------------------{{{2
" ref: https://github.com/editorconfig/editorconfig-vim

silent! if g:plug.is_installed('editorconfig-vim')
" Ensure that this plugin works well with Tim Pope's fugitive
" and avoid loading EditorConfig for any remote files over ssh
  let g:EditorConfig_exclude_patterns = [
    \ 'fugitive://.*',
    \ 'scp://.*'
    \ ]
endif

" ---- vim-commentary ---------------------{{{2
" ref: https://github.com/tpope/vim-commentary

silent! if g:plug.is_installed('vim-commentary')
  " If the filetype is not supported, fallback to '#'
  silent! if empty(&commentstring) | setlocal commentstring=#\ %s | endif
endif

" ---- vim-easy-align ---------------------{{{2
" ref: https://github.com/junegunn/vim-easy-align

silent! if g:plug.is_installed('vim-easy-align')
  " Quick align shortcut
  vnoremap <silent> <Enter> :EasyAlign<cr>
endif

" ---- vim-jsbeautify ---------------------{{{2
" ref: https://github.com/maksimr/vim-jsbeautify

silent! if g:plug.is_installed('vim-jsbeautify')
  " Beautify assets
  nmap <leader>jb :call JsBeautify()<cr>
endif

" ---- vim-csscomb ---------------------{{{2
" ref: https://github.com/csscomb/vim-csscomb

silent! if g:plug.is_installed('vim-csscomb')
  augroup csscomb_config
    autocmd!
    " Map bc to run CSScomb. bc stands for beautify css
    autocmd FileType scss,css noremap <buffer> <leader>bc :CSScomb<cr>
    " Automatically comb your CSS on save
    "autocmd BufWritePre,FileWritePre *.css,*.less,*.scss,*.sass silent! :CSScomb
  augroup END
endif

" ---- tagbar ---------------------{{{2
" ref: https://github.com/majutsushi/tagbar

silent! if g:plug.is_installed('tagbar')
	" Toggle Tagbar window
	nmap <F8> :TagbarToggle<cr>
endif

" ---- completor.vim ---------------------{{{2
" ref: https://github.com/maralla/completor.vim

silent! if g:plug.is_installed('completor.vim')
  " let g:completor_node_binary = '/usr/bin/node'

  " Other omni completions completor
  let g:completor_css_omni_trigger = '([\w-]+|@[\w-]*|[\w-]+:\s*[\w-]*)$'
  let g:completor_scss_omni_trigger = '([\w-]+|@[\w-]*|[\w-]+:\s*[\w-]*)$'

  " Use Tab to trigger completion (disable auto trigger)
  "let g:completor_auto_trigger = 0
  "inoremap <expr> <Tab> pumvisible() ? "<C-N>" : "<C-R>=completor#do('complete')<CR>"
endif

" ---- tern_for_vim ---------------------{{{2
" ref: https://github.com/ternjs/tern_for_vim

silent! if g:plug.is_installed('tern_for_vim')

  augroup tern_config
    autocmd!
    autocmd FileType javascript,jsx setl omnifunc=tern#Complete
  augroup END
endif

" ---- ultisnips ---------------------{{{2
" ref: https://github.com/SirVer/ultisnips

silent! if g:plug.is_installed('ultisnips')
	let g:UltiSnipsExpandTrigger='<Tab>'
	let g:UltiSnipsJumpForwardTrigger='<Tab>'
	let g:UltiSnipsJumpBackwardTrigger='<s-Tab>'
	let g:UltiSnipsListSnippets='<C-L>'

	" let g:UltiSnipsSnippetsDir='~/.vim/csnippets'
	let g:UltiSnipsSnippetDirectories=['UltiSnips', 'csnippets']
endif

" ---- emmet-vim ---------------------{{{2
" ref: https://github.com/mattn/emmet-vim

silent! if g:plug.is_installed('emmet-vim')
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

" ---- gist-vim ---------------------{{{2
" ref: https://github.com/mattn/gist-vim

silent! if g:plug.is_installed('gist-vim')
  " Open browser after the post
  let g:gist_open_browser_after_post=1

  " Copy the gist code
  let g:gist_clip_command='xclip -selection clipboard'
endif

" ---- vim-gitgutter ---------------------{{{2
" ref: https://github.com/airblade/vim-gitgutter

silent! if g:plug.is_installed('vim-gitgutter')
  " Remove styling
  let g:gitgutter_override_sign_column_highlight = 0
endif

" ---- nerdtree ---------------------{{{2
" ref: https://github.com/scrooloose/nerdtree

silent! if g:plug.is_installed('nerdtree')
  let g:NERDTreeMinimalUI=1 " Disable the label 'Press ? for help'
  let g:NERDTreeWinSize=25  " Set nerdtree width

  " Change default arrows
  let g:NERDTreeDirArrows=0
  let g:NERDTreeDirArrowExpandable = '+'
  let g:NERDTreeDirArrowCollapsible = '-'

  " Ignore these directories and files
  let g:NERDTreeIgnore=[
    \ '\.DS_Store$',
    \ '\.swp$',
    \ 'node_modules',
    \ 'bower_components',
    \ 'package-lock.json'
    \ ]

  " Toggle NERDTree
  map <leader>n :NERDTreeToggle<cr>
  " Focus on opened file
  nmap <leader>fn :NERDTreeFind<cr>
  " Open directory of the current file in NERDTree
  nmap <leader>cn :NERDTree %<cr>

  augroup nerdtree_config
    autocmd!
    " Open a NERDTree automatically when vim starts up if no files were specified
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

    " Close vim if the only window left open is a NERDTree
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
  augroup END
endif

" ---- lightline.vim ---------------------{{{2
" ref: https://github.com/itchyny/lightline.vim

silent! if g:plug.is_installed('lightline.vim')
  set noshowmode " Shown in statusline

  " Select statusbar theme
  let g:lightline = {
    \ 'colorscheme': 'one',
    \ }
endif

" ---- vim-instant-markdown ---------------------{{{2
" ref: https://github.com/suan/vim-instant-markdown

silent! if g:plug.is_installed('vim-instant-markdown')
  " Disable auto start
  let g:instant_markdown_autostart = 0
endif

" ---- goyo.vim ---------------------{{{2
" ref: https://github.com/junegunn/goyo.vim

silent! if g:plug.is_installed('goyo.vim')
  let g:goyo_width='100'
  nnoremap <Leader>G :Goyo<cr>
endif

" }}}2

" }}}1
