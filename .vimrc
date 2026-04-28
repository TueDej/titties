" --------
" vim-plug
" --------

let s:vim_dir = expand('~/.vim')

if empty(glob(s:vim_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo ' . s:vim_dir . '/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'bfrg/vim-c-cpp-modern'
Plug 'jasonccox/vim-wayland-clipboard'
Plug 'airblade/vim-gitgutter'
Plug 'sainnhe/sonokai'
Plug 'sainnhe/edge'

call plug#end()

" -----------
" Colorscheme
" -----------

color wildcharm

" ---------------------
" Terminal cursor shape
" ---------------------

let &t_EI = "\e[2 q" " Block
let &t_SR = "\e[4 q" " Underline
let &t_SI = "\e[6 q" " Beam

" ----------------
" General settings
" ----------------

set showmatch

set virtualedit=all
set foldmethod=marker

set scrolloff=3
set sidescrolloff=3

set splitbelow
set splitright

set cursorlineopt=screenline,number
set cursorline

set numberwidth=3
set relativenumber
set number

" -----------
" Indentation
" -----------

set smartindent
set autoindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set cinoptions=g0,(s,us,U1,ks,m1
set expandtab
set shiftround

" ------
" Search
" ------

set incsearch
set hlsearch
set ignorecase
set smartcase

" ---------
" Listchars
" ---------

set listchars=leadmultispace:┆\ \ \ ,tab:│\ \ ,trail:·
set list

" --------
" Wrapping
" --------

set wrap
set linebreak
set breakindent
set showbreak=↯\ 

" --------------------
" Preformance & timing
" --------------------

set updatetime=500
set timeoutlen=500
set ttimeoutlen=50
set lazyredraw

" --------------------------
" Persistent history control
" --------------------------

set backup
set swapfile
set undofile
set viminfo='1000,f1,<500,h,%,:100

let &directory = s:vim_dir . '/swap//'
let &backupdir = s:vim_dir . '/backup//'
let &undodir   = s:vim_dir . '/undodir//'

for dir in [&backupdir, &directory, &undodir]
    if !isdirectory(dir)
        call mkdir(dir, 'p', 0o700)
    endif
endfor

" -----------------------
" Restore cursor position
" -----------------------

augroup autovimrc
    autocmd!
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
augroup END

" ---------------
" GitGutter signs
" ---------------

let g:gitgutter_sign_added    = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed  = '-'
let g:gitgutter_sign_removed_first_line = '↾'
let g:gitgutter_sign_removed_above_and_below = '⇌'
let g:gitgutter_sign_modified_removed = '±'

" -------
" Keymaps
" -------

let mapleader = "\<space>"

nnoremap <leader>l :source $MYVIMRC<cr>
nnoremap <leader>v :tabnew $MYVIMRC<cr>

nnoremap <leader>w :w!<cr>
nnoremap <leader>Q :q!<cr>
nnoremap <leader>x :x!<cr>
nnoremap <leader>q :bd<cr>

nnoremap <c-j> <c-w>j
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h
nnoremap <c-k> <c-w>k
nnoremap <c-w>v :vsplit<cr>
nnoremap <c-w>s :split<cr>

nnoremap H :tabprev<cr>
nnoremap L :tabnext<cr>
nnoremap <leader>tn :tabnew 
nnoremap <leader>tN :tabnew<cr>
nnoremap <leader>tc :tabclose<cr>

nnoremap <leader>s :set spell!<cr>
nnoremap <leader><leader> :nohlsearch<cr>
nnoremap <leader>tr :silent! %s/\s\+$//<cr> :nohlsearch<cr>

nnoremap j gj
vnoremap j gj
nnoremap k gk
vnoremap k gk
nnoremap 0 g0

nnoremap <leader>y "+y
vnoremap <leader>y "+y

vnoremap < <gv
vnoremap > >gv
nnoremap <leader>a ggVG
nnoremap <leader>d :t.<cr>
