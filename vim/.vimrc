" the nice thing about using an F* key as a leader is that it works in
" insert mode too, but allow \ too!
let mapleader = "\\"
nmap <F8> \

" # Things required by vunlde
set nocompatible              " be iMproved
filetype off                  " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" # My Bundles

" ## general

" file explorer
Bundle 'scrooloose/nerdtree'

" access buffers and files
Bundle 'kien/ctrlp.vim'

" git integration
Bundle 'tpope/vim-fugitive'

" checks syntax
Bundle 'scrooloose/syntastic'

" need to learn more about it
Bundle 'tpope/vim-surround'

" tab completion
Bundle 'ervandew/supertab'

" multiple cursors. Basic usage: select something, press ctrl+n to slect the
" next occurence, press "c" then type
" ctrl-x to get out
Bundle 'terryma/vim-multiple-cursors'

" status line of sorts
Bundle 'bling/vim-airline'

"
" Bundle 'Rykka/easydigraph.vim'


Bundle 'Lokaltog/vim-easymotion'


" expand html shortcuts. For example typing strong{I am bold} and then
" <c-y>, will expand to <strong>I am bold</strong>
" and that just scratches the surface
" I have mapped <c-y>y to <c-y>, because hitting the comma at the end was pretty
" difficult.
" http://docs.emmet.io/abbreviations/syntax/
Bundle 'mattn/emmet-vim'

" making closing html tags easier. Basic usage ctrl+x /
" Bundle 'tpope/vim-ragtag'


" Bundle "MarcWeber/vim-addon-mw-utils"
" Bundle "tomtom/tlib_vim"
" Bundle 'garbas/vim-snipmate'
" Bundle "honza/vim-snippets"

" tab completion of snippets
Bundle "sirver/ultisnips"
" ultisnips definitions
Bundle 'honza/vim-snippets'


Bundle "vim-scripts/taglist.vim"

" ## python

" visual indent
Bundle 'nathanaelkane/vim-indent-guides'

" python code completion
Bundle 'davidhalter/jedi-vim'

" merged into syntastic?
" Bundle 'mitechie/pyflakes-pathogen'

" access python documentation <leader>pw when the cursor is above a word
Bundle 'fs111/pydoc.vim'

" does pep8 checking of code using <F5>
Bundle 'vim-scripts/pep8.git'

" # required by vunlde
filetype plugin indent on







" # comments/lists/indenting
" http://vimdoc.sourceforge.net/htmldoc/change.html#format-comments

" clear comments
" python comments, each new line gets a #
set comments=b:#

"" bullet list comments, - or * does not repeat, space
"" after required
set comments+=b:*
set comments+=fb:-
set comments+=b://
set comments+=b:\"

