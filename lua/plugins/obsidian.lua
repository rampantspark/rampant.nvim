---@type LazySpec
return {
  {
    "epwalsh/obsidian.nvim",
    event = "UIEnter",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    dependencies = {
      -- Required.
      "nvim-lua/plenary.nvim",
    },
    opts = {
      workspaces = {
        {
          name = "rampantspark",
          path = "/home/rampantspark/Documents/rampantspark",
        },
      },
    },
  },
}
