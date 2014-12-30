" be iMproved
set nocompatible
filetype off

" ============ Presentation Section ============
syntax on
filetype plugin indent on
" Enable toolbar
set guioptions+=T
" Enable (line, column) number
set ruler
" Show cool chars for hidden ones
set listchars=tab:\|\ ,trail:␣,eol:¬
set list
"set showbreak=↪
" Autoindent code
set autoindent
set smartindent
set cindent
noremap <Tab> ==
" No tabs anymore
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
" ANSI line length
"set textwidth=80
" Bell me all night long
set visualbell
" Enable folding of code
set foldlevelstart=9999
set foldmethod=syntax
" Enable line number
set number
" Highlight current line
"if has("gui_running")
set cursorline
"autocmd FileType tex :NoMatchParen
"au FileType tex setlocal nocursorline
"endif
" Using UTF8
set fileencoding=utf-8
setglobal fileencoding=utf-8 bomb
set fileencodings=ucs-bom,utf-8,latin1
au BufNewFile,BufRead *.gradle setf groovy
" map CTRL-E to end-of-line (insert mode)
imap <C-e> <esc>$i<right>
" map CTRL-A to beginning-of-line (insert mode)
imap <C-a> <esc>0i


" ============ Behaviour Section ============
" Source the vimrc file after saving it
"autocmd bufwritepost .vimrc source $MYVIMRC
" Don't redraw while executing macros
set nolazyredraw
"Enable mouse with alt key
set mouse=a
" This makes me a guru of vim
"noremap <left> <nop>
"noremap <up> <nop>
"noremap <down> <nop>
"noremap <right> <nop>
" This make me feel a little better
command! W :w
" Biiiiiiig history
" set history=1000
" Backup dirs and other stuff
if !isdirectory("/tmp/vim_bk")
  call mkdir("/tmp/vim_bk", "p")
endif
if has('persistent_undo')
  set undodir=/tmp/vim_bk
  set undofile
  set undolevels=3000
  set undoreload=10000
endif
set backupdir=/tmp/vim_bk
set directory=/tmp/vim_bk
set backup
set noswapfile
" Search stuff
set ignorecase
set smartcase
set showmatch
" set gdefault default global
set hlsearch

" fast pane resize
if bufwinnr(1)
  map = <C-W>+
  map - <C-W>-
  map < <C-W><
  map > <C-W>>
endif

" copy to mac clipboard
set clipboard=unnamed
"map y "*y
"map p "*p
"map x "*x

" ============ Packets Section ============
" vundle packet manager
let s:bundle_path=$HOME."/.vim/bundle/"
execute "set rtp+=".s:bundle_path."Vundle.vim/"
call vundle#rc()
Bundle 'gmarik/vundle'

" AG a powerful code search engine
Bundle 'rking/ag.vim'

" Add proper end at block
"Bundle 'tpope/vim-endwise'
"Bundle 'tpope/vim-surround'

" Auto insert date in text
" Bundle 'tpope/vim-speeddating'

Bundle 'kchmck/vim-coffee-script'

" Acting on buffer and on disk
"Bundle 'tpope/vim-eunuch'

" File tree
Bundle 'scrooloose/nerdtree'
map <C-t> :NERDTreeToggle<CR>


" Buffer list
Bundle 'troydm/easybuffer.vim'

" Multiedit
Bundle 'terryma/vim-multiple-cursors'

" Smart status bar
Bundle 'bling/vim-airline'
"let g:Powerline_symbols = 'fancy'
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_branch_prefix = ''
set laststatus=2 " used to load statusbar on first window

" Show a vertical line for blocks
Bundle 'Yggdroot/indentLine'

" Show tags of current code
Bundle 'majutsushi/tagbar'

" Git tree explorer
Bundle 'tpope/vim-fugitive'
Bundle 'gregsexton/gitv'

" Comments in nerd way
Bundle 'scrooloose/nerdcommenter'
"Remap the comment toggle combination to an easier ctrl-c
map <C-c> <Leader>c<Space>

" Show merge issue
"Bundle 'sjl/splice.vim'

" Check syntax
Bundle 'scrooloose/syntastic'
" get gradle classpath
if filereadable(glob('./.vim.local'))
  so ./.vim.local
endif

" Reindent text
"Bundle 'vim-scripts/Reindent'

" I <3 solarized
if has("gui_running")
  Bundle 'altercation/vim-colors-solarized'
  colorscheme solarized
endif
"Bundle 'Lokaltog/vim-distinguished'
"colorscheme distinguished
set background=dark

"Use <tab> key to autocomplete a search keyword
Bundle 'vim-scripts/SearchComplete'

"Shell in vim
Bundle 'rosenfeld/conque-term'
"Rapid shell!
command Term ConqueTermSplit bash -l
"autocmd FileType conque_term :AcpLock

"Show automatically the completion popup
"Bundle 'vim-scripts/AutoComplPop'

" Faster completion
Bundle "Shougo/neocomplcache.vim"
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_auto_select = 1

"Tmux shared theme
" Bundle 'edkolev/tmuxline.vim'
