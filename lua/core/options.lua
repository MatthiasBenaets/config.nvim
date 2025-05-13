local opt = vim.opt

-- Indentation
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.smartindent = true
opt.expandtab = true

-- UI
opt.cursorline = true
opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"
opt.scrolloff = 10
opt.sidescrolloff = 20
opt.termguicolors = true

-- Formatting
opt.wrap = false
opt.linebreak = true

-- Search
opt.ignorecase = true
opt.smartcase = true

-- Miscellaneous
opt.conceallevel = 0
opt.clipboard = "unnamedplus"
opt.mouse = "a"

-- Files
opt.swapfile = false
opt.undofile = true
opt.writebackup = false
opt.fileencoding = "utf-8"
