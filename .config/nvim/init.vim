set inccommand=split
set nocompatible              " be iMproved, required

" # MOUSE INTEGRATION
" @see http://usevim.com/2012/05/16/mouse/
set ttyfast " Send more characters for redraws
set mouse=a " Enable mouse use in all modes

" COMMANDS
set wildmenu "better completion in menus
set wildmode=longest:full,full


" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible' "defaults
Plug 'dockyard/vim-easydir' " creates dir if new file in new dir

" NERDTREE {{{
Plug 'scrooloose/nerdtree' " A tree explorer
Plug 'jistr/vim-nerdtree-tabs' " NERDTree and tabs fixes
noremap <F6> :NERDTreeTabsToggle<CR> <c-w><c-p> :NERDTreeTabsFind<CR>
inoremap <F6> <Esc>:NERDTreeTabsToggle<CR> <c-w><c-p> :NERDTreeTabsFind<CR>
let g:NERDTreeWinSize = 40
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeShowBookmarks = 1
" }}}

" GIT {{{
Plug 'tpope/vim-fugitive' " GIT integration
Plug 'airblade/vim-gitgutter' " show changed lines in gutter
Plug 'rhysd/committia.vim' " show diff in own split when editing a COMMIT_EDITMSG
" }}}

" {{{ FILESYSTEM
Plug 'dockyard/vim-easydir' " creates dir if new file in new dir
Plug 'tpope/vim-eunuch' " Add file manip commands like Remove, Move, Rename, SudoWrite
Plug 'MarcWeber/vim-addon-local-vimrc' "load local vimrc from projet
" }}}

" {{{ SEARCH
Plug 'haya14busa/incsearch.vim'      " incremental search (usefull for regex)
Plug 'rking/ag.vim' "file search based on ag
Plug 'dyng/ctrlsf.vim' "file search with context

" FZF {{{{ 
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } "fuzzy finder
Plug 'junegunn/fzf.vim'

map <c-p> :Files<CR>
map <c-h> :History<CR>
map <c-f> :BLines<CR> "search in current buffer
" map <c-c> :History:<CR> "commands history
" map <c-t> :Tags<CR>
" map <c-j> :BTags<CR>
" map <c-l> :Lines<CR> "search in all buffers
" map <c-s> :Snippets<CR> "search in snippets
" }}}}

set ic " case insesitive search
set hlsearch
" }}}

" BUFFERS {{{
set hidden " hide modified buffers on change instead of closing them

" bufsurf : Navigating buffers webbrowser style {{{{
Plug 'ton/vim-bufsurf' 
let g:BufSurfIgnore = 'NERD_tree, help' ""
map  <Esc>[1;3D :BufSurfBack<CR>
imap <Esc>[1;3D <C-O>:BufSurfBack<CR>
map  <Esc>[1;3C :BufSurfForward<CR>
imap <Esc>[1;3C <C-O>:BufSurfForward<CR>
" }}}}

" }}}

" MOVES {{{
Plug 'kshenoy/vim-signature' " toggle, display and navigate marks

" Home key gets back to line begining first {{{{
noremap <expr> <silent> <Home> col('.') == match(getline('.'),'\S')+1 ? '0' : '^'
imap <silent> <Home> <C-O><Home>
" }}}}

" Jump between words with CTRL {{{{
nmap <C-LEFT> b
nmap <C-RIGHT> w
" }}}}

" Moves inside long lines up and down with arrows {{{{
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk
" }}}}


" }}}

" EDITING {{{


Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }  " Autocomplete make sure to follow installs steps https://github.com/Valloric/YouCompleteMe

" }}}

" Initialize plugin system
call plug#end()

" WILDIGNORE {{{
set wildignorecase
set wildignore+=.git,.hg,.svn
set wildignore+=*.aux,*.out,*.toc
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest,*.rbc,*.class,*.so
set wildignore+=*.ai,*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png,*.psd,*.webp
set wildignore+=*.avi,*.m4a,*.mp3,*.oga,*.ogg,*.wav,*.webm
set wildignore+=*.eot,*.otf,*.ttf,*.woff
set wildignore+=*.doc,*.pdf
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*.min.*
set wildignore+=*.swp,.lock,.DS_Store,._*,*~
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*,*.gem
set wildignore+=*/tmp/*,*/dist/*,*/bower_components/*,node_modules/**,yarn.lock,*/coverage/*,*/phonegap/*,*/cache/*,*/target/*,*/build/*
set wildignore+=*/log/*,*/logs/*
" }}}

" vim:foldmethod=marker:foldlevel=0
