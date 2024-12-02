---@type LazySpec
return {
  {
    "miversen33/netman.nvim",
    opts = {
      mapping = {
        vim.keymap.set(
          "n",
          "<leader>R",
          "<cmd>Neotree remote<CR>",
          { noremap = true, silent = true, desc = "Remote Providers" }
        ),
      },
    },
  },
}
