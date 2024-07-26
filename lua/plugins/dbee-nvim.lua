return {
  {
    "kndndrj/nvim-dbee",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    build = function()
      -- Install tries to automatically detect the install method.
      -- if it fails, try calling it with one of these parameters:
      --    "curl", "wget", "bitsadmin", "go"
      require("dbee").install()
    end,
    config = function()
      require("dbee").setup( --[[optional config]])
      vim.api.nvim_set_keymap('n', '<leader>Xo', '<cmd>:lua require("dbee").open()<cr>',
        { noremap = true, silent = true, desc = "Dbee Open" })
      vim.api.nvim_set_keymap('n', '<leader>Xc', ':lua require("dbee").close()<cr>',
        { noremap = true, silent = true, desc = "Dbee Close" })
    end,
  },
}
