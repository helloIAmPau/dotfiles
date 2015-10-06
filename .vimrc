" be iMproved
set nocompatible
filetype off

" ============ Presentation Section ============
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

let g:tex_conceal = ""


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
" Prettyfy plugin
fun! Pretty() "{{{
  if(&ft=='json')
    :%!python -m json.tool
  elseif(&ft=='javascript')
    :call JsBeautify()
  endif
endfunction "}}}
cabbrev p :call Pretty()
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

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/vundle'

" AG a powerful code search engine
Plugin 'rking/ag.vim'

" Add proper end at block
"Plugin 'tpope/vim-endwise'
"Plugin 'tpope/vim-surround'

" Auto insert date in text
" Plugin 'tpope/vim-speeddating'

Plugin 'kchmck/vim-coffee-script'

" Acting on buffer and on disk
"Plugin 'tpope/vim-eunuch'

" File tree
Plugin 'scrooloose/nerdtree'
map <C-t> :NERDTreeToggle<CR>


" Buffer list
Plugin 'troydm/easybuffer.vim'

" Multiedit
Plugin 'terryma/vim-multiple-cursors'

" Smart status bar
Plugin 'bling/vim-airline'
"let g:Powerline_symbols = 'fancy'
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_branch_prefix = ''
set laststatus=2 " used to load statusbar on first window

" Show a vertical line for blocks
Plugin 'Yggdroot/indentLine'

" Show tags of current code
Plugin 'majutsushi/tagbar'

" Git tree explorer
Plugin 'tpope/vim-fugitive'
Plugin 'gregsexton/gitv'

" Comments in nerd way
Plugin 'scrooloose/nerdcommenter'
"Remap the comment toggle combination to an easier ctrl-c
map <C-c> <Leader>c<Space>

" Show merge issue
"Plugin 'sjl/splice.vim'

" Check syntax
Plugin 'scrooloose/syntastic'
" get gradle classpath
if filereadable(glob('./.vim.local'))
  so ./.vim.local
endif

" Reindent text
"Plugin 'vim-scripts/Reindent'

" I <3 solarized
if has("gui_running")
  Plugin 'altercation/vim-colors-solarized'
  colorscheme solarized
endif
"Plugin 'Lokaltog/vim-distinguished'
"colorscheme distinguished
set background=dark

"Use <tab> key to autocomplete a search keyword
Plugin 'vim-scripts/SearchComplete'

"Shell in vim
Plugin 'rosenfeld/conque-term'
"Rapid shell!
command Term ConqueTermSplit bash -l
"autocmd FileType conque_term :AcpLock

"Show automatically the completion popup
"Plugin 'vim-scripts/AutoComplPop'

" Faster completion
Plugin 'Shougo/neocomplcache.vim'
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_auto_select = 1

"Tmux shared theme
" Plugin 'edkolev/tmuxline.vim'

"Snippets
Plugin 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"

Plugin 'maksimr/vim-jsbeautify'
Plugin 'einars/js-beautify'

call vundle#end() 

syntax on
filetype plugin indent on
