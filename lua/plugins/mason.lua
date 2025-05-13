-- Language Server Protocol
return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local mason_tool_installer = require("mason-tool-installer")

    -- Set up Mason
    mason.setup({})

    -- Must have LSP
    mason_lspconfig.setup({
      ensure_installed = {
        "ts_ls",
        "html",
        "cssls",
        "tailwindcss",
        "svelte",
        "lua_ls",
        "emmet_ls",
        "pyright",
        "nil_ls",
      },
      automatic_installation = true,
    })

    -- Must have formatters and linters
    mason_tool_installer.setup({
      ensure_installed = {
        "prettier",
        "stylua",
        "isort",
        "black",
        "eslint_d",
        "pylint",
        "nixpkgs-fmt",
      },
      automatic_installation = true,
    })
  end,
}
