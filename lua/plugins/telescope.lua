-- Fuzzy search
return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local builtin = require("telescope.builtin")

    -- Configuration
    telescope.setup({
      defaults = {
        -- File path display
        path_display = { "smart" },
        -- Keymaps inside Telescope
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- Previous item
            ["<C-j>"] = actions.move_selection_next, -- Next item
          },
        },
      },
    })

    -- Improve sorting
    telescope.load_extension("fzf")

    -- Keymaps
    local set = vim.keymap.set
    set("n", "<leader>ff", builtin.find_files) -- Find file
    set("n", "<leader>fg", builtin.live_grep) -- Find string
    set("n", "<leader>fb", builtin.buffers) -- Find buffer
    set("n", "<leader>fh", builtin.help_tags) -- Find help
  end,
}
