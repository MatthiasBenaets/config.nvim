-- Linter
return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")

    -- Set up linters
    -- https://github.com/mfussenegger/nvim-lint/tree/master/lua/lint/linters
    lint.linters_by_ft = {
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      svelte = { "eslint_d" },
      python = { "pylint" },
    }

    -- Automatic linting
    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })

    -- Keymaps
    local set = vim.keymap.set
    set("n", "<leader>l", function()
      lint.try_lint()
    end)
  end,
}
