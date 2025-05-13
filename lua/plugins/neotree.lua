return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    local neo_tree = require("neo-tree")

    -- Customization
    neo_tree.setup({
      close_if_last_window = true, -- Close if last buffer is closed
      filesystem = {
        filtered_items = {
          visible = true,
        },
      },
      window = {
        width = 35,
      },
    })

    -- Keymaps
    local set = vim.keymap.set
    set("n", "<leader>e", "<CMD>Neotree toggle<CR>")
  end,
}
