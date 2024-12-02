---@type LazySpec
return {
  {
    "mistweaverco/kulala.nvim",
    config = function()
      -- Setup is required, even if you don't pass any options
      require("kulala").setup()
      vim.api.nvim_set_keymap(
        "n",
        "<leader>kr",
        "require('kulala').run()<CR>",
        { noremap = true, silent = true, desc = "Send request" }
      )
      vim.api.nvim_set_keymap(
        "n",
        "<leader>kR",
        "require('kulala').replay()<CR>",
        { noremap = true, silent = true, desc = "Replay last request" }
      )
      vim.api.nvim_set_keymap(
        "n",
        "<leader>ks",
        "require('kulala').scratchpad()<CR>",
        { noremap = true, silent = true, desc = "Open scratchpad" }
      )
      vim.api.nvim_set_keymap(
        "n",
        "<leader>kc",
        "require('kulala').copy()<CR>",
        { noremap = true, silent = true, desc = "Copy request as cURL command to clipboard" }
      )
      vim.api.nvim_set_keymap(
        "n",
        "<leader>kC",
        "require('kulala').close()<CR>",
        { noremap = true, silent = true, desc = "Close kulala window and current buffer" }
      )
      vim.api.nvim_set_keymap(
        "n",
        "<leader>kt",
        "require('kulala').toggle_view()<CR>",
        { noremap = true, silent = true, desc = "Toggle between header and body view" }
      )
      vim.api.nvim_set_keymap(
        "n",
        "<leader>kS",
        "require('kulala').search()",
        { noremap = true, silent = true, desc = "Search for all .http and .rest files in cwd" }
      )
      vim.api.nvim_set_keymap(
        "n",
        "<leader>kp",
        "require('kulala').jump_prev()",
        { noremap = true, silent = true, desc = "Jump to previous request" }
      )
      vim.api.nvim_set_keymap(
        "n",
        "<leader>kn",
        "require('kulala).jump_next()",
        { noremap = true, silent = true, desc = "Jump to next request" }
      )
      vim.api.nvim_set_keymap(
        "n",
        "<leader>kG",
        ":lua require('kulala').download_graphql_schema()",
        { noremap = true, silent = true, desc = "Download schema of GraphQL server" }
      )

      local wk = require("which-key")
      wk.add({
        { "<leader>k", group = "Kulala" },
      })
    end,
  },
}
