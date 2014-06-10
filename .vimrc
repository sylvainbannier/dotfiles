set shell=/bin/bash
set clipboard^=unnamed
set smartindent
"set expandtab
filetype on
filetype plugin on
filetype indent on
set autoindent 
set cindent 
set tabstop=4 
set shiftwidth=4 
set relativenumber
set number
set backup

"case insentivie searches
set ignorecase
set smartcase
set showmatch
set hlsearch

if has("gui_running")
	if has("gui_gtk2")
		set guifont=Monospace\ 9

		"CTRL Z to cancel
		noremap <C-Z> u
		inoremap <C-Z> <c-o>u

		"removes toolbars
		":set guioptions-=m  "remove menu bar
		:set guioptions-=T  "remove toolbar
	endif
endif

" Highlight all instances of word under cursor, when idle.
" Useful when studying strange source code.
" Type z/ to toggle highlighting on/off.
nnoremap z/ :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>
function! AutoHighlightToggle()
let @/ = ''
if exists('#auto_highlight')
au! auto_highlight
augroup! auto_highlight
setl updatetime=4000
echo 'Highlight current word: off'
return 0
else
augroup auto_highlight
  au!
  au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
augroup end
setl updatetime=500
echo 'Highlight current word: ON'
return 1
endif
endfunction
"AutoHighlightToggle()

"load desert colors
colo desert

call pathogen#infect()
call pathogen#helptags()

"SAUVEGARDE CTRL+S
" If the current buffer has never been saved, it will have no name,
" call the file browser to save it, otherwise just save it.
command -nargs=0 -bar Update if &modified 
					   \|    if empty(bufname('%'))
					   \|        browse confirm write
					   \|    else
					   \|        confirm write
					   \|    endif
					   \|endif
nnoremap <silent> <C-S> :<C-u>Update<CR>
inoremap <c-s> <c-o>:Update<CR>

" open NerdTree in current directory
"function! StartUp()
"if 0 == argc()
	"NERDTree
"end
"endfunction
"autocmd VimEnter * call StartUp()

" CTRL-X and SHIFT-Del are Cut
vnoremap <C-X> "+x
vnoremap <S-Del> "+x

" CTRL-C and CTRL-Insert are Copy
vnoremap <C-C> "+y
vnoremap <C-Insert> "+y

" CTRL-V and SHIFT-Insert are Paste
map <C-V>   	"+gP
map <S-Insert>  	"+gP

cmap <C-V>  	<C-R>+
cmap <S-Insert> 	<C-R>+

" select with shift+arrow
imap <S-Up> <Esc>v
imap <S-Down> <Esc>v
imap <S-Right> <Esc>v
imap <S-Left> <Esc>v

nmap <S-Up> v
nmap <S-Down> v
nmap <S-Right> v
nmap <S-Left> v

vmap <S-Up> k
vmap <S-Down> j
vmap <S-Right> W
vmap <S-Left> B

"search higlighted word il all files
map <C-h> :execute "lvimgrep /" . expand("<cword>") . "/j **" <Bar> lopen<CR>

" allows to change buffer without saving
:set hidden


" Pasting blockwise and linewise selections is not possible in Insert and
" Visual mode without the +virtualedit feature.  They are pasted as if they
" were characterwise instead.
" Uses the paste.vim autoload script.

exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']

imap <S-Insert> 	<C-V>
vmap <S-Insert> 	<C-V>

" Use CTRL-Q to do what CTRL-V used to do
noremap <C-Q>   	<C-V>

" undo toggle shortcut
nnoremap <F5> :GundoToggle<CR>
inoremap <F5> <c-o>:GundoToggle<CR>

"JS beautify
noremap <C-F> g:Jsbeautify()

