" -------------------------------
" Load vim-plug
" -------------------------------
call plug#begin('~/.vim/plugged')

" File explorer
Plug 'preservim/nerdtree'

" Fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Status bar (optional)
Plug 'itchyny/lightline.vim'


" Code completion engine
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Color themes
Plug 'catppuccin/vim', { 'as': 'catppuccin' }

" Git stuff
Plug 'airblade/vim-gitgutter'


call plug#end()

" ---------------------------
" Enable color theme settings
" ---------------------------
set termguicolors
set background=dark
colorscheme catppuccin_mocha " tokyonight-night, tokyonight-storm, tokyonight-day, tokyonight-moon
let g:lightline = {'colorscheme': 'catppuccin_mocha'}
set noshowmode

" ------------------
" Lightline settings
" ------------------
" Always show the statusline, even with one window
set laststatus=2

" -------------------------------
" NERDTree Keybinds
" -------------------------------
nmap <C-n> :NERDTreeToggle<CR>    " Toggle with Ctrl+N

" -------------------------------
" FZF Keybinds
" -------------------------------
nmap <C-p> :Files<CR>             " Ctrl+P to fuzzy find files


" -------------------------------
" Basic Settings
" -------------------------------
set nocompatible              " Disable Vi compatibility
set number                    " Show line numbers
set mouse=a                   " Enable mouse support
set clipboard=unnamedplus     " Use system clipboard
set cursorline                " Highlight current line
set hidden                    " Allow hidden buffers
set encoding=utf-8
set fileformats=unix,dos,mac
syntax on                     " Enable syntax highlighting
filetype plugin indent on     " Enable filetype detection and plugins

" -------------------------------
" Indentation
" -------------------------------
set tabstop=4                 " Number of spaces a tab counts for
set shiftwidth=4              " Number of spaces for autoindent
set expandtab                 " Use spaces instead of tabs
set smartindent               " Autoindent new lines

" -------------------------------
" Coc.nvim LSP client configs
" -------------------------------i

" doHover wrapper that prevents doHover error on things that can't be
" successfully hovered over
function! s:SafeHover()
  if !CocHasProvider('hover')
    return
  endif

  let l:symbol = expand('<cword>')
  if l:symbol =~# '^\k\+$'
    call CocActionAsync('doHover')
  endif
endfunction

" Use <Tab> for trigger completion and navigate
inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <silent><expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

" Show hover doc manually with 'K'
nnoremap <silent> K :call CocActionAsync('doHover')<CR>

" Show diagnostics and documentation
nmap <silent> K :call CocAction('doHover')<CR>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
