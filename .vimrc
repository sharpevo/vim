" This must be first, since it changes other options as side effect.
set nocompatible " use vim defaults instead of 100% vi compatibily

filetype off " force reloading after pathogen loaded

" Use pathogen to easily modify the runtime path to include all the plugins
" under the ~/.vim/bundle directory
call pathogen#infect()
call pathogen#helptags()

let mapleader=',' " change he mapleader from / to ,


filetype plugin indent on " enable detection, plugins and indenting in one step

" hide buffers instead of closing them. So we can have unwritten changes to
" a file and open a new file using :e without being forced to write or undo
" changes first.
set hidden

set showmode
set nowrap " don't wrap lines
set tabstop=4
set softtabstop=4 " pretend to remove a tab even if spacets when hitting <BS>
set shiftwidth=4 " number of spaces to use for each step of indent
set shiftround " use multiple of shiftwidth when indenting with '<' or '>'
set backspace=indent,eol,start " allow backspacing over everything in insert mode.
set noautoindent " turn off by default, enabled by specific filetypes
set nosmartindent
set nocindent
set copyindent " copy the previous indention on autoindenting
set number " show line numbers
set showmatch " set show matching parenthesis
set ignorecase " ignore case when searching
set smartcase " ignore case if search pattern is all lowercase, case-sensitive otherwise
set smarttab " insert tabs on the start of a line according to shiftwidth not tabstop
set hlsearch
set incsearch " find as you type search
set gdefault " search/replace globally on a line by default
set mouse=a " enable mouse
set lazyredraw " don't update the display while excuting macros
set laststatus=2 " always show statusline even if there is only one window
set cmdheight=2 " use a status bar that is 2 rows high
set background=dark
set cursorcolumn
set cursorline
set expandtab " tabs are coverted to spaces
set numberwidth=4 " line numbering takes up 5 spaces
set ttyfast " smoother changes
set colorcolumn=85 " show a colored column at character 85

" history
set history=1000 " remember more commands and search history
set undolevels=1000 " use many levels of undo

set title " changes the terminal title
set visualbell " don't beep
set noerrorbells " don't beep

" no backup files. they did that in 70's, and now using git.
set nobackup
set noswapfile

set wildmenu " make tab completion for files/buffers act like bash.
set wildmode=list:full " show a list when pressing tab and complete first full match
set wildignore=*.swp,*.bak,*.pyc,*.class

" suffixes that get lower priority when doing tab completion for filenames.
" these are files we are not likely to edit or read
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

set showcmd " show partial command in the last line of screen, also show visual selection info
set nomodeline " security measure
set cursorline "underline the currentline for quick orientation

" Whitespace is important in python.
" This wil make vim set out tab, trailing whitespace, invisible spaces, and mark lines that
" extends off-screen with #.
set nolist
set listchars=tab:>.,trail:.,extends:#,nbsp:.
" and disable in other filetype, e.g. html
autocmd filetype html,xml set listchars-=tab:>.
autocmd filetype python set list

" Switch to paste mode, disabling all kinds of smartness and just paste a
" whole buffer of text
set pastetoggle=<F2>

set fileformats="unix,dos,mac"
set formatoptions+=1 " when wrapping paragraphs, don't end lines with 1-letter words.

au FocusLost * :wa " save when focus lost


" keybindings

" search use normal regex instead of vim crazy default regex charactors
nnoremap / /\v
vnoremap / /\v

" speed up scrolling of the viwport slightly
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>

" make ; working like : without holding shift
nnoremap ; :
nnoremap <leader>; ;
vnoremap ; :

" Use Q to format current paragraph para
vmap Q gq
nmap Q gqap

" jumps the cursor 'over' the current line to the next line. useful in long
" lines with line wrapping
nnoremap j gj
nnoremap k gk

" Use shift-H and shift-L for move to beginning/end
nnoremap H 0
nnoremap L $

" easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" complete whole line/filenames with a quicker shortcut key in insert mode
inoremap <C-f> <C-x><C-f>
inoremap <C-l> <C-x><C-l>

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e ~/.vimrc<CR>
nmap <silent> <leader>sv :so ~/.vimrc<CR>

" clear highlight search
nmap <silent> <leader>/ :nohlsearch<CR>

" pull word undercursor into LHS of a substitute for quick search and replace
nnoremap <leader>z :%s#\<<C-r>=expand("<cword>")<CR>\>#

" Reselect text that was just pasted with ,v
nnoremap <leader>v V`]

" keep search matches in the middle of window and pulse the line when moving
" to them
nnoremap n n:call PulseCursorLine()<cr>
nnoremap N N:call PulseCursorLine()<cr>

" quickly get out of inseart mode
inoremap jj <Esc>

" strip all trailing whitespace from a file
nnoremap <leader>W :%s/\s\+$//<CR>:let @/=''<CR>

" write file if we forgot to sudo before editing it
cmap w!! w !sudo tee %  >/dev/null


" python

" PEP8 compliance (set 1 tab = 4 chars explicitly, even if set
" earlier, as it is important)
autocmd filetype python setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
autocmd filetype python setlocal textwidth=78
autocmd filetype python match ErrorMsg '\%>120v.\+'

" But disable autowrapping as it is super annoying
autocmd filetype python setlocal formatoptions-=t

" Python runners
autocmd filetype python noremap <buffer> <F5> :w<CR>:!python2 %<CR>
autocmd filetype python inoremap <buffer> <F5> <Esc>:w<CR>:!python2 %<CR>
autocmd filetype python noremap <buffer> <S-F5> :w<CR>:!ipython2 %<CR>
autocmd filetype python inoremap <buffer> <S-F5> <Esc>:w<CR>:!ipython2 %<CR>

" Automatic insertion of breakpoints
autocmd filetype python nnoremap <buffer> <leader>bp :normal Oimport pdb; pdb.set_trace()<Esc>

" Toggling True/False
autocmd filetype python nnoremap <silent> <C-t> mmviw:s/True\\|False/\={'True':'False','False':'True'}[submatch(0)]/<CR>`m:nohlsearch<CR>

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

" yank from the cursor to the end of the line, to be consistent with C and D
nnoremap Y y$

" yank/paste to the OS clipboard with ,y and ,p
nnoremap <leader>y "+y
nnoremap <leader>Y "+yy
nnoremap <leader>p "+p
nnoremap <leader>P "+P

" code folding options
nmap <leader>f0 :set foldlevel=0<CR>
nmap <leader>f1 :set foldlevel=1<CR>
nmap <leader>f2 :set foldlevel=2<CR>
nmap <leader>f3 :set foldlevel=3<CR>
nmap <leader>f4 :set foldlevel=4<CR>

nmap <leader>a :Tabularize /
vmap <leader>a :Tabularize /

" changing working directory to that of the current file
cmap cwd lcd %:p:h
cmap cd. lcd %:p:h
