---@type LazySpec
return {
  {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
    run = "make install_jsregexp",
    config = function(plugin, opts)
      require("astronvim.plugins.configs.luasnip")(plugin, opts) -- include the default astronvim config that calls the setup call
      require("luasnip.loaders.from_vscode").lazy_load({ paths = "~/.config/nvim/snippets" })
    end,
  },
}
