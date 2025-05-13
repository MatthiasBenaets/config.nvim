-- Formatter
return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    -- Set up formatters
    -- https://github.com/stevearc/conform.nvim/tree/master/lua/conform/formatters
    conform.setup({
      -- Formatter by filetype
      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        svelte = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        lua = { "stylua" },
        python = { "isort", "black" },
        nix = { "nixpkgs-fmt" },
      },
      -- Auto-format
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      },
    })

    -- Keymaps
    local set = vim.keymap.set
    set({ "n", "v" }, "<leader>mf", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      })
    end)
  end,
}
