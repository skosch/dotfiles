call plug#begin()
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'vim-airline/vim-airline'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'elixir-lang/vim-elixir'
Plug 'vale1410/vim-minizinc'
Plug 'rakr/vim-one'
Plug 'bkad/CamelCaseMotion'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'thinca/vim-ref'
Plug 'awetzel/elixir.nvim', { 'do': 'yes \| ./install.sh' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'carlitux/deoplete-ternjs'
Plug 'vimwiki/vimwiki'
Plug 'neomake/neomake'
Plug 'justinmk/vim-sneak'
Plug 'terryma/vim-smooth-scroll'
Plug 'leafgarland/typescript-vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-abolish'
call plug#end()

let g:fzf_command_prefix = 'Fzf'
let g:fzf_buffers_jump = 1

" SMOOTH SCROLL SETTINGS
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 15, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 15, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 15, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 15, 4)<CR>

" COLOR SCHEME SETTINGS "
hi LineNr guibg=bg
set foldcolumn=0
hi foldcolumn guibg=bg
hi VertSplit guibg=bg guifg=bg
:set fillchars+=vert:\  " Remove ugly ||| vertical split bar
set background=dark
let g:one_allow_italics = 1 " I love italic for comments
colorscheme one
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors
if (empty($TMUX))
  if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" FONT SETTINGS
let g:airline_powerline_fonts = 1
let g:airline_theme='one'

" VARIOUS SETTINGS
set backspace=indent,eol,start
set fileencodings=ucs-bom,utf-8,default,latin1
set helplang=en
set history=50
set nomodeline
set mouse=a
let mapleader=","
set backupcopy=yes

let g:deoplete#enable_at_startup = 1

" VIM SNEAK
"let g:sneak#s_next = 1
"let g:sneak#streak = 1
let g:sneak#label = 1


" LINTER SETTINGS
let g:neomake_open_list=0
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_jsx_enabled_makers = ['eslint']
let g:neomake_logfile = '/tmp/neomake.log'
autocmd! BufWritePost * Neomake

let g:jsx_ext_required = 0 " Allow JSX in normal JS files

" Disable Shift-K opening man pages
map <S-k> <Nop>

" Enable CamelCaseMotions
call camelcasemotion#CreateMotionMappings('<leader>')

"Tabstops are 4 spaces
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
set smartindent

set formatprg=par

set wrap

command! W w
command! WQ wq
command! Wq wq
command! Wa wa
command! WA wa
command! Q q
map th gT
map tl gt

" FZF
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
map <C-P> :FZF ~/projects <return>
map <C-T> :FzfHistory<return>

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
map <c-k> :bnext<CR>
nmap <leader>l :bnext<CR>

" Move to the previous buffer
map <c-j> :bprevious<CR>
nmap <leader>h :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>

" JSX settings
let g:jsx_ext_required = 0

" Make sure vim-javascript can indent graphql template strings
au! Filetype javascript let b:syng_str = '^\%(.*template\)\@!.*string\|special'
au! Filetype javascript let b:syng_strcom = '^\%(.*template\)\@!.*string\|comment\|regex\|special\|doc'
