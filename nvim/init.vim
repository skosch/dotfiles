call plug#begin()
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'vim-airline/vim-airline'
Plug 'neomake/neomake'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'elixir-lang/vim-elixir'
Plug 'vale1410/vim-minizinc'
call plug#end()

" NERD TREE SETTINGS "
autocmd StdinReadPre * let s:std_in=1 " Automatically start on startup
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif " Auto-close
map <C-n> :NERDTreeToggle<CR> 

" COLOR SCHEME SETTINGS "
hi LineNr guibg=bg
set foldcolumn=0
hi foldcolumn guibg=bg
hi VertSplit guibg=bg guifg=bg
:set fillchars+=vert:\  " Remove ugly ||| vertical split bar

" FONT SETTINGS
let g:airline_powerline_fonts = 1

" VARIOUS SETTINGS
set backspace=indent,eol,start
set fileencodings=ucs-bom,utf-8,default,latin1
set helplang=en
set history=50
set nomodeline
set mouse=a
set shell=bash\ -i
let mapleader=","
set backupcopy=yes

" LINTER SETTINGS
let g:neomake_javascript_enabled_makers = ['eslint']

"Tabstops are 4 spaces
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

set formatprg=par

set wrap

command! W w
command! WQ wq
command! Wq wq
command! Q q
map th gT
map tl gt

" FZF
map <C-P> :FZF ~/projects<return>
map <C-T> :FZF ~<return>

" write as root
cmap w!! w !sudo tee > /dev/null %
set number 

map j gj
map k gk
set ch=2
set vb
set textwidth=80
set autochdir
" make sure that highlighting disappears after pressing esc/capslock
nnoremap <esc> :noh<return><esc>

set backupdir=~/.vimbackup
hi Search cterm=NONE ctermfg=232 ctermbg=227
hi Visual cterm=NONE ctermbg=232 ctermfg=NONE guibg=#342931
hi LineNr ctermfg=239

" change cursor in insert mode
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" eslint
let g:neomake_javascript_enabled_makers = ['eslint']

" AIRLINE SETTINGS
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>T :enew<cr>

" Move to the next buffer
nmap <leader>l :bnext<CR>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>

" JSX settings
let g:jsx_ext_required = 0
