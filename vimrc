"<-- VIM TRAINING WHEELS START HERE /-/-/-/-/-/-/-/-/-/-/-/-/-/-->

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

"<-- VIM TRAINING WHEELS END HERE /-/-/-/-/-/-/-/-/-/-/-/-/-/-/-->

"<-- ORIGINAL VIM SETTINGS START HERE /-/-/-/-/-/-/-/-/-/-/-/-/-->

filetype indent on

inoremap { {<CR>}<Esc>O<TAB>
inoremap ( ()<Esc>:let leavechar=")"<CR>i
inoremap [ []<Esc>:let leavechar="]"<CR>i
imap <C-j> <Esc>:exec "normal f" . leavechar<CR>a

set autoindent
set expandtab
set softtabstop=4
set tabstop=4
set shiftwidth=4

"<-- ESSENTIAL STUFF HERE -->
ino jk <esc>
vno v <esc>
nnoremap ; :
set number
set showcmd
syntax enable

"<-- ESSENTIAL STUFF END HERE -->

let mapleader = ","
set backspace=2

nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-l> :wincmd l<CR>
nmap <C-v> "+p

set copyindent
set smartcase
set smarttab
set ignorecase
set title

set background=dark

cnoreabbrev <expr> X (getcmdtype() is# ':' && getcmdline() is# 'X') ? 'x' : 'X'

"<-- ORIGINAL VIM SETTINGS END HERE /-/-/-/-/-/-/-/-/-/-/-/-/-/-->

"<-- PLUGIN LIST STARTS HERE -/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-->

call plug#begin()

Plug 'chriskempson/vim-tomorrow-theme'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'easymotion/vim-easymotion'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
Plug 'joonty/vim-do'

"<-- AUTOCOMPLETION PLUGINS START HERE /-/-/-/-/-/-/-/-/-/-/-/-->
Plug 'ervandew/supertab'
Plug 'shougo/neocomplete.vim'
Plug 'rip-rip/clang_complete'
Plug 'rkulla/pydiction'

"<-- SYNTAX HIGHLIGHTING PLUGINS START HERE /-/-/-/-/-/-/-/-/-/-->
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'hdima/python-syntax'

call plug#end()

"<-- PLUGIN LIST ENDS HERE -/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-->

colorscheme Tomorrow-Night

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_wq = 0

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let g:NERDTreeWinSize=40
let g:NERDTreeShowBookmarks = 1

let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"⭤":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ }

"<-- NEOCOMPLETE STUFF HERE -->
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:clang_library_path = "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib"
if !exists('g:neocomplete#force_omni_input_patterns')
     let g:neocomplete#force_omni_input_patterns = {}
endif
let g:pydiction_location = '~/.vim/plugged/pydiction/complete-dict'
"<-- NEOCOMPLETE STUFF ENDS HERE -->

map <C-p> :Files<CR>

nmap <Leader>gs :Gstatus<CR>
nmap <Leader>gc :Gcommit<CR>
nmap <Leader>gp :Gpush<CR>
