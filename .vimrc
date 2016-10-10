"*****************************************************************************
"" NeoBundle core
"*****************************************************************************

if has('vim_starting')
	set nocompatible               " Be iMproved

	" Required:
	set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

let neobundle_readme=expand('~/.vim/bundle/neobundle.vim/README.md')

if !filereadable(neobundle_readme)
	echo "Installing NeoBundle..."
	echo ""
	silent !mkdir -p ~/.vim/bundle
	silent !git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim/
	let g:not_finsh_neobundle = "yes"
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

"*****************************************************************************
"" NeoBundle install packages
"*****************************************************************************
"The NERD Tree
NeoBundle 'scrooloose/nerdtree'

"" Color
NeoBundle 'tomasr/molokai'

NeoBundle 'bling/vim-airline'

"NeoBundle 'scrooloose/syntastic'

"NeoBundle 'Shougo/neocomplete.vim'


"vadv/vim-chef
"NeoBundle 'MarcWeber/vim-addon-mw-utils'
"NeoBundle 'tomtom/tlib_vim'
"'NeoBundle 'garbas/vim-snipmate'
" 'NeoBundle 'vadv/vim-chef'

"vim-endwise
NeoBundle 'tpope/vim-endwise'

"vim-exim
NeoBundle 'vim-scripts/exim.vim'

"set rtp+=~/.vim/bundle/vim-chef-my
"NeoBundle '~/.vim/bundle/vim-chef-my'



" --- Python ---
NeoBundle 'klen/python-mode'	        " Python mode (docs, refactor, lints, highlighting, run and ipdb and more)
NeoBundle 'davidhalter/jedi-vim'	" Jedi-vim autocomplete plugin


NeoBundle 'majutsushi/tagbar'		"TagBar
NeoBundle 'aperezdc/vim-template'	"Template 

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck


"*****************************************************************************
"" Basic Setup
"*****************************************************************************
set nocompatible
set showcmd
set cursorline
set undolevels=2048
set mouse=a
set mousehide
set visualbell
set autoread
set scrolloff=5
set nowrap
set linebreak
set history=128
"set list
set showmatch
set confirm

""
set fileencoding=utf-8
set fileencodings=utf-8
set fileformats=unix,dos,mac
"set ffs=unix,dos,mac
set wildmenu
set wcm=<Tab>
menu Encoding.koi8-r :e ++enc=koi8-r ++ff=unix<CR>
menu Encoding.windows-1251 :e ++enc=cp1251 ++ff=dos<CR>
menu Encoding.cp866 :e ++enc=cp866 ++ff=dos<CR>
menu Encoding.utf-8 :e ++enc=utf8 <CR>
menu Encoding.koi8-u :e ++enc=koi8-u ++ff=unix<CR>
map <F8> :emenu Encoding.<TAB>

""
if has('win32')
	set encoding=cp1251
else
	set encoding=utf-8
	set termencoding=utf-8
endif

"Fix bakcpace indent
set backspace=indent,eol,start


"set tabstop=4
"set softtabstop=0
"set shiftwidth=4
"set expandtab

"" Enable hidden buffers
set hidden

"-=     =-
set hlsearch
set incsearch
set ignorecase
set smartcase
"set nowrapscan

"-=Swap  backup=-
set nobackup
set noswapfile

"-= =-
set autoindent
set cindent
set smartindent
"

"*****************************************************************************
"" Visual Settings
"*****************************************************************************
syntax on
set ruler
set number
set relativenumber
set t_Co=256
"" Status bar
set laststatus=2
set cmdheight=2



"*****************************************************************************
"" Plugin
"*****************************************************************************


"" NERDTree configuration
"let g:NERDTreeChDirMode=
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$','__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 30
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
nnoremap <silent> <F2> :NERDTreeFind<CR>
noremap <F3> :NERDTreeToggle<CR>

"" Molokai Color Scheme
let g:rehash256 = 1
let g:molokai_original = 1
if !exists('g:not_finsh_neobundle')
	colorscheme molokai
endif

""vim-airline
"let g:airline_theme = 'powerlineish'
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1

""syntastic
"let g:syntastic_always_populate_loc_list=1
"let g:syntastic_error_symbol=...
"let g:syntastic_warning_symbol=...
"let g:syntastic_style_error_symbol = ...
"let g:syntastic_style_warning_symbol = ...
"let g:syntastic_auto_loc_list=1
"let g:syntastic_aggregate_errors = 1

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0


""neocomplete.vim
" Use neocomplete.
"let g:neocomplete#enable_at_startup = 1
" Set minimum syntax keyword length.
"let g:neocomplete#sources#syntax#min_keyword_length = 3
"let g:neocomplete#enable_smart_case = 1
"let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
"" Disable AutoComplPop.
"let g:acp_enableAtStartup = 0
" Use neocomplete.
"let g:neocomplete#enable_at_startup = 1
" " Use smartcase.
"let g:neocomplete#enable_smart_case = 1
" " Set minimum syntax keyword length.
"let g:neocomplete#sources#syntax#min_keyword_length = 3
"let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

"=====================================================
" Python-mode settings
"=====================================================
" отключаем автокомплит по коду (у нас вместо него используется jedi-vim)
let g:pymode_rope = 0
let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0

"Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = '<F1>'

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
let g:pymode_lint_ignore="E501,W601,C0110"

"Auto check on save
let g:pymode_lint_write = 1

"Support virtualenv
let g:pymode_virtualenv = 1

"Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'

"Syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

"Don't autofold code
let g:pymode_folding = 0

"Run the code
let g:pymode_run = 0

"=====================================================
" TagBar settings
"=====================================================
nmap <F8> :TagbarToggle<CR>

"=====================================================
" vim-template settings
"=====================================================
let g:user = "Alexandr Lavrenko"
let g:email = "oleksandr.lavrenko@email"
"let g:license = "Your-License"

"vadv/vim-chef
"autocmd FileType ruby,eruby set filetype=ruby.eruby.chef

