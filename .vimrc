set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" ignore directories in vimgrep ack CtrlP etc.
set wildignore+=*/tmp/*,*/dist/*,*.so,*.swp,*.zip,*/bower_components/*,.git/*,.svn/*,*/node_modules/*,*/coverage/*,*/phonegap/*,*~

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" aditionnal plugins
Plugin 'tpope/vim-sensible' "defaults
Plugin 'tpope/vim-fugitive'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-shell'
Plugin 'kien/ctrlp.vim'
Plugin 'xolox/vim-notes'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'scrooloose/nerdtree'
"Plugin 'jistr/vim-nerdtree-tab' "not working with vundle
"Plugin 'tmhedberg/matchit' " already included in vim
Plugin 'Valloric/YouCompleteMe' " make sure to follow installs steps https://github.com/Valloric/YouCompleteMe
Plugin 'tpope/vim-surround'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'scrooloose/syntastic'
Plugin 'mbbill/undotree'
Plugin 'tomtom/tcomment_vim'
Plugin 'mileszs/ack.vim'
Plugin 'MarcWeber/vim-addon-local-vimrc'

" colors
"Plugin 'altercation/vim-colors-solarized'
Plugin 'goatslacker/mango.vim'

" web dev plugins
Plugin 'pangloss/vim-javascript' "syntax and indent all in one
"Plugin 'jelera/vim-javascript-syntax' " better syntax but no indent use it with https://gist.github.com/nisaacson/6939960 to indent
"Plugin 'walm/jshint.vim' " alternative for syntastic 
Plugin 'maksimr/vim-jsbeautify' 
Plugin 'marijnh/tern_for_vim' " run npm install in bundle/tern_for_vim
Plugin 'mattn/emmet-vim' 
Plugin 'tpope/vim-haml' " sass too
Plugin 'groenewege/vim-less'
Plugin 'elzr/vim-json'
"Plugin 'Lokaltog/vim-powerline'
Plugin 'bling/vim-airline'
let g:airline_powerline_fonts = 1
Plugin 'tobyS/skeletons.vim'
Plugin 'jakobwesthoff/whitespacetrail'
Plugin 'sickill/vim-pasta'
Plugin 'jiangmiao/auto-pairs'
"Plugin 'bkad/CamelCaseMotion'
"Plugin 'kshenoy/vim-signature'

" markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
au BufNewFile,BufRead *.md  setf markdown "Associate *.md with markdown (otherwise only README.md are regognized as markdown)


Plugin 'regedarek/ZoomWin' "togle zoom on windows
Plugin 'editorconfig/editorconfig-vim' "load editorconfig file


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

syntax on
set background=dark
colorscheme mango

set clipboard=unnamedplus "sets common clipboard for x11 & vim
set cursorline "highlight current line
set relativenumber "line numbers relative to current line

set tabstop=4     " tabs are at proper location
"set expandtab     " don't use actual tab character (ctrl-v)
set shiftwidth=4  " indenting is 4 spaces (even if its tabs)
set autoindent    " turns it on
set smartindent   " does the right thing (mostly) in programs

set ic " case insesitive search

" @see http://usevim.com/2012/05/16/mouse/
" Send more characters for redraws
set ttyfast
" Enable mouse use in all modes
set mouse=a
" Set this to the name of your terminal that supports mouse codes.
" Must be one of: xterm, xterm2, netterm, dec, jsbterm, pterm
set ttymouse=xterm2

" Highlight all occurrence of a selected word
set hlsearch

if has("gui_running")
	if has("gui_gtk2")
		set guifont=Monospace\ 9

		"removes toolbars
		":set guioptions-=m  "remove menu bar
		:set guioptions-=T  "remove toolbar
	endif
endif

"
" SHORTCUTS
"

" Alt+leftarrow will go one window left, etc.
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

" changes windows size with + and -
if bufwinnr(1)
	map <kMinus> :10winc <<CR> 
	map <kPlus> :10winc ><CR>
endif

" SMARTHOME
" home key gets back to line begining first
noremap <expr> <silent> <Home> col('.') == match(getline('.'),'\S')+1 ? '0' : '^'
imap <silent> <Home> <C-O><Home>

" NerdTree toggle 
nnoremap <F6> :NERDTreeToggle<CR>
inoremap <F6> :NERDTreeToggle<CR>


