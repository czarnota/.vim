"Plugins
"=======
"auto-pairs
"iceberg.vim
"jinja.vim
"php.vim
"switch.vim
"vim-gitgutter
"vim-mark
"VimPyServer
"vim-python-pep8-indent


"Pathogen
"========
"Pathogen is used to allow instalation of custom plugins easily
execute pathogen#infect() 

"Misc
"====
let mapleader = " "             "Map leader to space - it is more reachable
set nocompatible                "Disable compatible mode
set backspace=indent,eol,start
set history=50		            "keep 50 lines of command line history
set ruler                       "show the cursor position all the time
set showcmd		                "display incomplete commands
set incsearch		            "do incremental searching
set nobackup                    "no backup files
set nowritebackup               "only in case you don't want a backup file while editing
set noswapfile                  "no swap files
set noundofile                  "no undo files
set guioptions-=m               "remove menu bar from gui version of vim
set guioptions-=T               "remove toolbar from gui version of vim
set guioptions-=r               "remove right-hand scroll bar from gui version of vim
set guioptions-=L               "remove left-hand scroll bar from gui version of vim
"set guicursor=                  "prevent NeoVIM from changing the cursor
"set number                      "display line numbers
set rnu                         "show relative line numbers
syntax enable                   "enable syntax highlighting
set encoding=utf-8              "The encoding displayed.
set fileencoding=utf-8          "The encoding written to file. 
set splitright                  "To make vsplit put the new buffer on the right of the current buffer:
set splitbelow                  "Similarly, to make split put the new buffer below the current buffer:
set nohlsearch                  "disable hightlighting when searching
filetype on                     "enable file type detection
filetype plugin on              "enable loading the plugin files for specific file types with:
filetype indent on              "enable loading the plugin files for specific file types with:
set nowrap                      "Disable word wrap.
set hidden                      "This allows buffer to become hidden when new file is created
set cursorline                  "Highlights current line
set colorcolumn=80              "Vertical ruler at 80
"set showbreak=↪\                "How to show end of line
set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨,space:. "How to show characters in set list mode
set ttyfast                     "Enable more smooth scrolling by sending more characters into terminal
set lazyredraw                  "Buffer screen instead of updating all the time
set signcolumn=yes              "Always show signcolumn - removed flickering effect
set wildmenu                    "Display all matching files when we tab complete
set path+=**                    "Search down into subfolders
autocmd FileType tagbar,nerdtree setlocal signcolumn=no "There are certain filetypes that are not supposed to have the column
set scrolloff=5                 "Always show 5 lines off the screen
"disable title modification
set notitle
set shortmess+=I "Remove vim intro message

"Exuberant Ctags
"===============
set tags=tags,./tags;

"Clipboard settings
"==================
"
"On Mac OS X and Windows, the * and + registers both point to the system
"clipboard so unnamed and unnamedplus have the same effect: the unnamed
"register is synchronized with the system clipboard.
"On Linux, you have essentially two clipboards: one is pretty much the same as
"in the other OSes (CtrlC and CtrlV in other programs, mapped to register +
"in Vim), the other is the 'selection' clipboard (mapped to register * in Vim).
"Using only unnamedplus on Linux, Windows and Mac OS X allows you to:
"
"   CtrlC in other programs and put in Vim with p on all three platforms,
"   yank in Vim with y and CtrlV in other programs on all three platforms.
"
"If you also want to use Linux's "selection" clipboard, you will also need
"unnamed.
"
"Set clipboard to both
set clipboard^=unnamed,unnamedplus
"
"Set clipboard to system clipboard
"set clipboard=unnamedplus


