---@type LazySpec
return {
  {
    "eandrju/cellular-automaton.nvim",
    -- event = "UIEnter",
    config = function()
      -- require("cellular-automaton").setup()
      vim.api.nvim_set_keymap(
        "n",
        "<leader>*f",
        "<cmd>CellularAutomaton make_it_rain<CR>",
        { noremap = true, silent = true, desc = "Make it rain" }
      )
      vim.api.nvim_set_keymap(
        "n",
        "<leader>*r",
        "<cmd>CellularAutomaton game_of_life<CR>",
        { noremap = true, silent = true, desc = "Game of life" }
      )
      local wk = require("which-key")
      wk.add({
        { "<leader>*", group = "Cellular Automaton" },
      })
    end,
  },
}
