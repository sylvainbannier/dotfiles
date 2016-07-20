set nocompatible              " be iMproved, required

" # MOUSE INTEGRATION
" @see http://usevim.com/2012/05/16/mouse/
set ttyfast " Send more characters for redraws
set mouse=a " Enable mouse use in all modes
set ttymouse=xterm2 " Set this to the name of your terminal that supports mouse codes.  Must be one of: xterm, xterm2, netterm, dec, jsbterm, pterm

" COMMANDS
set wildmenu "better completion in menus
set wildmode=longest:full,full

call plug#begin('~/.vim/plugged')

" # SETTINGS
Plug 'tpope/vim-sensible' "defaults

" # TOOLS INTEGRATION

" ## ASYNC PROCESS
Plug 'Shougo/vimproc.vim', { 'do': 'make' }

" ## GIT
Plug 'tpope/vim-fugitive' " GIT integration
Plug 'airblade/vim-gitgutter' " show changed lines in gutter
Plug 'rhysd/committia.vim' " show diff in own split when editing a COMMIT_EDITMSG

" ## FILESYSTEM
Plug 'dockyard/vim-easydir' " creates dir if new file in new dir
Plug 'tpope/vim-eunuch' " Add file manip commands like Remove, Move, Rename, SudoWrite
Plug 'MarcWeber/vim-addon-local-vimrc' "load local vimrc from projet

" ## TAGS
set tags=tags

" # NAVIGATION

" ## INGORE FILES
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
set wildignore+=*/tmp/*,*/dist/*,*/bower_components/*,*/node_modules/*,*/coverage/*,*/phonegap/*,*/cache/*
set wildignore+=*/log/*,*/logs/*

" ## SEARCH
Plug 'haya14busa/incsearch.vim'      " incremental search (usefull for regex)
Plug 'rking/ag.vim' "file search based on ag
Plug 'dyng/ctrlsf.vim' "file search with context

" ### CUSTOM CONFIG
" Highlight all occurrence of a selected word
set ic " case insesitive search
set hlsearch
" highlight Search  ctermfg=Black	ctermbg=yellow	cterm=bold	guifg=#404040	gui=bold
" highlight SpellBad 	term=standout ctermfg=15 ctermbg=1 guifg=White guibg=Red
" highlight SyntasticError 	term=standout ctermfg=15 ctermbg=1 guifg=White guibg=Red
" highlight Visual  ctermfg=Black	ctermbg=yellow	cterm=bold	guifg=#404040	gui=bold

" ### AG CUSTOM MAPPINGS
map <c-a> :Ag

" ### AG COMMANDS
" | :Ag word           | search word in the whole project            |
" | :Ag word **/*.html | search word in the whole project html files |

" ### AG QUICKFIX SHORTCUTS
" | e  | open file and close the quickfix window.                  |
" | go | preview file (open but maintain focus on ag.vim results). |
" | t  | open in a new tab.                                        |
" | T  | open in new tab silently.                                 |

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } "fuzzy finder
Plug 'junegunn/fzf.vim'

map <c-p> :Files<CR>
map <c-h> :History<CR>
map <c-c> :History:<CR>
map <c-t> :Tags<CR>
map <c-j> :BTags<CR>
map <c-f> :BLines<CR>
map <c-s> :Snippets<CR>

" ### FZF COMMANDS
" | Ag [PATTERN] | {ag}{5} search result (ALT-A to select all, ALT-D to deselect all) |
" | Snippets     | Snippets ({UltiSnips}{6})                                          |
" | Commits      | Git commits (requires {fugitive.vim}{7})                           |
" | BCommits     | Git commits for the current buffer                                 |

" ### FZF RESULT LIST SHORTCUTS
" | TAB   | toggle select line            |
" | ALT-A | select all (usefull for AG)   |
" | ALT-D | deselect all (usefull for AG) |
" | <c-t> | open file in a new tab        |
" | <c-s> | open file in  split           |
" | <c-v> | open file in vertical split   |

