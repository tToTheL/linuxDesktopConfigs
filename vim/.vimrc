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


" ## python
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






" # general config

" enable spelling by default
set spell

" allow opening buffers without saving current buffer
set hidden

" set the current working directory to that of the current file
autocmd BufEnter * silent! lcd %:p:h

" create a visual column at 81+
let &colorcolumn=join(range(81,999),",")

" set my language, Canadian English
set spelllang=en_ca

" this works with the key mapping below. It suppresses warnings about
" the file permissions being changed since last opening
" It probably also suppresses more warning than just that
set autoread

" execute the current file (needs execute permissions and shebang)
nnoremap <F9> :!chmod u+x %:p<cr> :!%:p<cr>

" relative line numbers
autocmd InsertEnter * :set nornu
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

" save and enter normal mode with <F2>
map <F2> :w!<CR>
imap <F2> <esc>:w! <CR>

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
colorscheme molokai

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












" vim --version
" VIM - Vi IMproved 7.4 (2013 Aug 10, compiled Feb 15 2014 13:22:06)
" Included patches: 1-182
" Compiled by tory@torysComputer
" Huge version with GTK2-GNOME GUI.  Features included (+) or not (-):
" +acl             +farsi           +mouse_netterm   +syntax
" +arabic          +file_in_path    +mouse_sgr       +tag_binary
" +autocmd         +find_in_path    -mouse_sysmouse  +tag_old_static
" +balloon_eval    +float           +mouse_urxvt     -tag_any_white
" +browse          +folding         +mouse_xterm     -tcl
" ++builtin_terms  -footer          +multi_byte      +terminfo
" +byte_offset     +fork()          +multi_lang      +termresponse
" +cindent         +gettext         -mzscheme        +textobjects
" +clientserver    -hangul_input    +netbeans_intg   +title
" +clipboard       +iconv           +path_extra      +toolbar
" +cmdline_compl   +insert_expand   -perl            +user_commands
" +cmdline_hist    +jumplist        +persistent_undo +vertsplit
" +cmdline_info    +keymap          +postscript      +virtualedit
" +comments        +langmap         +printer         +visual
" +conceal         +libcall         +profile         +visualextra
" +cryptv          +linebreak       -python          +viminfo
" +cscope          +lispindent      +python3         +vreplace
" +cursorbind      +listcmds        +quickfix        +wildignore
" +cursorshape     +localmap        +reltime         +wildmenu
" +dialog_con_gui  -lua             +rightleft       +windows
" +diff            +menu            -ruby            +writebackup
" +digraphs        +mksession       +scrollbind      +X11
" +dnd             +modify_fname    +signs           -xfontset
" -ebcdic          +mouse           +smartindent     +xim
" +emacs_tags      +mouseshape      -sniff           +xsmp_interact
" +eval            +mouse_dec       +startuptime     +xterm_clipboard
" +ex_extra        +mouse_gpm       +statusline      -xterm_save
" +extra_search    -mouse_jsbterm   -sun_workshop    +xpm
"    system vimrc file: "$VIM/vimrc"
"      user vimrc file: "$HOME/.vimrc"
"  2nd user vimrc file: "~/.vim/vimrc"
"       user exrc file: "$HOME/.exrc"
"   system gvimrc file: "$VIM/gvimrc"
"     user gvimrc file: "$HOME/.gvimrc"
" 2nd user gvimrc file: "~/.vim/gvimrc"
"     system menu file: "$VIMRUNTIME/menu.vim"
"   fall-back for $VIM: "/usr/local/share/vim"
" Compilation: gcc -c -I. -Iproto -DHAVE_CONFIG_H -DFEAT_GUI_GTK  -pthread -I/usr/include/gtk-2.0 -I/usr/lib/x86_64-linux-gnu/gtk-2.0/include -I/usr/include/atk-1.0 -I/usr/include/cairo -I/usr/include/gdk-pixbuf-2.0 -I/usr/include/pango-1.0 -I/usr/include/gio-unix-2.0/ -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/freetype2 -I/usr/include/libpng12 -I/usr/include/harfbuzz   -pthread -DORBIT2=1 -D_REENTRANT -I/usr/include/libgnomeui-2.0 -I/usr/include/libart-2.0 -I/usr/include/gconf/2 -I/usr/include/gnome-keyring-1 -I/usr/include/libgnome-2.0 -I/usr/include/libbonoboui-2.0 -I/usr/include/libgnomecanvas-2.0 -I/usr/include/gtk-2.0 -I/usr/include/gdk-pixbuf-2.0 -I/usr/include/gnome-vfs-2.0 -I/usr/lib/x86_64-linux-gnu/gnome-vfs-2.0/include -I/usr/include/dbus-1.0 -I/usr/lib/x86_64-linux-gnu/dbus-1.0/include -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I/usr/include/orbit-2.0 -I/usr/include/libbonobo-2.0 -I/usr/include/bonobo-activation-2.0 -I/usr/include/libxml2 -I/usr/include/pango-1.0 -I/usr/include/gail-1.0 -I/usr/include/harfbuzz -I/usr/include/freetype2 -I/usr/include/atk-1.0 -I/usr/lib/x86_64-linux-gnu/gtk-2.0/include -I/usr/include/cairo -I/usr/include/gio-unix-2.0/ -I/usr/include/pixman-1 -I/usr/include/libpng12     -g -O2 -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=1      
" Linking: gcc   -L/usr/local/lib -Wl,--as-needed -o vim   -lgtk-x11-2.0 -lgdk-x11-2.0 -latk-1.0 -lgio-2.0 -lpangoft2-1.0 -lpangocairo-1.0 -lgdk_pixbuf-2.0 -lcairo -lpango-1.0 -lfreetype -lfontconfig -lgobject-2.0 -lglib-2.0     -lgnomeui-2 -lSM -lICE -lbonoboui-2 -lgnomevfs-2 -lgnomecanvas-2 -lgnome-2 -lpopt -lbonobo-2 -lbonobo-activation -lORBit-2 -lart_lgpl_2 -lgtk-x11-2.0 -lgdk-x11-2.0 -latk-1.0 -lgio-2.0 -lpangoft2-1.0 -lpangocairo-1.0 -lgdk_pixbuf-2.0 -lcairo -lpango-1.0 -lfreetype -lfontconfig -lgconf-2 -lgthread-2.0 -lgmodule-2.0 -lgobject-2.0 -lglib-2.0   -lSM -lICE -lXpm -lXt -lX11 -lXdmcp -lSM -lICE  -lm -ltinfo -lnsl  -lselinux  -lacl -lattr -lgpm -ldl     -L/usr/lib/python3.3/config-3.3m-x86_64-linux-gnu -lpython3.3m -lpthread -ldl -lutil -lm     
" 
