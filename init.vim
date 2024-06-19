call plug#begin()

" ========================= APPEREANCE ========================
Plug 'vim-airline/vim-airline' " fancy statusline
Plug 'vim-airline/vim-airline-themes' " themes for vim-airline
Plug 'altercation/vim-colors-solarized'
Plug 'iCyMind/NeoSolarized'
Plug 'joshdick/onedark.vim'
Plug 'flazz/vim-colorschemes'

" ========================== Project ==========================
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons' " file drawer

" ========================== Git ==============================
Plug 'airblade/vim-gitgutter'

" ========================== Ruby and Rails ===================
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-rails'
Plug 'vim-test/vim-test'
Plug 'ngmy/vim-rubocop'

" ========================= Languagues =======================
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'jtratner/vim-flavored-markdown'
Plug 'nelstrom/vim-markdown-preview'
Plug 'pangloss/vim-javascript'
Plug 'junegunn/vim-easy-align' " easy identation for some cases

" ========================= HTML =============================
Plug 'mattn/emmet-vim'

" ========================= Improvements =====================
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'Townk/vim-autoclose'
Plug 'easymotion/vim-easymotion'
Plug 'jiangmiao/auto-pairs' " automatic closing of quotes, parenthesis, brackets, etc.
Plug 'tpope/vim-ragtag' " endings for html, xml, etc. - ehances surround

" ========================= Tmux ======= =====================
Plug 'christoomey/vim-tmux-runner'
Plug 'christoomey/vim-tmux-navigator'

" Initialize plugin system
"
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()
" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting

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
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

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

" disable unsafe commands in project specific vimrc files
set secure

" VTR runner commands
let g:VtrUseVtrMaps = 1
let g:VtrPercentage = 30

nnoremap <leader>va :VtrAttachToPane<cr>
vmap <C-g> :VtrSendLinesToRunner<cr>
nnoremap <leader>q :VtrSendCommandToRunner q<cr>

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

set encoding=UTF-8

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='solarized'
let g:airline#extensions#tabline#show_buffers = 0 " do not show open buffers in tabline
let g:airline#extensions#tabline#show_splits = 0