" ### FZF SEARCH SYNTAX
" | Token              | Match type           | Description                      |
" | --------           | -------------------- | -------------------------------- |
" | sbtrkt             | fuzzy-match          | Items that match `sbtrkt`        |
" | ^music             | prefix-exact-match   | Items that start with `music`    |
" | .mp3$              | suffix-exact-match   | Items that end with `.mp3`       |
" | 'wild              | exact-match (quoted) | Items that include `wild`        |
" | !rmx               | inverse-fuzzy-match  | Items that do not match `rmx`    |
" | !'fire             | inverse-exact-match  | Items that do not include `fire` |
" | sbtrki !'fire  ... | extended search mode | mix search terms with AND        |

" ## TREE EXPLORER
Plug 'scrooloose/nerdtree' " A tree explorer
Plug 'jistr/vim-nerdtree-tabs' " NERDTree and tabs fixes
Plug 'Xuyuanp/nerdtree-git-plugin' "git status in nerdtree

"toggle and find file
noremap <F6> :NERDTreeTabsToggle<CR> <c-w><c-p> :NERDTreeTabsFind<CR>
inoremap <F6> <Esc>:NERDTreeTabsToggle<CR> <c-w><c-p> :NERDTreeTabsFind<CR>
let g:NERDTreeWinSize = 40
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeShowBookmarks = 1

" ## BUFFER LIST
set hidden " hide modified buffers on change instead of closing them

Plug 'ton/vim-bufsurf' " Navigating buffers webbrowser style

