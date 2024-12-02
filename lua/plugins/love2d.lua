---@type LazySpec
return {
  {
    "S1M0N38/love2d.nvim",
    -- cmd = "LoveRun",
    path_to_love_bin = "/usr/bin/love",
    config = function()
      vim.api.nvim_set_keymap(
        "n",
        "<leader>Or",
        "<cmd>LoveRun<CR>",
        { noremap = true, silent = true, desc = "Run LÖVE" }
      )
      vim.api.nvim_set_keymap(
        "n",
        "<leader>Os",
        "<cmd>LoveStop<CR>",
        { noremap = true, silent = true, desc = "Stop LÖVE" }
      )
      local wk = require("which-key")
      wk.add({
        { "<leader>O", group = "LÖVE" },
      })
    end,
  },
}
