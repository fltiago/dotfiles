set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" ========================= APPEREANCE ========================
" Colorizer : highlight color codes and names 
Plugin 'chrisbra/color_highlight.git'
" Solarized Colorscheme for Vim
Plugin 'skwp/vim-colors-solarized'
" A light and configurable statusline/tabline for Vim
Plugin 'itchyny/lightline.vim'
" Retro groove color scheme for Vim.
Plugin 'morhetz/gruvbox'

" ========================== GIT ==============================
" Gist extension
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'
Plugin 'tpope/vim-fugitive'

" ========================== Project ==========================
Plugin 'scrooloose/nerdtree'

" ========================== Seacher ==========================
Plugin 'rking/ag.vim'
Plugin 'kien/ctrlp.vim'

" ========================== Ruby and Rails ===================
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rake.git'
Plugin 'vim-ruby/vim-ruby'
Plugin 'Keithbsmiley/rspec.vim'
Plugin 'skwp/vim-spec-finder'
Plugin 'ck3g/vim-change-hash-syntax'
Plugin 'tpope/vim-bundler'

" ========================= Languagues =======================
Plugin 'sheerun/vim-polyglot'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'jtratner/vim-flavored-markdown.git'
Plugin 'nelstrom/vim-markdown-preview'

" ========================= HTML =============================
Plugin 'mattn/emmet-vim'

" ========================= Improvements =====================
Plugin 'tomtom/tcomment_vim.git'
Plugin 'tpope/vim-endwise.git'
Plugin 'tpope/vim-surround.git'
Plugin 'Townk/vim-autoclose'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"

" ============= Appereance configurations ============
" Status line configuration
set laststatus=2
" Show line numbers
set number

" Set fontsize
set guifont=Inconsolata\ XL:h14,Inconsolata:h16,Monaco:h17

"tell the term has 256 colors
set t_Co=256

" Show tab number (useful for Cmd-1, Cmd-2.. mapping)
" For some reason this doesn't work as a regular set command,
" (the numbers don't show up) so I made it a VimEnter event
autocmd VimEnter * set guitablabel=%N:\ %t\ %M

set lines=60
set columns=190
"
" Color configurations
syntax enable
set background=dark
colorscheme solarized

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

" ================ Folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" ================ Completion =======================

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

"
" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ================ Split map ========================

" Navigate between splits with Ctrl + j, k, l, h
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Shortcut to vertical splits and horizontal splits
nnoremap <silent> vv <C-w>v
nnoremap <silent> ss <C-w>s

" =============== Nerdtree ==========================
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" mapping to Ctrl+N 
map <C-n> :NERDTreeToggle<CR>

" set a vertical line in vim on 80 column
:set colorcolumn=80

autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

" tComment
" Command-/ to toggle comments
map <D-/> :TComment<CR>
imap <D-/> <Esc>:TComment<CR>i

" Auto close html tag with Ctrl+space
:imap <C-Space> <C-X><C-O>

" Set configurations for ctags
set tags=./tags;

" Set incremented and highlight in file searches '/'
set incsearch
set hlsearch
