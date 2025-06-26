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

" --------------------
" Map leader key first
" --------------------
let mapleader = " "  "Space key

" ------------------
" just some keybinds
" ------------------
nnoremap <Leader>b :bprevious<CR>

" -------------------------
" File location preferences
" -------------------------
set directory^=/tmp//     " put .swp files somewhere out of the way
let NERDTreeShowHidden=1  " show hidden like .github/ files

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
" NERDTree settings and keybinds
" -------------------------------
nmap <C-n> :NERDTreeToggle<CR>    " Toggle with Ctrl+N
nnoremap <leader>n :NERDTreeFind<CR>  " Reveal current file in NERDTree (like VSCode Explorer)
nmap <Leader>r :NERDTreeRefreshRoot<CR> " Refresh the tree!

" -------------------------------
" FZF Keybinds
" -------------------------------
nmap <C-p> :Files<CR>             " Ctrl+P to fuzzy find files

" -------------------------------
" File change handling
" -------------------------------
set autoread

" Check if file has changed on focus or buffer switch
autocmd FocusGained,BufEnter * checktime

" Notify if file has changed and was auto-reloaded
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None


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
autocmd VimSuspend * silent! wall  " Autosave on suspend
autocmd FocusLost,WinLeave * silent! wall  " Autosave on lose focus and close buffer


" -------------------------------
" Indentation
" -------------------------------
set tabstop=4                 " Number of spaces a tab counts for
set shiftwidth=4              " Number of spaces for autoindent
set expandtab                 " Use spaces instead of tabs
set smartindent               " Autoindent new lines

" -------------------------------
" Coc.nvim LSP client configs
" -------------------------------

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

" Accept completion if popup is visible, else insert newline
inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm() : "\<CR>"
" Use <Tab> for trigger completion and navigate
inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <silent><expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

" Show hover doc manually with 'K'
nnoremap <silent> K :call <SID>SafeHover()<CR>

" Show diagnostics and documentation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)