let g:BufSurfIgnore = 'NERD_tree, help' ""
map  <Esc>[1;3D :BufSurfBack<CR>
imap <Esc>[1;3D <C-O>:BufSurfBack<CR>
map  <Esc>[1;3C :BufSurfForward<CR>
imap <Esc>[1;3C <C-O>:BufSurfForward<CR>

" ## BUFFER
" SMARTHOME : home key gets back to line begining first
noremap <expr> <silent> <Home> col('.') == match(getline('.'),'\S')+1 ? '0' : '^'
imap <silent> <Home> <C-O><Home>

" Jump between words with CTRL
nmap <C-LEFT> b
nmap <C-RIGHT> w

" moves inside long lines up and down with arrows
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk

" ## BOOKMARKS
Plug 'kshenoy/vim-signature' " toggle, display and navigate marks
" | COMMAND | RESULT                                                |
" | mx      | Toggle mark 'x' and display it in the leftmost column |
" | dmx     | Remove mark 'x' where x is a-zA-Z                     |

" ## CURSOR POSITION HISTORY

" | g;     | Go to [count] older position in change list.        |
" | g,     | Go to [count] newer cursor position in change list. |
" | CTRL-O | Go to [count] older position in jump list.          |
" | CTRL-I | Go to [count] newer cursor position in jump list.   |

" ## DEFINITIONS (TAGS)
" Plug 'ludovicchabant/vim-gutentags' " updates tag file automatically on background

" Plug 'majutsushi/tagbar'
" open tags pane for current buffer
" map <F8> :TagbarToggle<CR>

" ## WINDOWS

" Alt+leftarrow will go one window left, etc.
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

" # EDITING

Plug 'sickill/vim-pasta'             " pasting with indentation
Plug 'Raimondi/delimitMate' "another auto pair alternative
" let g:delimitMate_jump_expansion = 1
" let g:delimitMate_balance_matchpairs = 1
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
Plug 'godlygeek/tabular'             " align data in tables
Plug 'jakobwesthoff/whitespacetrail' " removes whitespaces from end of lines
Plug 'tomtom/tcomment_vim'           " comment / uncomment
Plug 'tpope/vim-surround'            " work with surrounding tags, ' {...
Plug 'editorconfig/editorconfig-vim' " load editorconfig file
" Plug 'KabbAmine/zeavim.vim'        " search ZEAL documentation
" Plug 'blindFS/vim-regionsyntax'    " enable syntax for specific region
Plug 'easymotion/vim-easymotion'     " new moves based on character search
map <Leader> <Plug>(easymotion-prefix)

" ENCODING
set encoding=utf8

" # BACKUPS
" make vim put swap, backup and undo files in a special location instead of the working directory of the file being edited
" http://stackoverflow.com/questions/821902/disabling-swap-files-creation-in-vim
"set backupdir=~/.vim/backup// " can't keep backups because of this bug https://github.com/paulmillr/chokidar/issues/35
set nobackup
set nowritebackup
" set directory=~/.vim/swap//
set noswapfile

" ## CLIPBOARD
set clipboard=unnamedplus "sets common clipboard for x11 & vim
Plug 'junegunn/vim-peekaboo'

" Select with Shift+Down / Shift+Up
imap <S-Up> <Esc>vgk
nmap <S-Up> <Esc>vgk
vmap <S-Up> gk
imap <S-Down> <Esc>vgj
nmap <S-Down> <Esc>vgj
vmap <S-Down> gj

" # UNDO
set undodir=~/.vim/undo//
Plug 'mbbill/undotree' "visualize undo tree

" ## SYNTAX
syntax on

Plug 'scrooloose/syntastic'
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_aggregate_errors = 1

" ## INDENT
set tabstop=2     " tabs are at proper location
set shiftwidth=2  " indenting is 3 spaces (even if its tabs)
set autoindent    " turns it on
set smartindent   " does the right thing (mostly) in programs
" use multiple of shiftwidth when shifting indent levels.
" this is OFF so block comments don't get fudged when using ">>" and "<<"
set noshiftround
nnoremap <silent><TAB> >>
nnoremap <silent><S-TAB> <<
vnoremap <silent><TAB> >gv
vnoremap <silent><S-TAB> <gv
vmap <silent><TAB> >gv
vmap <silent><S-TAB> <gv

" # FILE TEMPLATES
" Plug 'pgilad/vim-skeletons'          " files templates
" let skeletons#skeletonsDir = "~/.vim/bundle/vim-skeletons/skeletons/"
" call skeletons#skeletonsOn()

" ## SNIPPETS
Plug 'SirVer/ultisnips' "snippets
Plug 'honza/vim-snippets' " base snippets library

" ### ULTISNIPS COMMANDS
" | :UltisnipsEdit | open snippets file corresponding to this file |

" ### ULTISNIPS CUSTOM CONFIG
" Use enter to insert auto complete suggestion :
" let g:UltiSnipsExpandTrigger = "<nop>"
" let g:ulti_expand_or_jump_res = 0
" if !exists("*ExpandSnippetOrCarriageReturn")
"   function ExpandSnippetOrCarriageReturn()
"     let snippet = UltiSnips#ExpandSnippetOrJump()
"     if g:ulti_expand_or_jump_res > 0
"       return snippet
"     else
"       return "\<CR>"
"     endif
"   endfunction
" endif
" inoremap <expr> <CR> pumvisible() ? "<C-R>=ExpandSnippetOrCarriageReturn()<CR>" : "\<CR>" "VIM trick - "<expr>" : evaluate expression before deciding mapping to apply

let g:UltiSnipsJumpForwardTrigger="<c-b>" " jump to next placehodler in snippet
let g:UltiSnipsJumpBackwardTrigger="<c-z>" " jump to previous placeholder

" let g:UltiSnipsEditSplit="vertical" " open ultisnipsEdit in a vertical splited window

" ## REFACTORING
Plug 'Wolfy87/vim-enmasse'           " search/replace in multiple files
Plug 'tpope/vim-abolish'             " search/replace keeping case and other stuffs

" ## AUTO COMPLETE
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }  " Autocomplete make sure to follow installs steps https://github.com/Valloric/YouCompleteMe

" ### YCM CUSTOM CONFIG
let g:ycm_autoclose_preview_window_after_insertion = 1
" avoid override of my custom mapping for long lines by YCM
let g:ycm_key_list_select_completion = [ '<C-Tab>' ]
let g:ycm_key_list_previous_completion = [ '<C-S-Tab>' ]
inoremap <expr> <Down> pumvisible() ? "\<C-n>" : "\<C-O>gj"
inoremap <expr> <Up> pumvisible() ? "\<C-p>" : "\<C-O>gk"
let g:ycm_collect_identifiers_from_tags_files = 0
let g:ycm_semantic_triggers = {
  \ 'c' : ['->', '.'],
  \ 'objc' : ['->', '.'],
  \ 'ocaml' : ['.', '#'],
  \ 'cpp,objcpp' : ['->', '.', '::'],
  \ 'perl' : ['->'],
  \ 'php' : ['->', '::'],
  \ 'haskell,java,javascript,d,vim,ruby' : ['.'],
  \ 'css,less,scss,sass': [' ', '	', ': ', '  '],
  \ 'python,perl6,scala,vb,elixir,go' : ['.'],
  \ 'lua' : ['.', ':'],
  \ 'erlang' : [':'],
  \ }

" ## SPELLCHECK
Plug 'dpelle/vim-LanguageTool' "Grammar check
let g:languagetool_jar='/usr/local/LanguageTool/languagetool-commandline.jar'

" ## WISHLIST / TODO
" - easy indent / unindent yml blocs
" - search clipboard history


" # LANGAGES
Plug 'elzr/vim-json'                   " json
Plug 'tpope/vim-cucumber'              " cucumber syntax
Plug 'kalafut/vim-taskjuggler'         " taskjuggler
Plug 'wannesm/wmgraphviz.vim'          " Graphviz
Plug 'dahu/vim-asciidoc'               " Asciidoc
Plug 'IN3D/vim-raml'                   " RAML
Plug 'neo4j-contrib/cypher-vim-syntax' " Neo4j cypher syntax

" ## JAVASCRIPT

" ### JS CUSTOM CONFIG
let g:syntastic_javascript_checkers = ['eslint']

Plug 'othree/yajs.vim', { 'for': 'javascript' }         " JS syntax,
Plug 'gavocanov/vim-js-indent', { 'for': 'javascript' } " Indent from pangloss, works with yajs
Plug 'maksimr/vim-jsbeautify', { 'for': 'javascript' }  " autoformat JS
Plug 'othree/jspc.vim'                                  " Paramters completion
Plug 'othree/javascript-libraries-syntax.vim'           " extends syntax for with jQuery,backbone,etc.

" ### FUNCTION PARAMETERS AND AUTOCOMPLETE
Plug 'ternjs/tern_for_vim', { 'do': 'npm install', 'for': 'javascript' } "autocomplete for js dont forger to add .tern_project in project root
let g:tern_map_keys=1 "enable keyboard shortcuts for tern
" you have to create a .tern-projet file in root
" {
"   "libs": [
"     "browser",
"     "jquery"
"   ],
"   "loadEagerly": [
"     "src/**/*"
"   ],
"   "plugins": {
"     "node": {}
"   }
" }
" plugins other than node and requirejs should be installed with npm install -g tern-<plugin>.
" ie : tern-jasmine

" ### JSDOC
Plug 'heavenshell/vim-jsdoc' " generates JsDoc
let g:jsdoc_enable_es6 = 1 "allow arrow functions
" | COMMAND | RESULT                                   |
" | :JsDoc  | generates JSDoc for function on the line |

" ## REACT
Plug 'justinj/vim-react-snippets' " react snippets
Plug 'alexbyk/vim-ultisnips-react' " eS6 react snippets
Plug 'mlaursen/vim-react-snippets' " more react snippets
Plug'mxw/vim-jsx'                " Syntax
let g:jsx_ext_required = 0        " syntax and indent in .js files (not only jsx)

" ## NODE
Plug 'moll/vim-node' " detect extensionless node scripts (executables) via shebang and add gf for going to node_modules files

" ## HTML
Plug 'othree/html5.vim'                       " syntax
Plug 'gregsexton/MatchTag'                    " higlight matching tags
Plug 'mattn/emmet-vim'                        " fast html tags
Plug 'chrisgillis/vim-bootstrap3-snippets'    " Bootstrap snippets
Plug 'briancollins/vim-jst'                   " Bootstrap snippets
" au BufNewFile,BufRead *.ejs set filetype=html " sets ejs to html
Plug 'nikvdp/ejs-syntax'

" ## CSS/LESS/SASS
Plug 'JulesWang/css.vim'
      \| Plug 'hail2u/vim-css3-syntax'
      \| Plug 'cakebaker/scss-syntax.vim'
Plug 'othree/csscomplete.vim'
Plug 'ap/vim-css-color', { 'for': ['css', 'scss', 'sass', 'less'] }
Plug 'cakebaker/scss-syntax.vim', { 'for': ['scss', 'sass'] }
Plug 'groenewege/vim-less', { 'for': 'less' }

" ## MARKDOWN
Plug 'vim-pandoc/vim-pandoc-syntax' " Syntax
let g:markdown_fenced_languages = [
      \ 'html',
      \ 'javascript', 'js=javascript', 'json=javascript',
      \ 'sass',
      \ ]
Plug 'vitalk/vim-simple-todo' "simple todo list \i => adds a toto \x => checks \X => uncheck
"Plug 'vim-voom/VOoM'" 2 pane editor for markdown, asciidoc and others

" ## PHP

" ### SYNTAX
Plug 'StanAngeloff/php.vim', { 'for': 'php' } " Syntax
Plug 'evidens/vim-twig'                       " twig template

let php_sql_query=1
let php_htmlInStrings=1
let php_folding=0
let g:PHP_default_indenting = 0
let g:PHP_outdentphpescape  = 0

" ### INDENT
" Fix indent of HTML in all PHP files -- basically adds
" indent/html.vim when outside of PHP block.
Plug '2072/PHP-Indenting-for-VIm'
      \| Plug 'captbaritone/better-indent-support-for-php-with-html'

" ### COMPLETE
" Plug 'm2mdas/phpcomplete-extended', { 'for': 'php' }
" autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP

" ### LINT
let g:syntastic_php_checkers=['php', 'phpcs']

" ### DEBUG
Plug 'joonty/vdebug' "debugger integration
let g:vdebug_options = {}
" define this options per projet :
"let g:vdebug_options["port"] = 9009
"let g:vdebug_options["path_maps"] = {
"\    "/var/www": "/home/lxc/.../var/www"
"\}
"let g:vdebug_options['server'] = "local LXC IP"

" # GUI

" ## BUFFER
set background=dark
set cursorline "highlight current line
set relativenumber "line numbers relative to current line
set number " adds line number to the current line

Plug 'nathanaelkane/vim-indent-guides' "Show indent guides
let g:indent_guides_enable_on_vim_startup = 1

" ## custom colors for indents
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=black
" autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=darkgrey

Plug 'tyru/current-func-info.vim' " display current function

" ## THEME
Plug 'goatslacker/mango.vim'
if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif
" let g:solarized_termcolors=256
" Plug 'altercation/vim-colors-solarized'

" ## FONT
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Monospace\ 9

    "removes toolbars
    ":set guioptions-=m  "remove menu bar
    :set guioptions-=T  "remove toolbar
  endif
endif

" ## CURSOR
" different cursor shape in insert mode
silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
if has("autocmd")
  au InsertEnter * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
  au InsertLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
  au VimLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
endif

" ## STATUS LINE
Plug 'bling/vim-airline' "footer line
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled=1

" ## ICONS
" Plug 'ryanoasis/vim-devicons'
" set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete\ 11

" ## WINDOWS
" changes windows size with num pag + and -
" if bufwinnr(1)
"   map <kMinus> :10winc <<CR>
"   nmap <silent> <C-Right> :10winc ><CR>
" endif

call plug#end()

colorscheme mango
" colorscheme solarized

