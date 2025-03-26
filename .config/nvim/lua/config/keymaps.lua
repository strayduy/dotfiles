-- Map <Leader> to spacebar
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap -- for conciseness

-- Escape insert mode with jj
keymap.set("i", "jj", "<ESC>")

-- Clear search highlight with Enter
keymap.set("n", "<CR>", ":noh<CR><CR>")

-- When deleting chars with x, don't store deleted chars into register
keymap.set("n", "x", '"_x')

-- Intuitive vertical movement for wrapped text
keymap.set("n", "j", "gj", { noremap = true })
keymap.set("n", "k", "gk", { noremap = true })

-- Save current buffer
keymap.set("n", "<Leader>s", ":w<CR>", { desc = "Save current buffer" })

-- Window splits
keymap.set("n", "<Leader>wv", "<C-w>v", { desc = "Create vertical split" })
keymap.set("n", "<Leader>wh", "<C-w>s", { desc = "Create horizontal split" })
keymap.set("n", "<Leader>wq", ":close<CR>", { desc = "Close current split window" })

-- Easier navigation between splits
keymap.set("n", "<C-j>", "<C-w><C-j>")
keymap.set("n", "<C-k>", "<C-w><C-k>")
keymap.set("n", "<C-l>", "<C-w><C-l>")
keymap.set("n", "<C-h>", "<C-w><C-h>")
