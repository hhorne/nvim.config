vim.g.mapleader = " "

vim.g.have_nerd_font = true

vim.cmd("let g:netrw_liststyle = 3")

local o = vim.o
local opt = vim.opt

o.showmode = false
o.undofile = true
o.clipboard = "unnamedplus" -- use system clipboard as default register

o.number = true
o.relativenumber = true

o.expandtab = true
o.shiftwidth = 2
o.smartindent = true
o.tabstop = 2
o.softtabstop = 2
o.autoindent = true

opt.wrap = false

o.ignorecase = true -- ignore case when searching
o.smartcase = true --unless you include mixed case in your search

opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be dark
o.signcolumn = "yes" -- show sign column so that text doesn't shift


o.splitright = true
o.splitbelow = true

opt.hlsearch = true
