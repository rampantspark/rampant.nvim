return {
  -- {
  --   "miversen33/netman.nvim"
  -- },
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      "3rd/image.nvim",
    },
    config = function()
      require("neo-tree").setup({
        close_if_last_window = true,
        window = {
          position = "right",
        },
        -- sources = {
        --   "filesystem",
        --   "buffers",
        --   "git_status",
        --   "document_symbols",
        --   "netman.ui.neo-tree"
        -- },
      })
      vim.api.nvim_set_keymap('n', '<leader>Xd', '<cmd>Neotree remote<cr>',
        { noremap = true, silent = true, desc = "Open Remote Docker" })
    end

  },
}
