runtime! debian.vim

let g:skip_defaults_vim = 1
"let g:loaded_youcompleteme = 1
let g:ycm_filetype_blacklist = { 'vimshell': 1 }
let g:jedi#auto_initialization = 0


if has("syntax")
  syntax on
endif
"-----------------------PLUGINS-----------------------------------

"-------------------USER ADDED-----------------------------------
set clipboard=unnamedplus
"enables backspace to work
set backspace=indent,eol,start
" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark
set shortmess+=F
" Uncomment the following to have Vim jump to the last position when
" reopening a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
filetype plugin indent on

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set completeopt=menu,menuone,popup               "enable popup window
set completepopup=highlight:InfoPopup,border:off "configure the highlight group

"set cursorline		" highlight current line
set wildmenu		" auto complete command menu
set hlsearch		" highlight matches
hi Search ctermbg=DarkCyan
set tabstop=4
set shiftwidth=4
"set expandtab " makes tabs into spaces

set smartindent

"set autowrite		" Automatically save before commands like :next and :make
set hidden		" Hide buffers when they are abandoned
set number		" Show line numbers
set encoding=utf-8	" Encoding std
highlight LineNr ctermfg=DarkGrey


set foldenable 		" enable folding
set foldlevelstart=10 	" open most folds by default

inoremap ,. <esc>
nnoremap B ^		" Move beginning of line
nnoremap E $		" Move end of line
nnoremap $ <nop>	" eliminate $ use
nnoremap ^ <nop>	" eliminate ^ use
nnoremap M :call cursor(0, len(getline('.'))/2)<CR>
"set mouse=a		" Enable mouse usage (all modes)
"nnoremap <CR> :noh<CR><CR>
"

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

