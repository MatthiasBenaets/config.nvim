local autocmd = vim.api.nvim_create_autocmd

-- remove whitespaces
autocmd({ "BufWritePre" }, {
  command = "%s/\\s\\+$//e",
})

-- enable spellchecking
autocmd({ "FileType" }, {
  pattern = { "markdown" },
  command = "setlocal spell spelllang=en,nl",
})

-- open file at last position
autocmd({ "BufReadPost" }, {
  pattern = "*",
  command = "silent! normal! g'\"zv",
})
