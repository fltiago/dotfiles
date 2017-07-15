let mapleader = " "
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" allow project specific vimrc project file
set exrc

" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

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
" Plugin 'morhetz/gruvbox'
Plugin 'https://github.com/scheakur/vim-scheakur.git'

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
Plugin 'ck3g/vim-change-hash-syntax'
Plugin 'tpope/vim-bundler'
Plugin 'kana/vim-textobj-user'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'thoughtbot/vim-rspec'

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
Plugin 'easymotion/vim-easymotion'

" ========================= Tmux ======= =====================
Plugin 'christoomey/vim-tmux-runner'
Plugin 'christoomey/vim-tmux-navigator'

" ========================= Tools ============================
Plugin 'vim-scripts/csv.vim'
Plugin 'tpope/vim-speeddating'
" Org-mode
Plugin 'jceb/vim-orgmode'

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

" Show tab number (useful for Cmd-1, Cmd-2.. mapping)
" For some reason this doesn't work as a regular set command,
" (the numbers don't show up) so I made it a VimEnter event
autocmd VimEnter * set guitablabel=%N:\ %t\ %M

" Color configurations
syntax enable
set background=dark
colorscheme solarized
" colorscheme scheakur

" show the current line
set cursorline

" show last command in bottom bar
set showcmd

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

" visual autocomplote for command menu
set wildmenu

" ================ Split map ========================

" Shortcut to vertical splits and horizontal splits
nnoremap <silent> vv <C-w>v
nnoremap <silent> ss <C-w>s

" =============== Nerdtree ==========================
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" mapping to Ctrl+N
map <C-n> :NERDTreeToggle<CR>

" set a vertical line in vim on 80 column
set colorcolumn=80

autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

" tComment
" Command-/ to toggle comments
map <C-/> :TComment<CR>
imap <C-/> <Esc>:TComment<CR>i

" Auto close html tag with Ctrl+space
:imap <C-Space> <C-X><C-O>

" Set configurations for ctags
set tags=./tags;

" Set incremented and highlight in file searches '/'
set incsearch
set hlsearch

nnoremap <leader>nh :nohlsearch<CR>

" Disable swap file
set noswapfile

" Configuration to use ruby-blocks
runtime macros/matchit.vim

" Strip trailing whitespace
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" disable unsafe commands in project specific vimrc files
set secure

" RSpec.vim mappings
" map <Leader>c :call RunCurrentSpecFile()<CR>
" map <Leader>n :call RunNearestSpec()<CR>
" map <Leader>l :call RunLastSpec()<CR>
" map <Leader>a :call RunAllSpecs()<CR>

" VTR runner commands
let g:VtrUseVtrMaps = 1
let g:VtrPercentage = 30

nnoremap <leader>va :VtrAttachToPane<cr>
nmap <C-f> :VtrSendLinesToRunner<cr>
vmap <C-g> :VtrSendLinesToRunner<cr>
nnoremap <leader>q :VtrSendCommandToRunner q<cr>

" RSpec.vim to use iterm2
let g:rspec_runner = "os_x_iterm2"
let g:rspec_command = "call VtrSendCommand('RAILS_ENV=test rspec {spec}')"

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

" fix backspace problem in vim
set backspace=2

" fix the clipboard problem
set clipboard=unnamed


" allows cursor change in tmux mode
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

set nohlsearch
