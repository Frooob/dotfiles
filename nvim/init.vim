set nocompatible              " be iMproved, required
filetype off                  " required

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let loaded_netrwPlugin = 1

set encoding=UTF-8
set tabstop=4 
set softtabstop=4
set smarttab
set shiftwidth=4
set expandtab
set laststatus=0
set wrap linebreak nolist breakindent
set hidden 
set noerrorbells
set relativenumber
set number
set ignorecase
set smartcase
set scrolloff=8
set signcolumn=yes
set colorcolumn=80 " draw the line!
set termguicolors
set splitright
set splitbelow

" Enable shift+tab to unindent
" for command mode
nnoremap <S-Tab> <<
nnoremap <Tab> >>
" for insert mode
inoremap <S-Tab> <C-d>
" Make double-<Esc> clear search highlights
nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <leader>q :bp<cr>:bd #<cr>
nnoremap d "_d
vnoremap d "_d
nnoremap <c-q> :bd <cr>
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p
" nnoremap j gj
" nnoremap j gj
nmap gx viW"ay:!open <C-R>a &<CR>


" Enable mouse
" set mouse=a
" if !has('nvim')
"     set encoding=utf-8
"     set ttymouse=xterm2
" endif

" Persistent Undo
if has('persistent_undo')
    let undodir = "$HOME/.local/share/nvim/undo"   " where to save undo histories
    call system('mkdir ' . undodir)    " create undodir if not existing
    set undofile                       " Save undo's after file closes
    set undodir=$HOME/.local/share/nvim/undo   " where to save undo histories
    set undolevels=100000              " How many undos
    set undoreload=1000000             " number of lines to save for undo
endif

call plug#begin('~/.config/nvim/plugged')
Plug 'ThePrimeagen/vim-be-good'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons' 
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox' 
Plug 'tpope/vim-fugitive'
Plug 'jpalardy/vim-slime'
Plug 'tpope/vim-commentary'
" yarn and npm must be installed for this
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'Yggdroot/indentLine'

call plug#end()

" Config Files for Plugins
"nvim tree
source $HOME/.config/nvim/plug-config/nvim_tree.vim

" coc
source $HOME/.config/nvim/plug-config/coc.vim

" treesitter
lua <<EOF
    require'nvim-treesitter.configs'.setup {
    highlight = {
      enable = true,
      disable = { "cpp", "lua" },
    },
    }
EOF


" gruvbox
colorscheme gruvbox
set background=dark

" airline
source $HOME/.config/nvim/plug-config/airline.vim

" telescope
source $HOME/.config/nvim/plug-config/telescope.vim

" vim-slime
let g:slime_target = "neovim"
let g:slime_python_ipython = 1

" commentary
nnoremap <s-x> :Commentary<CR>
vnoremap <s-x> :Commentary<CR>

" Markdown Preview
source $HOME/.config/nvim/plug-config/markdown_preview.vim

" slime hacks
fun! StartREPL(repl)
  execute 'terminal '.a:repl
  setlocal nonumber
  let t:term_id = b:terminal_job_id
  wincmd p
  execute 'let b:slime_config = {"jobid": "'.t:term_id . '"}'
endfun

" let g:slime_dont_ask_default = 1
noremap <silent> tt :vsplit<bar>:call StartREPL('ipython')<CR>
tnoremap <Esc> <C-\><C-n><CR>

set cmdheight=1