"Coding style
"============
set tabstop=4
set shiftwidth=4
set expandtab
set cino=is,(s,m1,N-s,g0


"Terminal and window
"===================
" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif
"disable beeping
set noerrorbells visualbell t_vb=
if has('autocmd')
    autocmd GUIEnter * set visualbell t_vb=
endif


" Colorscheme settings
" ====================
" Keep in ming that tmux tends to break things
" ❯ cat ~/.tmux.conf
" # Enable RGB colour if running in xterm(1)
" set-option -sa terminal-overrides ",xterm*:Tc"
"
" Remember about airline theme below
" Enable true color
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

set background=dark
colorscheme iceberg
let g:airline_theme = 'iceberg'
"EndOfBuffer is color of ~ are in vim8
"highlight EndOfBuffer ctermbg=NONE guibg=NONE guifg=#161821
"NonText is color of ~ are in vim7
"highlight NonText ctermbg=NONE guibg=NONE

"Error Fix error highlight on white backgrounds
highlight SpellBad ctermfg=0 ctermbg=214 guibg=#ffdddd guifg=#000000
highlight SpellCap ctermfg=0 ctermbg=214 guibg=#ffdddd guifg=#000000
highlight Error ctermfg=0 ctermbg=214 guibg=#ff5555 guifg=#000000
"make background consistent
highlight SpecialKey ctermfg=8
highlight CursorLine cterm=NONE "remove underline from CursorLine
highlight ColorColumn term=bold cterm=bold ctermbg=236
autocmd InsertEnter * set nocursorline
autocmd InsertLeave * set cursorline
"completion menu text holor fix
highlight Pmenu ctermfg=8
"Remove the ugly border that separates window
highlight VertSplit term=NONE cterm=NONE ctermbg=NONE guibg=NONE
set fillchars=vert:\            "remove ugly vertical line characters '|' which are visible on some colorschemes

"Airline
"=======
"turns on vim-airline at startup
set laststatus=2
"set laststatus=0
"Enable powerline fonts
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_alt_sep = ''
"Tabline enable
let g:airline#extensions#tabline#enabled = 0 
"Only file names in tabs
let g:airline#extensions#tabline#fnamemod = ':t' 

"Buffer switching
nnoremap \ :ls<CR>:buffer<Space>

"Quicksave
"=========
"Save file quickly
noremap s :w<CR>


"Buffer management
"=====================
"Elegantly create new buffer in current
"window like a decent modern text editor
nnoremap <Leader>n :enew<CR>
"Map key to close buffers without
"closing windows
nnoremap <Leader>q :bdelete<CR>

"Window switch
"============
"Make movement between
"windows easier by using 
"tab key and `` to switch windows
map <TAB> <C-w><C-w>
map ` <C-w><C-h>
map <Leader>o <C-w><C-w>
map <Leader>u <C-w><C-h>


"Movement
"========
nnoremap m .
vnoremap <C-j> 15j
nnoremap <C-j> 15j
vnoremap <C-k> 15k
nnoremap <C-k> 15k
"Map combination of jk in insert mode
"Esc is too far away!
inoremap jk <esc>

"Switch
"======
let g:switch_mapping = "-" "Map :Switch command to -. - is prev line by default (not very useful)


"PHP
"===
"Enable syntax highlightig for $ sign in php, so that whole variable is		
"highlighter		
let php_var_selector_is_identifier = 1


"fzf: https://github.com/junegunn/fzf
"====================================
set rtp+=$FZF_HOME
map <c-p> :FZF<CR>


"fzf.vim
"=======
nnoremap <silent> <expr> <c-g> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Ag ".expand("<cword>")."\<cr>"


"Terminal
"========
tnoremap jk <C-\><C-n>

"clang-format
"============
map <C-l> :py3f $VIMHOME/clang-format.py<cr>
"map <C-l> :pyf /usr/share/clang/clang-format.py<cr>

"Execute current line
"====================
nmap <C-x> :.!$VIMHOME/bashexec.sh<cr>
vmap <C-x> :!$VIMHOME/bashexec.sh<cr>

"Fix highlight for compound literals in C
"========================================
let c_no_bracket_error=1
let c_no_curly_error=1


"Disable folding for vim markdown
"======================================
let g:vim_markdown_folding_disabled = 1
