set nocompatible
filetype off

"vim colors
set t_Co=256
let base16colorspace=256  " Access colors present in 256 colorspace"

" set the runtime path to include Vundle and initialize
 set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'plasticboy/vim-markdown'
Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'lepture/vim-jinja'
Plugin 'fisadev/fisa-vim-colorscheme'
Plugin 'fisadev/FixedTaskList.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'ervandew/supertab'
Plugin 'klen/python-mode'
Plugin 'taglist.vim'
Plugin 'wannesm/wmgraphviz.vim'
Plugin 'vim-scripts/ScrollColors'
Plugin 'myusuf3/numbers.vim'
Plugin 'nanotech/jellybeans.vim'
Plugin 'mileszs/ack.vim'
"Plugin 'davidhalter/jedi-vim'
Plugin 'fatih/vim-go'
Plugin 'flazz/vim-colorschemes'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-colorscheme-switcher'
"Plugin 'octol/vim-cpp-enhanced-highlight'
"Plugin 'Rip-Rip/clang_complete'
"Plugin 'c.vim'
Plugin 'rust-lang/rust.vim'
Plugin 'vim-scripts/bash-support.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins

"Map keyboard movements
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

"Syntax Highlighting and validation
syntax on                           " syntax highlighing
let python_highlight_all = 1	"some extra highlight
highlight clear
filetype on                          " try to detect filetypes
filetype plugin indent on    " enable loading indent file for filetype
filetype plugin on

" fix problems with gitgutter
let g:gitgutter_eager = 0
let g:gitgutter_realtime = 0

"Python tabs
set tabstop=4
set smarttab
set expandtab
set shiftwidth=4
set softtabstop=4
set shiftround
set autoindent
set colorcolumn=79

"Set line numbers
set ruler
set showcmd
set incsearch
set hls
set hlsearch
set browsedir=current
set nowrap
set ttyfast

" Set relative numbers
:au FocusLost * :set number
:au FocusGained * :set relativenumber
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber


"python-mode
let g:pymode_rope=1
let g:pymode_rope_completion=0
let g:pymode_trim_whitespaces=1
let g:pymode_syntax=1
let g:pymode_syntax_all=1
let g:pymode_syntax_indent_errors=g:pymode_syntax_all
let g:pymode_syntax_space_errors=g:pymode_syntax_all
let g:pymode_virtualenv=1
let g:pymode_breakpoint=1
let g:pymode_breakpoint_bind='<leader>b'
let g:pymode_lint=1
let g:pymode_lint_on_write = 0
let g:pymode_lint_checkers = ['pep8', 'pyflakes', 'pylint']
let g:pymode_lint_signs = 1
let g:pymode_breakpoint_cmd = 'from ipdb import set_trace; set_trace() # Breakpint'

"Vim tab navigation better
map <F4> :tabp<CR>
map <F5> :tabn<CR>

"Pending task list
map <F6> :TaskList<CR>

"Tagbar display
map <F3> :TlistToggle<CR>
let g:tagbar_autofocus = 1

"airline laststatus
set laststatus=2

"NerdTree mapping
map <F2> :NERDTreeToggle<CR>

"Auto flake8 check at writing
"autocmd BufWritePost *.py call Flake8()

"Auto remove trailing whitespaces
autocmd BufWritePre * :%s/\s\+$//e

"IPDB import statement
autocmd FileType python ab tr from ipdb import set_trace; set_trace()  # BREAKPOINT

"GUI
set showtabline=2
set title
set nocompatible
set smartindent
set showmatch
set showmode

"Search
set ignorecase
set hlsearch
set incsearch
nmap <silent> ,, :nohlsearch<cr>

"Backspace
set backspace=2
set backspace=indent,eol,start

"vim colors
"set t_Co=256
"let &t_AB="\e[48;5;%dm"
"let &t_AF="\e[38;5;%dm"

" Colorscheme
colorscheme jellybeans

" Synstastic Statusline
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" Avoid annoying documentation window
set completeopt=menu

"Colorscheme
colorscheme jellybeans

" Clang
let g:clang_library_path = '/usr/lib/llvm-3.6/lib'

" Syntastic C++11
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
