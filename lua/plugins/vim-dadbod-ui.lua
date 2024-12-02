---@type LazySpec
return {
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      { "tpope/vim-dadbod",                     lazy = true },
      { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true }, -- Optional
    },
    cmd = {
      "DBUI",
      "DBUIToggle",
      "DBUIAddConnection",
      "DBUIFindBuffer",
    },
    init = function()
      -- Your DBUI configuration
      vim.g.db_ui_use_nerd_fonts = 1

      vim.api.nvim_set_keymap(
        "n",
        "<leader>Xo",
        ":DBUI<CR>",
        { noremap = true, silent = true, desc = "Open DBUI" }
      )
      vim.api.nvim_set_keymap(
        "n",
        "<leader>Xt",
        ":DBUIToggle<CR>",
        { noremap = true, silent = true, desc = "Toggle DBUI" }
      )
      vim.api.nvim_set_keymap(
        "n",
        "<leader>Xa",
        ":DBUIAddConnection<CR>",
        { noremap = true, silent = true, desc = "Add a connection DBUI" }
      )
      vim.api.nvim_set_keymap(
        "n",
        "<leader>Xf",
        ":DBUIFindBuffer<CR>",
        { noremap = true, silent = true, desc = "Find a DBUI buffer" }
      )

      local wk = require("which-key")
      wk.add({
        { "<leader>X", group = "Dadbod UI" },
      })
    end,
  },
}
