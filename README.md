# myvimrc

# 🔌 Plugin Management (via vim-plug)
NERDTree: A file explorer for easy navigation of the filesystem inside Vim.

FZF & fzf.vim: A fuzzy file finder, with <C-p> bound to open it.

Lightline: A lightweight statusline plugin styled with the Catppuccin theme.

coc.nvim: A powerful autocompletion engine with LSP support.

catppuccin: A dark, visually pleasing color scheme.

vim-gitgutter: Shows git diff markers in the sign column (e.g., added/modified/removed lines).

⚙️ Core Settings
Leader key: Space (<Space>) is set as the leader key.

Buffer handling: Hidden buffers allowed, swap files redirected to /tmp, autoread + autowall on focus/suspend.

File encoding: UTF-8 with Unix, DOS, and Mac line endings supported.

Clipboard: Uses system clipboard.

UI: Line numbers, mouse support, cursor line highlight, syntax highlighting, persistent statusline.

Color: True color enabled (termguicolors) with dark background.

# 🗂 NERDTree Keybinds
<C-n>: Toggle NERDTree.

<Leader>n: Reveal current file in tree.

<Leader>r: Refresh NERDTree root.

Shows hidden files by default (.github/, etc.).

🔍 FZF Keybinds
<C-p>: Launch FZF to search files.

# 🧠 coc.nvim LSP & Autocompletion
<CR>: Accept completion if shown, otherwise newline.

<Tab>/<S-Tab>: Navigate completions.

K: Hover documentation (safely).

gd: Go to definition.

gr: Find references.

# 🛠 Miscellaneous
Autosaves on suspend or focus loss.

Indentation: 4 spaces per tab, smart indentation with spaces.

Warns and reloads when files change externally.
