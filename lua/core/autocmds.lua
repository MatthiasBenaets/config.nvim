local autocmd = vim.api.nvim_create_autocmd

-- remove whitespaces
autocmd({ "BufWritePre" }, {
  command = "%s/\\s\\+$//e",
})

-- enable spellchecking
autocmd({ "FileType" }, {
  pattern = { "markdown" },
  callback = function()
    vim.cmd("setlocal spell spelllang=en,nl")
    vim.keymap.set("n", "<TAB>", "z=", { noremap = true, silent = true, buffer = true })
  end,
})

-- open file at last position
autocmd({ "BufReadPost" }, {
  pattern = "*",
  command = "silent! normal! g'\"zv",
})
