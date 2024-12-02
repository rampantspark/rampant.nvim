---@type LazySpec
return {
  {
    "crnvl96/lazydocker.nvim",
    event = "VeryLazy",
    opts = {}, -- automatically calls `require("lazydocker").setup()`
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    vim.api.nvim_set_keymap(
      "n",
      "<leader>r",
      "<cmd>LazyDocker<CR>",
      { noremap = true, silent = true, desc = "LazyDocker" }
    ),
  },
}
