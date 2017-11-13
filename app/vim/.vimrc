""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" leader setup
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","
let g:mapleader = ","

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle setup
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required 
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" plugin on GitHub repo
Plugin 'https://github.com/davidhalter/jedi-vim.git'
Plugin 'https://github.com/tmhedberg/SimpylFold.git'
Plugin 'vim-airline/vim-airline' 
Plugin 'vim-airline/vim-airline-themes'
Plugin 'https://github.com/xolox/vim-misc.git'
Plugin 'https://github.com/xolox/vim-session.git'
Plugin 'https://github.com/scrooloose/nerdtree.git'
Plugin 'https://github.com/MattesGroeger/vim-bookmarks.git'

" All of your Plugins must be added before the following line
call vundle#end()            " requiredA
filetype plugin indent on    " required

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" pathogen setup
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call pathogen#infect()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer: 
"       Amir Salihefendic
"       http://amix.dk - amix@amix.dk
"
" Version: 
"       6.0 - 01/04/17 14:24:34 
"
" Blog_post: 
"       http://amix.dk/blog/post/19691#The-ultimate-Vim-configuration-on-Github
"
" Awesome_version:
"       Get this config, nice color schemes and lots of plugins!
"
"       Install the awesome version from:
"
"           https://github.com/amix/vimrc
"
" Syntax_highlighted:
"       http://amix.dk/vim/vimrc.html
"
" Raw_version: 
"       http://amix.dk/vim/vimrc.txt
"
" Sections:
"    -> General
"    -> VIM user interface
"    -> Colors and Fonts
"    -> Files and backups
"    -> Text, tab and indent related
"    -> Visual mode related
"    -> Moving around, tabs and buffers
"    -> Status line
"    -> Editing mappings
"    -> vimgrep searching and cope displaying
"    -> Spell checking
"    -> Misc
"    -> Helper functions
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" :W sudo saves the file 
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Avoid garbled characters in Chinese language windows OS
let $LANG='en' 
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch 

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch 
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Properly disable sound on errors on MacVim
if has("gui_macvim")
    autocmd GUIEnter * set vb t_vb=
endif


" Add a bit extra margin to the left
set foldcolumn=1



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable 

" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

try
    colorscheme desert
catch
endtry

set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l 

" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
map <leader>ba :bufdo bd<cr>

map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
map <leader>t<leader> :tabnext 

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()


" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
"set laststatus=2

" Format the status line
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scribble
map <leader>q :e ~/buffer<cr>

" Quickly open a markdown buffer for scribble
map <leader>x :e ~/buffer.md<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" => Nerdtree 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

inoremap <F1> <ESC>:NERDTreeToggle<CR>i
nnoremap <F1> :NERDTreeToggle<CR>
let NERDTreeBookmarksFile=expand("$HOME/.vim-NERDTreeBookmarks")
let NERDTreeShowBookmarks=1
"let NERDTreeMinimalUI = 1 
"let NERDTreeDirArrows = 1 
"let g:NERDTreeDirArrowExpandable = '+' 
"let g:NERDTreeDirArrowCollapsible = '-' 
map <leader>t t<F1><C-w><C-w>gT<C-w><C-w>gt
map <leader>c :NERDTreeFind<cr>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Bookmark
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <F3> :BookmarkToggle<CR>
inoremap <F3> <ESC>:BookmarkToggle<CR>
nnoremap <F4> :BookmarkNext<CR>
inoremap <F4> <ESC>:BookmarkNext<CR>

"Add/remove bookmark at current line            mm      :BookmarkToggle
"Add/edit/remove annotation at current line     mi      :BookmarkAnnotate <TEXT>
"Jump to next bookmark in buffer                mn      :BookmarkNext
"Jump to previous bookmark in buffer            mp      :BookmarkPrev
"Show all bookmarks (toggle)                    ma      :BookmarkShowAll
"Clear bookmarks in current buffer only         mc      :BookmarkClear
"Clear bookmarks in all buffers                 mx      :BookmarkClearAll
"Move up bookmark at current line               [count]mkk      :BookmarkMoveUp [<COUNT>]
"Move down bookmark at current line             [count]mjj      :BookmarkMoveDown [<COUNT>]
"Move bookmark at current line to another line  [count]mg       :BookmarkMoveToLine <LINE>
"Save all bookmarks to a file                   :BookmarkSave <FILE_PATH>
"Load bookmarks from a file                     :BookmarkLoad <FILE_PATH>"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" => Mine 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" auto reload file
set autoread

"no wrap line
set nowrap

"Close a tab
map <leader>q :tabc<cr>

