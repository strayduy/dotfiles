-- Use tree style in file explorer
vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt -- for conciseness

-- Show absolute line number for current line, relative numbers for other lines
opt.relativenumber = true
opt.number = true

-- Indentation: 4-space tabs
opt.tabstop = 4 -- 4 spaces for tabs (prettier default)
opt.shiftwidth = 4 -- 4 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

-- Disable line wrapping
opt.wrap = false

-- Highlight current cursor line
opt.cursorline = true

-- Highlight search terms
opt.hlsearch = true

-- Use smart case when searching
opt.ignorecase = true
opt.smartcase = true

-- Allow buffers with unsaved changes to be hidden
opt.hidden = true

-- Color scheme
opt.termguicolors = true
opt.background = "dark"

-- Backspace
opt.backspace = "indent,eol,start"

-- Show column gutter
opt.signcolumn = "yes"

-- Split windows to the right and below
opt.splitright = true
opt.splitbelow = true

-- Turn off swapfile
opt.swapfile = false
