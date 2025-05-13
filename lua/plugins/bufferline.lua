-- Buffer list visualizer
return {
  "akinsho/bufferline.nvim",
  dependencies = "nvim-tree/nvim-web-devicons",

  config = function()
    local bufferline = require("bufferline")

    -- Customization
    bufferline.setup({
      options = {
        separator_style = { " ", "" },
      },
    })

    -- Keymaps
    local set = vim.keymap.set
    set("n", "<leader>bb", "<CMD>BufferLinePick<CR>") -- select
    set("n", "<leader>bn", "<CMD>BufferLineCycleNext<CR>") -- next
    set("n", "<leader>bp", "<CMD>BufferLineCyclePrev<CR>") -- previous
    set("n", "<leader>bk", "<CMD>BufferLinePickClose<CR>") -- close
  end,
}
