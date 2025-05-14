-- Language Server Protocol
return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local set = vim.keymap.set
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        -- Buffer specific mappings
        local opts = { buffer = ev.buf, silent = true }

        -- Keybinds
        set("n", "gd", vim.lsp.buf.hover, opts) -- Show documentation of what is under cursor
        set("n", "gD", vim.lsp.buf.declaration, opts) -- Go to declaration
        set("n", "gR", "<CMD>Telescope lsp_references<CR>", opts) -- View LSP references
        set("n", "<leader>d", "<cmd>Telescope lsp_definitions<CR>", opts) -- View/Go to LSP definition
        set("n", "gt", "<CMD>Telescope lsp_type_definitions<CR>", opts) -- View LSP type definition
        set("n", "gi", "<CMD>Telescope lsp_implementations<CR>", opts) -- View LSP implementation
        set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- View available code actions
        set("n", "ge", vim.diagnostic.open_float, opts) -- View line diagnostics
        set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- View buffer diagnostics
        set("n", "[d", vim.diagnostic.goto_prev, opts) -- Go to previous diagnostic in buffer
        set("n", "]d", vim.diagnostic.goto_next, opts) -- Go to next diagnostic in buffer
        set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- Smart rename
        set("n", "<leader>rs", ":LspRestart<CR>", opts) -- Restart LSP
      end,
    })

    -- Configure servers
    local capabilities = cmp_nvim_lsp.default_capabilities()
    local servers = {
      lua_ls = {
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      },
      nil_ls = {
        capabilities = capabilities,
        settings = {
          ["nil"] = {
            formatting = {
              command = { "nixpkgs-fmt" },
            },
          },
        },
      },
    }
    for server, config in pairs(servers) do
      lspconfig[server].setup(config)
    end

    -- Diagnostics
    vim.diagnostic.config({
      virtual_text = true,
      signs = true,
      underline = true,
      update_in_insert = true,
    })
  end,
}