"Jump to definition
map ] <C-]>
map [ <C-t>

"Page Up, Down
nnoremap <C-Down> <C-e><C-e><C-e><C-e><C-e><Down><Down><Down><Down><Down>
nnoremap <C-Up> <C-y><C-y><C-y><C-y><C-y><Up><Up><Up><Up><Up>
inoremap <C-Down> <ESC><C-e><C-e><C-e><C-e><C-e>i<Down><Down><Down><Down><Down>
inoremap <C-Up> <ESC><C-y><C-y><C-y><C-y><C-y>i<Up><Up><Up><Up><Up>
vnoremap <C-Up> kkk
vnoremap <C-Down> jjj

"comment python code
"vnoremap <leader>/ :s/^/#/<cr>:noh<cr>
"vnoremap <leader>. :s/^#//<cr>:noh<cr>

"NerdCommenter
vmap <leader>/ <leader>c<space>i

"go back to previous file
map fg <C-^>

"multiple indent
"vnoremap > ><CR>gv
"vnoremap < <<CR>gv
vnoremap <Tab> ><CR>gv
vnoremap <S-Tab> <<CR>gv

"next previous tab
inoremap <PageUp> <ESC>gTi
inoremap <PageDown> <ESC>gti
nnoremap <PageUp> gT
nnoremap <PageDown> gt

map <C-home> gg
map <C-end> G

" Add folding
"set fdn=1
"set fdm=indent
"set fdi="""

" python simple fold
let g:SimpylFold_docstring_preview = 1
"inoremap <F1> <C-O>za
"nnoremap <F1> za
"onoremap <F1> <C-C>za
"vnoremap <F1> zf
"inoremap <F12> <C-O>za
"nnoremap <F12> za
"onoremap <F12> <C-C>za
"vnoremap <F12> zf
inoremap <C-e> <C-O>za
nnoremap <C-e> za
onoremap <C-e> <C-C>za
vnoremap <C-e> zf

"enable mouse event
set mouse=a
nnoremap <F10> :set mouse=a<cr>
nnoremap <F10><F10> :set mouse=<cr>
inoremap <F10> <ESC>:set mouse=a<cr>i
inoremap <F10><F10> <ESC>:set mouse=<cr>i

"go arround windows
noremap <F2> <C-w><C-w>
inoremap <F2> <ESC><C-w><C-w>i

"airline
let g:airline_theme="dark"
set t_Co=256
set encoding=utf-8

" tab color
"hi TabLineSel ctermfg=Black ctermbg=White 
"hi TabLineFill ctermfg=Black ctermbg=Black  

"Open new tab and go to file 
map <leader>f :tab split<cr>gf<F1><C-w><C-w>

"Open a new tab and jump to definition
map <leader>] :tab split<cr><C-]><F1><C-w><C-w>

let g:jedi#auto_initialization = 0
let g:jedi#popup_on_dot = 0

"move tab 
noremap <leader><PageUp> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
noremap <leader><PageDown> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>
"map <leader>- :-tabmove<cr>
"map <leader>= :+tabmove<cr>

" auto detect change
autocmd CursorHold * checktime

" esc key
"inoremap <F11> <ESC>
"nnoremap <F11> <ESC>
"onoremap <F11> <ESC>
"vnoremap <F11> <ESC>
"snoremap <F11> <ESC>
"xnoremap <F11> <ESC>
"cnoremap <F11> <ESC>

"Bubble single lines
noremap <leader><Up> ddkP
noremap <leader><Down> ddp
" Bubble multiple lines
noremap <leader><Up> xkP`[V`]
noremap <leader><Down> xp`[V`]

" doulbe click to replace a word
nnoremap <del> "_di
vnoremap <del> "_di
vnoremap p "_dP

" redo 
nnoremap r <C-r>

" 
"inoremap <F9> <C-n>

" control+arrow
noremap <C-Right> w
noremap <C-Left> b

" write file
nnoremap <F8> :w<CR>
inoremap <F8> <ESC>:w<CR>i
nnoremap <C-s> :w<CR>
inoremap <C-s> <ESC>:w<CR>i<Right>

" undo, redo
nnoremap <C-u> u
inoremap <C-u> <ESC>ui
inoremap <C-r> <ESC><C-r>i

"activate visual mode in normal mode
nnoremap <S-Up> vk
nnoremap <S-Down> vj
inoremap <S-Up> <ESC>lvk
inoremap <S-Down> <ESC>lvj
" these are mapped in visual mode
vnoremap <S-Up> k
vnoremap <S-Down> j

" activate visual mode in normal mode
nnoremap <S-Left> vh
nnoremap <S-Right> vl
inoremap <S-Left> l<ESC>vh
inoremap <S-Right> l<ESC>vl
" these are mapped in visual mode
vnoremap <S-Left> h
vnoremap <S-Right> l

"activate visual mode in normal mode  
nnoremap <S-Home> v<Home>
nnoremap <S-End> v<End>
inoremap <S-Home> <ESC>lv<Home>
inoremap <S-End> <ESC>lv<End>
" these are mapped in visual mode
vnoremap <S-Home> <Home>
vnoremap <S-End> <End>

" Ctrl+c Ctrl+x Ctrl+v
vnoremap <C-c> yi
vnoremap <C-x> di
nnoremap <C-v> pi<Right>
inoremap <C-v> <ESC>pi<Right>
vmap <C-v> <Del><Left><C-v>

" find function
imap <C-f> <ESC><space>
nmap <C-f> <ESC><space>
vmap <C-f> <ESC><space>

" highlight words
imap <C-h> <ESC>*#
nmap <C-h> <ESC>*#
vmap <C-h> <ESC>*# 

"imap <C-n> <ESC>*Ni
"nmap <C-n> <ESC>*Ni
"vmap <C-n> <ESC>*Ni 
  
" go to command mode
inoremap <F12> <ESC>:
vnoremap <F12> <ESC>:
nnoremap <F12> <ESC><ESC>:
cnoremap <F12> <ESC>:

" complete suggestion
"imap <C-m> <C-n>

" Cut whole line
inoremap <C-d> <ESC>ddi
nnoremap <C-d> dd

" close a tab
imap <C-q> <ESC><leader>qi
nmap <C-q> <leader>q

" store vim session in current directory
"inoremap <F11> <ESC>:mksession! ./.vim_session<cr>i
"nnoremap <F11> :mksession! ./.vim_session<cr>
"inoremap <F10> <ESC>:source ./.vim_session<cr>i
"nnoremap <F10> :source ./.vim_session<cr>

" let enter and backspace into insert mode
nnoremap <cr> i<cr>
nnoremap <Backspace> i<Backspace>
nnoremap <Del> i<Del>

" Vim-Session command
" SaveSession [name]
" OpenSession
" DeleteSession

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => String combo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let @l="iChromePhp::log('',$);\n^["
highlight SignColumn ctermbg=0
