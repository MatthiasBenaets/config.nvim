-- Theming
local M = {}
M.theme = "kanso"

-- Transparency
local transparent = true
local toggle_transparency
vim.keymap.set("n", "<leader>bg", function()
  toggle_transparency()
end, { noremap = true, silent = true })

-- Colorschemes
return {
  -- Doom-one
  {
    "NTBBloodbath/doom-one.nvim",
    lazy = true,
    -- priority = 1000,
    config = function()
      -- Setup
      vim.g.doom_one_cursor_coloring = true
      vim.g.doom_one_terminal_colors = true
      vim.g.doom_one_italic_comments = false
      vim.g.doom_one_enable_treesitter = true
      vim.g.doom_one_diagnostics_text_color = true
      vim.g.doom_one_transparent_background = true
      vim.g.doom_one_pumblend_enable = false
      vim.g.doom_one_pumblend_transparency = 0
      vim.g.doom_one_plugin_neorg = true
      vim.g.doom_one_plugin_telescope = true
      vim.g.doom_one_plugin_neogit = false
      vim.g.doom_one_plugin_whichkey = true
      vim.g.doom_one_plugin_indent_blankline = true

      -- Set theme
      vim.cmd("colorscheme " .. M.theme)

      -- Toggle background
      toggle_transparency = function()
        transparent = not transparent
        vim.g.doom_one_transparent_background = transparent
        vim.cmd("colorscheme " .. M.theme)
      end
    end,
  },
  -- Kanso
  {
    "webhooked/kanso.nvim",
    priority = 1000,
    config = function()
      local kanso = require("kanso")

      -- Setup
      kanso.setup({
        undercurl = true,
        disableItalics = true,
        transparent = true,
        dimInactive = false,
        terminalColors = true,
        theme = "zen",
        background = {
          dark = "zen",
          light = "pearl",
        },
      })

      -- Set theme
      vim.cmd("colorscheme " .. M.theme)

      -- Toggle background
      toggle_transparency = function()
        transparent = not transparent
        kanso.setup({
          transparent = transparent,
        })
        vim.cmd("colorscheme " .. M.theme)
      end
    end,
  },
}
