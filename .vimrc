"
" NEEDED AT TOP
"
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

"
" SETTINGS
"
Plugin 'tpope/vim-sensible' "defaults
Plugin 'editorconfig/editorconfig-vim' "load editorconfig file
Plugin 'MarcWeber/vim-addon-local-vimrc'

"
" GUI
"
Plugin 'bling/vim-airline' "footer line
let g:airline_powerline_fonts = 1
Plugin 'kshenoy/vim-signature'
Plugin 'nathanaelkane/vim-indent-guides' "Show indent guides
let g:indent_guides_enable_on_vim_startup = 1
Plugin 'regedarek/ZoomWin' "togle zoom on windows

Plugin 'scrooloose/syntastic'
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_aggregate_errors = 1
Plugin 'goatslacker/mango.vim' "colors
"Plugin 'mbbill/undotree'

"
" EDITING
"
Plugin 'sickill/vim-pasta' "pasting with indentation
Plugin 'jiangmiao/auto-pairs' "insert matching { [ ( ...
Plugin 'pgilad/vim-skeletons' "files templates
Plugin 'jakobwesthoff/whitespacetrail' "removes whitespaces from end of lines
Plugin 'Valloric/YouCompleteMe' " Autocomplete make sure to follow installs steps https://github.com/Valloric/YouCompleteMe
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-surround' "work with surrounding tags, ' {...
"Plugin 'Lokaltog/vim-easymotion' "quick moves
Plugin 'Wolfy87/vim-enmasse' "search/replace in files
Plugin 'haya14busa/incsearch.vim' "incremental search (usefull for regex)
"Plugin 'junegunn/vim-easy-align' "align
"Plugin 'terryma/vim-multiple-cursors' "multiple selections

"
" FILE NAV
"
Plugin 'kien/ctrlp.vim'
Plugin 'sgur/ctrlp-extensions.vim' "search in history
Plugin 'ivalkeen/vim-ctrlp-tjump' " search in tags
Plugin 'tacahiroy/ctrlp-funky' "search in functions
nnoremap <leader><leader> :CtrlPMRUFiles<CR>
let g:ctrlp_working_path_mode = 'ra' "try to find .git in parents to set ctrlP root
"Symfony specific dirs ignored
let g:ctrlp_root_markers = ['src/', '.git/','.hg/','_darcs','.bzr']
let g:ctrlp_extensions = ['tag']
"Bundle 'DavidEGx/ctrlp-smarttabs' " search in tabs
Plugin 'majutsushi/tagbar'
nmap <F8> :TagbarToggle<CR>

"Auto updates tags
"Plugin 'xolox/vim-easytags'
"let g:easytags_async=1

" file tree browser
Plugin 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
nnoremap <F6> :NERDTreeToggle<CR>
inoremap <F6> :NERDTreeToggle<CR>

Plugin 'rking/ag.vim' "fils search based on ag

"
" NOTEBOOK
"
Plugin 'xolox/vim-notes' "notebook
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-shell'

"
" SNIPPETS
"
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" use enter to insert auto complete suggestion
let g:UltiSnipsExpandTrigger = "<nop>"
let g:ulti_expand_or_jump_res = 0
if !exists("*ExpandSnippetOrCarriageReturn")
	function ExpandSnippetOrCarriageReturn()
		let snippet = UltiSnips#ExpandSnippetOrJump()
		if g:ulti_expand_or_jump_res > 0
			return snippet
		else
			return "\<CR>"
		endif
	endfunction
endif
inoremap <expr> <CR> pumvisible() ? "<C-R>=ExpandSnippetOrCarriageReturn()<CR>" : "\<CR>"

let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"
" SCM/GIT integration
"
Plugin 'tpope/vim-fugitive'
Plugin 'mhinz/vim-signify' "displays chneged line in gutter

""""""""""""""""""""""""""""""
" LANGUAGE SPECIFIC FEATURES "
""""""""""""""""""""""""""""""

"
" JAVASCRIPT
"
Plugin 'pangloss/vim-javascript' "syntax and indent all in one
Plugin 'maksimr/vim-jsbeautify'
Plugin 'marijnh/tern_for_vim' " run npm install in bundle/tern_for_vim
Plugin 'elzr/vim-json'

"
" HTML
"
Plugin 'mattn/emmet-vim'
Plugin 'chrisgillis/vim-bootstrap3-snippets'

"
" CSS/LESS/SASS
"
Plugin 'tpope/vim-haml' " sass too
Plugin 'groenewege/vim-less'

"
" MARKDOWN
"
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'vitalk/vim-simple-todo' "simple todo list \i => adds a toto \x => checks \X => uncheck
au BufNewFile,BufRead *.md  setf markdown "Associate *.md with markdown (otherwise only README.md are regognized as markdown)
let g:vim_markdown_initial_foldlevel=1

"
" SQL
"
Plugin 'vim-scripts/dbext.vim'

"
" SPELLCHECK
"
Plugin 'dpelle/vim-LanguageTool' "Grammar check
let g:languagetool_jar='/usr/local/LanguageTool/languagetool-commandline.jar'

"
" PHP
"
Plugin 'evidens/vim-twig'
Plugin 'vim-php/tagbar-phpctags.vim' "needs phpctags bin. better tagbar for php
Plugin '2072/PHP-Indenting-for-VIm' "better indent
Plugin 'joonty/vdebug' "debugger integration
let g:vdebug_options = {}
"let g:vdebug_options["port"] = 9009
"let g:vdebug_options["path_maps"] = {
"\    "/var/www": "/home/lxc/.../var/www"
"\}
"let g:vdebug_options['server'] = "local LXC IP"
Plugin 'shawncplus/phpcomplete.vim' "auto complete based on tags
let g:syntastic_php_checkers=['php', 'phpcs']
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
set completeopt=menu,longest
nnoremap <silent><C-B> :!ctags -f .tags.php<CR>
set tags=.tags.php
let php_sql_query=1
let php_htmlInStrings=1
let php_folding=0

set makeprg=php\ -l\ %
"let g:syntastic_php_phpcs_args="--report=csv --standard=PSR2" "DISABLED : activate with spcific projects
"Plugin 'arnaud-lb/vim-php-namespace' "insert namespaces . DISABLED : very usefull relies on tags which make vim to slow. TODO find why
"inoremap <Leader>u <C-O>:call PhpInsertUse()<CR> " \u to insert use
"noremap <Leader>u :call PhpInsertUse()<CR>
"Plugin 'StanAngeloff/php.vim' " provides better syntax outline. DISABLED : conflicts with CtrlP

" PHP autocomplete
"Bundle 'Shougo/vimproc' "Needed for phpcomplete-extended
"Bundle 'Shougo/unite.vim' "Needed for phpcomplete-extended
"Bundle 'm2mdas/phpcomplete-extended' " DISABLED : errors on ez publish projet
"index
"Bundle 'm2mdas/phpcomplete-extended-symfony' "DISABLED : relies on
"phpcomplete-extended
"autocmd  FileType  php setlocal omnifunc=phpcomplete_extended#CompletePHP "activate phpcomplete-extended

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


""""""""""""""""""""
" PLUGINS SETTINGS "
""""""""""""""""""""
let skeletons#skeletonsDir = "~/.vim/bundle/vim-skeletons/skeletons/"
call skeletons#skeletonsOn()
colorscheme mango


"""""""""""""""""""""""
" NATIVE VIM SETTINGS "
"""""""""""""""""""""""
" ignore most common directories and files in vimgrep ack CtrlP etc.
set wildignore+=*/tmp/*,*/dist/*,*.so,*.swp,*.zip,*/bower_components/*,.git/*,.svn/*,*/node_modules/*,*/coverage/*,*/phonegap/*,*~,*/cache/*,*/log/*,*/logs/*

" make vim put swap, backup and undo files in a special location instead of the working directory of the file being edited
" http://stackoverflow.com/questions/821902/disabling-swap-files-creation-in-vim
"set backupdir=~/.vim/backup// " can't keep backups because of this bug https://github.com/paulmillr/chokidar/issues/35
set nowritebackup
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

syntax on
set background=dark

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
highlight Search  ctermfg=Black	ctermbg=yellow	cterm=bold	guifg=#404040	gui=bold

" command menu
set wildmenu "better completion in menus
set wildmode=longest:full,full

if has("gui_running")
	if has("gui_gtk2")
		set guifont=Monospace\ 9

		"removes toolbars
		":set guioptions-=m  "remove menu bar
		:set guioptions-=T  "remove toolbar
	endif
endif

" different cursor shape in insert mode
silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
if has("autocmd")
  au InsertEnter * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
  au InsertLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
  au VimLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
endif

"
" SHORTCUTS
"
"
nnoremap <silent><TAB> >>
nnoremap <silent><S-TAB> <<
vnoremap <silent><TAB> >gv
vnoremap <silent><S-TAB> <gv

" Alt+leftarrow will go one window left, etc.
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

" changes windows size with num pag + and -
if bufwinnr(1)
	map <kMinus> :10winc <<CR>
	nmap <silent> <C-Right> :10winc ><CR>
endif

" SMARTHOME : home key gets back to line begining first
noremap <expr> <silent> <Home> col('.') == match(getline('.'),'\S')+1 ? '0' : '^'
imap <silent> <Home> <C-O><Home>

" same moves as in insert mode
nmap <C-Left> b
nmap <C-Right> w


