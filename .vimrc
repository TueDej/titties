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
Plug 'tpope/vim-dispatch'
Plug 'uiiaoo/java-syntax.vim'
Plug 'kaarmu/typst.vim'
Plug 'menisadi/kanagawa.vim'
Plug 'srcery-colors/srcery-vim'
Plug 'godlygeek/tabular'

call plug#end()

" -----------
" Colorscheme
" -----------

let g:edge_better_performance = 1
let g:edge_transparent_background = 2
let g:edge_menu_selection_background = 'green'
let g:edge_spell_foreground = 'colored'

let g:srcery_guisp_fallback = 'bg'

set termguicolors
color srcery

set shortmess+=I

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
"set cinoptions=g0,(0,us,U1,ks,m1
autocmd FileType c,cpp,java setlocal cinoptions=j1,J1,g0,N-s,t0,(0,w1,Ws,m1
set expandtab
set shiftround

" ------
" Search
" ------

set incsearch
set hlsearch
set ignorecase
set smartcase

" -------
" Folding
" -------

set fdm=indent
set fdc=1
set fdn=3
set fdl=1

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
inoremap <c-j> <esc><c-w>j
inoremap <c-l> <esc><c-w>l
inoremap <c-h> <esc><c-w>h
inoremap <c-k> <esc><c-w>k
tnoremap <c-j> <c-\><c-n><c-w>j
tnoremap <c-l> <c-\><c-n><c-w>l
tnoremap <c-h> <c-\><c-n><c-w>h
tnoremap <c-k> <c-\><c-n><c-w>k
nnoremap <c-w>v :vsplit<cr>
nnoremap <c-w>s :split<cr>

autocmd BufEnter * if &buftype == 'terminal' | :execute 'normal! i' | endif

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

" ---------------------------
" Gradle runner (Using :Make)
" ---------------------------

function! s:FindProjectRoot() abort
    let l:marker = findfile('gradlew', '.;/')
    if !empty(l:marker)
        return fnamemodify(l:marker, ':p:h')
    endif
    return getcwd()
endfunction

function! s:ExecuteGradleRun() abort
    if &filetype !=# 'java'
        echoerr 'GradleRun can only be executed from a Java buffer.'
        return
    endif

    let l:root = s:FindProjectRoot()

    if !filereadable(l:root . '/gradlew')
        echoerr 'Could not find gradlew wrapper script in upstream directories.'
        return
    endif

    let l:old_makeprg = &l:makeprg
    let l:old_errorformat = &l:errorformat

    try
        let &l:makeprg = l:root . '/gradlew -p ' . l:root

        let &l:errorformat = '%f:%l:\ %t%.%#:\ %m,%f:%l:\ %m,%f\|%l\ %t%.%#\|\ %m'

        execute 'Make run'
    finally
        let &l:makeprg = l:old_makeprg
        let &l:errorformat = l:old_errorformat
    endtry
endfunction

command! GradleRun call s:ExecuteGradleRun()
