



set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My bundles here:
"
" original repos on GitHub
"Bundle 'tpope/vim-fugitive'
"Bundle 'Lokaltog/vim-easymotion'
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
"Bundle 'tpope/vim-rails.git'
" vim-scripts repos
"Bundle 'L9'
"Bundle 'FuzzyFinder'
" non-GitHub repos
"Bundle 'git://git.wincent.com/command-t.git'
" Git repos on your local machine (i.e. when working on your own plugin)
"Bundle 'file:///Users/gmarik/path/to/plugin'
" ...

Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-fugitive'
"Bundle 'tomasr/molokai'

" pylint, rope, pydoc, pyflakes, pep8, and mccabe
Bundle 'tToTheL/python-mode'
filetype plugin indent on     " required!





""""""""""""""""""""""""""""""""""""""""""""""""""""""""""'
" Notes
" don't forget to do something about whitespace

" let g:pymode_python = 'python3'



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

" vertical line at column 80
" set colorcolumn=80
" highlight ColorColumn ctermbg=123

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

" make serach case insensitive
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
set guioptions-=r  " rmove right-hand sroll bar
set guioptions-=L  " remove left-hand scroll bar

set guiheadroom=0

" save and enter normal mode with <F2>
map <F2> :w!<CR>
imap <F2> <esc>:w! <CR>


" allow for copy pasting between vim and other applications
" like a sane person.
set pastetoggle=<F10>
inoremap <c-v> <F10><c-r>+<F10>
vnoremap <c-c> "+y

" enabling this would for example, use the system clipboard
" while yanking
" set clipboard=unnamedplus

" another way to get to normal mode
inoremap <c-j> <ESC>


set backspace=2 " make backspace work like most other apps

" ############### nerdtree filesystem explorer ###################
" load with vundule

" shortcut to toggle nerdtree, also mirrors with other tabs
map <C-e> :NERDTreeToggle<CR>:NERDTreeMirror<CR>

" Allow a file from NERDTree to be opened with a single click
let NERDTreeMouseMode = 3

" after opening a file from NERDTree don't close NERDTree
let NERDTreeQuitOnOpen = 0



" let g:pymode_rope = 0
let g:pymode_rope_lookup_project = 0 


" ################# ctrlp ##################################

" initiate ctrlp
let g:ctrlp_map = '<C-p>'

" not sure
let g:ctrlp_cmd = 'CtrlP'


" #################### fugitive (GIT helper) ###################


" ################ molokai color scheme #######################
" load with vundle

" apply the colour scheme
colorscheme molokai

" not sure what all these do
"set background=dark
"let g:molokai_original = 1
"let g:rehash256 = 1

" ###################### some indenting business ##############
" these comments options don't seem to work on all file types
" does not work on this file, but does work on a blank file
" http://vimdoc.sourceforge.net/htmldoc/change.html#format-comments
" comma seperated list
""set comments = ""

" python comments, each new line gets a #
"set comments=:#
"
"" javascript comments, each new line gets //
"set comments+=://
"
"" bullet list comments, - or * does not repeat, space 
"" after required
set comments=b:*
"set comments+=fb:-
"
"" vim comments, " repeats
"" set comments+=:\"
"
"

"set comments=:#

"set autoindent 
set formatoptions=tnr
"set formatoptions-=c
"
set formatlistpat=^\\s*\\(\\d\\\|[-*]\\)\\+[\\]:.)}\\t\ ]\\s*
"set formatlistpat=^\\s*[0-9*]\\+[\\]:.)}\\t\ ]\\s*
"set formatoptions=rtqcn



set autoindent







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
