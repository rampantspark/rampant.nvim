return {
  {
    "eandrju/cellular-automaton.nvim",
    event = "BufRead",
    -- opts = {
    -- config = function()
    --
    -- end,
    -- },
    vim.api.nvim_set_keymap('n', '<leader>Fr', '<cmd>CellularAutomaton make_it_rain<cr>',
      { noremap = true, silent = true, desc = "FML :(" }),
    vim.api.nvim_set_keymap('n', '<leader>Fg', '<cmd>CellularAutomaton game_of_life<cr>',
      { noremap = true, silent = true, desc = "Game of Life" })
  },
}
