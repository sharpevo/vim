
" settings from /usr/share/vim/vimfiles/archlinux.vim
set nocompatible " use vim defaults instead of 100% vi compatibily
set backspace=indent,eol,start " more powerful backspacing
set ruler " show the cusor position all the time
set history=50 " keep 50 lines of command line history
" suffixes that get lower priority when doing tab completion for filenames.
" these are files we are not likely to edit or read
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

set background=dark
set backspace=2
set cursorcolumn
set cursorline
set expandtab " tabs are coverted to spaces
set hlsearch
set ignorecase " ignore case when searching
set incsearch " find as you type search
set ls=2 " always show status line
set modeline " last lines in document sets vim mode
set modelines=3
set mouse=a " enable mouse
set nobackup
set nostartofline " don't jump to first character while paging
set nowrap
set number " show line numbers
set numberwidth=4 " line numbering takes up 5 spaces
set shiftwidth=4 " number of spaces to use for each step of indent
set showcmd " display incomplete command
set smartcase
set tabstop=4
set textwidth=0 " disable auto wrap 
set ttyfast " smoother changes

filetype plugin indent on
set noautoindent " turn off by default, enabled by specific filetypes
set nosmartindent
set nocindent

syntax on
"let g:solarized_termcolors=256 " for solarized theme without solarized terminal color in xresource.
"let g:hybrid_use_Xresources = 1 " for bybrid theme 
colorscheme solarized
" 1.red, 2.yellowgreen, 3.brown 4.blue, 5.pink, 6.cyan, 7.white
hi StatusLine ctermbg=16 ctermfg=45
set statusline=%F%m%r%h%w\ [TYPE=%Y\ %{&ff}]\ (%l,%c)\ %p%%
au FileType py,sh,java,pl,c set autoindent
au FileType py,sh,java,pl,c set smartindent
au FileType py,sh,java,pl,c set textwidth=87

let mapleader=','
" make ; working like : without holding shift
nnoremap ; :
vnoremap ; :
" yank from the cursor to the end of the line, to be consistent with C and D
nnoremap Y y$

" code folding options
nmap <leader>f0 :set foldlevel=0<CR>
nmap <leader>f1 :set foldlevel=1<CR>
nmap <leader>f2 :set foldlevel=2<CR>
nmap <leader>f3 :set foldlevel=3<CR>
nmap <leader>f4 :set foldlevel=4<CR>

nmap <leader>t :Tabularize /
vmap <leader>t :Tabularize /
" clear highlight search
nmap <silent> <leader>/ :nohlsearch<CR>

" changing working directory to that of the current file
cmap cwd lcd %:p:h
cmap cd. lcd %:p:h