" ignore directories in vimgrep
set wildignore+=*/tmp/*,*/dist/*,*.so,*.swp,*.zip,*/bower_components/*,.git/*,.svn/*,node_modules/*,coverage/*,phonegap/*,test-results.xml

" Adds NerdTree toggle 

"nnoremap <F6> :NERDTreeToggle<CR>
"inoremap <F6> :NERDTreeToggle<CR>
"ouvre le fichier dans nerdTree
"noremap <C-o> :NERDTreeFind<CR>
"map <F6> :NERDTreeFind<CR>

" returns true iff is NERDTree open/active
fun! IsNTOpen()        
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" either find current file in NERDTree or open NERDtree
fun! ToggleAndSyncTree()
	if IsNTOpen()
		NERDTreeToggle
	else
		NERDTreeFind
	endif
endfunction

"autocmd BufEnter * call rc:syncTree()
nnoremap <F6> :call ToggleAndSyncTree()<CR>
inoremap <F6> :call ToggleAndSyncTree()<CR>

" Highlight currently open file in nerdtree
" see http://superuser.com/a/474298/175466
" see http://superuser.com/a/509721/175466
 
" returns true iff is NERDTree open/active
function! rc:isNTOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction
 
" returns true iff focused window is NERDTree window
function! rc:isNTFocused()
  return -1 != match(expand('%'), 'NERD_Tree') 
endfunction
 
" returns true iff focused window contains a file in current pwd
function! rc:isInsideCwd()
  return -1 != stridx(expand('%:p'), getcwd())
endfunction
 
 
" calls NERDTreeFind iff NERDTree is active, current window contains a modifiable file, and we're not in vimdiff
function! rc:syncTree()
  if &modifiable && rc:isNTOpen() && !rc:isNTFocused() && strlen(expand('%')) > 0 && !&diff && rc:isInsideCwd()
    NERDTreeFind
    wincmd p
  endif
endfunction
 
autocmd BufEnter * call rc:syncTree()

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
" home key gets bacj to line begining first
noremap <expr> <silent> <Home> col('.') == match(getline('.'),'\S')+1 ? '0' : '^'
imap <silent> <Home> <C-O><Home>

" ctrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_extensions = ['buffertag', 'tag', 'line', 'dir']
imap <C-p> <Esc :CtrlP<CR><F5> 

let g:tagbar_width = 20
let g:tagbar_autofocus = 1 
nmap <F8> :TagbarToggle<CR>
set tags=./tags,tags;/
let g:tagbar_type_css = {
\ 'ctagstype' : 'css',
    \ 'kinds'     : [
        \ 'c:classes',
        \ 's:selectors',
        \ 'i:identities'
    \ ]
\ }


let g:tagbar_type_javascript = {
\ 'ctagstype' : 'JavaScript',
    \ 'kinds'     : [
        \ 'o:object:0:1',
        \ 'f:function:0:1',
        \ 's:string',
        \ 'c:controller:0:1',
        \ 't:scope variable',
        \ 'a:array'
    \ ]
\ }

let g:tagbar_autopreview = 1

" automatically opens tabbar
"autocmd VimEnter * nested :call tagbar#autoopen(1)
"autocmd FileType * nested :call tagbar#autoopen(0)
"autocmd BufEnter * nested :call tagbar#autoopen(0)

" ulstisnips shortcut
let g:UltiSnipsExpandTrigger="<c-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"http://vim.wikia.com/wiki/When_jumping_on_a_tag,_automatically_split_the_window_if_the_current_buffer_has_been_modified
"
"When jumping on a tag, automatically split the window if the current buffer has been modified
fun! SPLITAG() range
  let oldfile=expand("%:p")
  if &modified
    split
  endif
  exe "tag ". expand("<cword>")
  let curfile=expand("%:p")
  if curfile == oldfile
    let pos=getpos(".")
    if &modified
      " if we have split before:
      quit
    endif
    call setpos('.', pos)
  endif
endfun
nmap <C-]> :call SPLITAG()<CR>z.
nmap <C-LeftMouse> :call SPLITAG()<CR>z.

"Opens VCS compare with last file version (in cache)
map <F7> :VCSVimDiff<CR>

" changes line color for insert mode
set cursorline
