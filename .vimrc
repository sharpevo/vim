
" settings from /usr/share/vim/vimfiles/archlinux.vim
set nocompatible " use vim defaults instead of 100% vi compatibily
set backspace=indent,eol,start " more powerful backspacing
set ruler " show the cusor position all the time
set history=50 " keep 50 lines of command line history
" suffixes that get lower priority when doing tab completion for filenames.
" these are files we are not likely to edit or read
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

set ls=2 " always show status line
set tabstop=4
set shiftwidth=4 " number of spaces to use for each step of indent
set expandtab " tabs are coverted to spaces
set showcmd " display incomplete command
set number " show line numbers
set numberwidth=4 " line numbering takes up 5 spaces
set hlsearch
set incsearch " find as you type search
set ignorecase " ignore case when searching
set smartcase
set backspace=2
set background=dark
set mouse=a " enable mouse
set nobackup
set cursorline
set cursorcolumn
set nowrap
set ttyfast " smoother changes
set modeline " last lines in document sets vim mode
set modelines=3
set nostartofline " don't jump to first character while paging

filetype plugin indent on
set noautoindent " turn off by default, enabled by specific filetypes
set nosmartindent
set nocindent

syntax on
"let g:solarized_termcolors=256 " if not use solarized color in xresource.
colorscheme solarized
" 1.red, 2.yellowgreen, 3.brown 4.blue, 5.pink, 6.cyan, 7.white
hi StatusLine ctermbg=black ctermfg=6
set statusline=%F%m%r%h%w\ [TYPE=%Y\ %{&ff}]\ [%l/%L\ (%p%%)
au FileType py,sh,java,pl,c set autoindent
au FileType py,sh,java,pl,c set smartindent

let mapleader=','
" make ; working like : without holding shift
nnoremap ; :
" yank from the cursor to the end of the line, to be consistent with C and D
nnoremap Y y$

" code folding options
nmap <leader>f0 :set foldlevel=0<CR>
nmap <leader>f1 :set foldlevel=1<CR>
nmap <leader>f2 :set foldlevel=2<CR>
nmap <leader>f3 :set foldlevel=3<CR>
nmap <leader>f4 :set foldlevel=4<CR>

" clear highlight search
nmap <silent> <leader>/ :nohlsearch<CR>

" changing working directory to that of the current file
cmap cwd lcd %:p:h
cmap cd. lcd %:p:h
