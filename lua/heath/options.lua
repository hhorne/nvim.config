vim.g.mapleader = " "

vim.g.have_nerd_font = true

vim.cmd("let g:netrw_liststyle = 3")

local o = vim.o

-- fat cursor, still thinking this one over
-- o.guicursor = ""

o.showmode = false
o.undofile = true
o.clipboard = "unnamedplus" -- use system clipboard as default register

o.number = true
o.relativenumber = true

o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.expandtab = true

o.smartindent = true
o.autoindent = true

o.wrap = false

o.ignorecase = true -- ignore case when searching
o.smartcase = true --unless you include mixed case in your search

o.termguicolors = true
o.background = "dark" -- colorschemes that can be light or dark will be dark
o.signcolumn = "yes" -- show sign column so that text doesn't shift

o.splitright = true
o.splitbelow = true

o.hlsearch = false
o.incsearch = true

o.scrolloff = 8
o.colorcolumn = "100"
