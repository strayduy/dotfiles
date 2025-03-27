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
keymap.set("n", "<Leader>s", ":w<CR>", { desc = "[S]ave current buffer" })

-- Window splits
keymap.set("n", "<Leader>Sv", "<C-w>v", { desc = "[S]plit [V]ertically" })
keymap.set("n", "<Leader>Sh", "<C-w>s", { desc = "[S]plit [H]orizontally" })
keymap.set("n", "<Leader>Sq", ":close<CR>", { desc = "[S]plit [Q]uit" })

-- Easier navigation between splits
keymap.set("n", "<C-j>", "<C-w><C-j>")
keymap.set("n", "<C-k>", "<C-w><C-k>")
keymap.set("n", "<C-l>", "<C-w><C-l>")
keymap.set("n", "<C-h>", "<C-w><C-h>")