set formatoptions=tnrc
set formatlistpat=^\\s*\\(\\d\\\|[-*#]\\)\\+[\\]:.)}\\t\ ]\\s*
set autoindent


" esc
imap jj <Esc>



" # general config

" enable spelling by default
set spell

" allow opening buffers without saving current buffer
set hidden

" set the current working directory to that of the current file
autocmd BufEnter * silent! lcd %:p:h

" create a visual column at 81+
"if has("gui_running")
    " let &colorcolumn=join(range(81,999),",")
"endif

" set my language, Canadian English
set spelllang=en_ca

" this works with the key mapping below. It suppresses warnings about
" the file permissions being changed since last opening
" It probably also suppresses more warning than just that
set autoread

" execute the current file (needs execute permissions and shebang)
nnoremap <F9> :!chmod u+x %:p<cr> :!%:p<cr>

" relative line numbers
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" line numbering
set number

" allow mouse usage
set mouse=a

" set Canadian English
set spelllang=en_ca

" move around window splits
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" indent or unindent highlighted blocks of code
vnoremap < <gv
vnoremap > >gv

" syntax highlighting
filetype off
filetype plugin indent on
syntax on

" more history
set history=700

" more undo history
set undolevels=700

" deal with tabbing and indentation
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" make search case insensitive and highlight
set hlsearch
set incsearch
set ignorecase
set smartcase

" get rid of backup files, keep things clean
set nobackup
set nowritebackup
set noswapfile

" make gvim more like the terminal vim
set guioptions-=m  " remove menu bar
set guioptions-=T  " remove toolbar
set guioptions-=r  " remove right-hand scroll bar
set guioptions-=L  " remove left-hand scroll bar

" possibly helps in some sort of border?
set guiheadroom=0

" show whitepsace
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.
set list

" save and enter normal mode with <F2>
map <F2> :w!<CR>
imap <F2> <esc>:w! <CR>
nnoremap <F2> my:%s/\s\+$//<CR>`y

function! StripTrailingWhitespace()
" Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " do the business:
    %s/\s\+$//e
    " clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

" allow for copy pasting between vim and other applications
" like a sane person.
set pastetoggle=<F10>
inoremap <c-v> <F10><c-r>+<F10>
vnoremap <c-c> "+y

" another way to get to normal mode
inoremap <c-j> <ESC>

" make backspace work like most other apps
set backspace=2

" colour scheme
"colorscheme molokai
colorscheme tutticolori

" indenting of a line. Feature already exists in normal mode, but I wanted
" it in insert mode, and added two more mappings for normal mode just for
" consistency. Thought pattern: i for indent. And u because it is the key
" to the left of i.
" the part of the map where you go back into insert mode might still need a
" bit of work
inoremap <c-i> <esc>:>><cr>a
inoremap <c-u> <esc>:<<<cr>a
nnoremap <c-i> :>><cr>
nnoremap <c-u> :<<<cr>

" text width of 80
set tw=80

" html files can be wider
autocmd FileType html set tw=0

" allow basic movement in insert mode
inoremap <c-H> <left>
inoremap <c-L> <right>

" disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>



autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))

" ################### Taglist #############################
nnoremap <silent> <F8> :TlistToggle<CR>
let Tlist_Use_Right_Window = 1


" ################### Indent Guides #######################
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1


" ################### easy motion #########################
map <Leader> <Plug>(easymotion-prefix)

" ################ ultisnips ##################################
let g:UltiSnipsJumpForwardTrigger = '<c-n>'
let g:UltiSnipsJumpBackwardTrigger = '<c-p>'


" ################ emmet #####################################
" easier expand key
imap <c-y>y <c-y>,
nmap <c-y>y <c-y>,



" ################# airline ###################################

set laststatus=2





" ############### jedi  ##########################################

" jedi-vim has the great feature of showing a function's signature when you
" open the parentheses, but it hides the above line. This will allow
" toggling of the feature.
inoremap <c-s> <esc>:call ToggleSig()<cr>a

function! ToggleSig()
    if g:jedi#show_call_signatures == 0
        let g:jedi#show_call_signatures = 1
    else
        let g:jedi#show_call_signatures = 0
    endif
endfunction


" ############### nerdtree filesystem explorer ###################
" load with vundule

" shortcut to toggle nerdtree, also mirrors with other tabs
map <C-e> :NERDTreeToggle<CR>:NERDTreeMirror<CR>

" Allow a file from NERDTree to be opened with a single click
let NERDTreeMouseMode = 3

" after opening a file from NERDTree don't close NERDTree
let NERDTreeQuitOnOpen = 0


" to fix that pymode is slow on typings '.'s
" let g:pymode_rope = 0
let g:pymode_rope_lookup_project = 0


" ################# ctrlp ##################################

" initiate ctrlp
let g:ctrlp_map = '<C-p>'

" show buffers by default instead of files
let g:ctrlp_cmd = 'CtrlPBuffer'

" open ctrlp files in current window
let g:ctrlp_open_new_file = 'r'











" how to compile
" install python dev stuff
" ./configure --enable-python3interp --enable-gui=auto --enable-gtk2-check --with-features=huge --with-x --enable-gnome-check --with-python3-config-dir=$(python3.4-config --configdir) --enable-multibyte
