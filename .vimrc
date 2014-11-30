" Pathogen
filetype off " Pathogen needs to run before plugin indent on
execute pathogen#infect()
if has("gui_running")
  if has("gui_win32")
	source $VIMRUNTIME/bundle/snipMate/plugin/snipMate.vim
	source $VIMRUNTIME/bundle/snipMate/ftplugin/html_snip_helper.vim
	source $VIMRUNTIME/bundle/snipMate/after/plugin/snipMate.vim
  endif
endif
call pathogen#runtime_append_all_bundles()
call pathogen#helptags() " generate helptags for everything in 'runtimepath'
filetype plugin indent on

set number
set si
set autoindent
" set sw=4
set ts=4

set nocp	" non vi compatible
set omnifunc=syntaxcomplete#Complete

" closetag
au Filetype html,css,xml,xsl,js,php,c,cpp source ~/.vim/bundle/closetag/closetag.vim

" ---
au BufRead *.php set ft=php.html
au BufNewFile *.php set ft=php.html
au BufRead *.html set ft=php.html
au BufNewFile *.php set ft=php.html

" mozna ddoac na koncu <CR>
autocmd BufEnter  *.cpp map<F4> :!g++ % -o %:r
autocmd BufEnter  *.cpp map<F5> :!g++ -std=c++11 % -o %:r
autocmd BufEnter  *.cpp map<F6> :!./%:r<CR>

autocmd BufEnter  *.c map<F3> :!gcc % -lGL -lglut -lGLU -o %:r
autocmd BufEnter  *.c map<F4> :!gcc % -o %:r
autocmd BufEnter  *.c map<F5> :!clear <CR>
autocmd BufEnter  *.c map<F6> :!./%:r<CR>

autocmd BufEnter  *.tex map<F4> :!pdflatex %
autocmd BufEnter  *.tex map<F6> :!gnome-open test.pdf<CR>

autocmd BufEnter  *.js,*.html   map<F4> :!rhino %
autocmd BufEnter  *.html map<F5> :!firefox % &
autocmd BufEnter  *.html map<F6> :!refrbrows.sh

autocmd BufEnter  *.php map<F5> :!firefox % &
autocmd BufEnter  *.php map<F6> :!refrbrows.sh

if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
	colors desert
	set bg=dark
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    "set guifont=Consolas:h11:cANSI
	set gfn=courier_new:h14:b
	"set encoding=cp1250
	"set encoding=iso-8859-2
	set encoding=utf8
	colors default
	set bg=dark
  endif
endif

"set gfn=Inconsolata\ 12

" set expandtab
" set smarttab
set nowrap

" remap jj to escape
inoremap jj <Esc>
nnoremap JJJJ <Nop>

" Wygodniejsze poruszanie sie po oknach CTRL + h/j/k/l
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" syntax on
autocmd Syntax html,css,php,js,xml setlocal foldmethod=indent
"set foldmethod=syntax
"set foldlevelstart=1


autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

"setlocal spell spelllang=pl
"tylko dla plików tex
"au BufReadPost *.tex setlocal spell spelllang=pl 
