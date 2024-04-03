-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  -- import/override with your plugins folder
  { import = "astrocommunity.colorscheme.dracula-nvim" },
  { import = "astrocommunity.color.transparent-nvim"},
  { import = "astrocommunity.editing-support.hypersonic-nvim"},
  { import = "astrocommunity.editing-support.vim-move"},
  { import = "astrocommunity.motion.nvim-spider"},
  -- { import = "astrocommunit--[[ y. ]]editing-support.image.nvim"},
  { import = "astrocommunity.note-taking.obsidian-nvim"},
}
