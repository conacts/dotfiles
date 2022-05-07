if has("syntax")
  syntax on
endif

"------------------Essentials------------------------------------
set clipboard=unnamed	" Copies visual mode into mac clipboard
set background=dark 	" allows vim to adjust to a dark terminal screen
set tabstop=4			" max width of tab character
set shiftwidth=4		" width of tab character
set shortmess+=F 		" Deletes swapfile messages
set foldenable 			" enable folding
set foldlevelstart=10 	" open most folds by default
set hlsearch			" highlight matches
set showmatch			" Show matching brackets.
set ignorecase			" Do case insensitive matching
set smartcase			" Do smart case matching
set incsearch			" Incremental search
set number				" Show line numbers
set encoding=utf-8		" Encoding std
set showcmd				" shows (:) command history	
set wildmenu			" auto complete command (:) menu
set noswapfile			" stops vim from creating swapfiles
inoremap ,. <esc> 		" ,. ---> esc 
nnoremap B ^			" Move beginning of line
nnoremap E $			" Move end of line
nnoremap $ <nop>		" eliminate $ use
nnoremap ^ <nop>		" eliminate ^ use
nnoremap dE d$			" delete to end of word to d+E
vmap Y "+y  			" copies with shift+y
" set autoindent 			" indents each line like the last one || problem: when exiting insert mode you go to the line beneath
set smartindent 		" w/ autoindent guesses where you want indents like in python
filetype indent on 		" vim indents based on filetype
filetype plugin on 	
set scrolloff=8			" keeps your cursor a minimum of 8 spaces above the bottom of the screen
set hidden		" Hide buffers when they are abandoned & vim is unstable without

" Uncomment the following to have Vim jump to the last position when reopening a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

set autoread			" auto changes the file when edited outside of vim
au FocusGained,BufEnter * checktime " read above

command! W execute 'w !sudo tee % > /dev/null' <bar> edit! " sudo save

"enables backspace to work
set backspace=indent,eol,start

" Sets search highlighting to cyan
hi Search ctermbg=DarkCyan 
" line number dark grey
highlight LineNr ctermfg=DarkGrey 

"----------------------- Plugins -----------------------------------

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'preservim/nerdtree'
Plugin 'pangloss/vim-javascript'
call vundle#end()           

let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1

"----------------------- Testing ----------------------------------
set cmdheight=1			" Height of the command bar
set mouse=a				" tmux + vim scrolling ability

" Turns off backups and swapfiles
set nobackup
set nowb

set undofile " Maintain undo history between sessions
set undodir=~/.vim/undodir

" runs c++ command w/ Ctrl-C Ctrl-x
nnoremap <C-c> :!g++ -o %:r.out -std=c++11<Enter>
nnoremap <C-x> :!./%r.out

function! Comment()
	let ft = ""
	if &filetype ==# 'python'
		let ft = "# " 
	endif
	if &filetype ==# 'cpp'
		let ft = "// "
	endif
	call append(line('.'), ft . "--------------------- ---------------------------------")
endfunction
nnoremap <C-g> :call Comment()<CR>

"---------------------- End ---------------------------------------
" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif
