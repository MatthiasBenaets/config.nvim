local set = vim.keymap.set

-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Default options
local opts = { noremap = true, silent = true }

-- Focus window
set("n", "<C-h>", "<C-w><C-h>", opts) -- left
set("n", "<C-l>", "<C-w><C-l>", opts) -- right
set("n", "<C-j>", "<C-w><C-j>", opts) -- up
set("n", "<C-k>", "<C-w><C-k>", opts) -- down

-- Split window
set("n", "<leader>sh", "<C-w>v", opts) -- horizontal
set("n", "<leader>sv", "<C-w>s", opts) -- veritical
set("n", "<leader>sx", ":close<CR>", opts) -- close

-- Indentation
set("v", "<", "<gv", opts) -- left
set("v", ">", ">gv", opts) -- right
set("n", "=ap", "ma=ap'a", opts) -- paragraph and return cursor

-- Paste
set("v", "p", '"_dP', opts) -- will not yank pasted over text

-- Search
set("n", "<ESC>", "<CMD>nohlsearch<CR>") -- clear highlighting
set("n", "n", "nzzzv", opts) -- centers cursor
set("n", "N", "Nzzzv", opts) -- centers cursor

-- Insert mode
set("i", "jk", "<ESC>", opts) -- exit
