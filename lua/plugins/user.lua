---@type LazySpec
return {
  { "folke/neodev.nvim",            opts = {} },
  {
    "AstroNvim/astroui",
    ---@type AstroUIOpts
    opts = {
      -- change colorscheme
      colorscheme = "gruvbox-baby",
      -- AstroUI allows you to easily modify highlight groups easily for any and all colorschemes
      highlights = {
        init = { -- this table overrides highlights in all themes
          -- Normal = { bg = "#000000" },
        },
        astrotheme = { -- a table of overrides/changes when applying the astrotheme theme
          -- Normal = { bg = "#000000" },
        },
      },
      -- Icons can be configured throughout the interface
      icons = {
        -- configure the loading of the lsp in the status line
        LSPLoading1 = "⠋",
        LSPLoading2 = "⠙",
        LSPLoading3 = "⠹",
        LSPLoading4 = "⠸",
        LSPLoading5 = "⠼",
        LSPLoading6 = "⠴",
        LSPLoading7 = "⠦",
        LSPLoading8 = "⠧",
        LSPLoading9 = "⠇",
        LSPLoading10 = "⠏",
      },
    },
  },
  {
    "natecraddock/workspaces.nvim",
    config = function()
      require("workspaces").setup {
        -- path to a file to store workspaces data in
        -- on a unix system this would be ~/.local/share/nvim/workspaces
        path = vim.fn.stdpath "data" .. "/workspaces",

        -- to change directory for nvim (:cd), or only for window (:lcd)
        -- deprecated, use cd_type instead
        -- global_cd = true,

        -- controls how the directory is changed. valid options are "global", "local", and "tab"
        --   "global" changes directory for the neovim process. same as the :cd command
        --   "local" changes directory for the current window. same as the :lcd command
        --   "tab" changes directory for the current tab. same as the :tcd command
        --
        -- if set, overrides the value of global_cd
        cd_type = "global",

        -- sort the list of workspaces by name after loading from the workspaces path.
        sort = true,

        -- sort by recent use rather than by name. requires sort to be true
        mru_sort = true,

        -- option to automatically activate workspace when opening neovim in a workspace directory
        auto_open = false,

        -- option to automatically activate workspace when changing directory not via this plugin
        auto_dir = false,

        -- enable info-level notifications after adding or removing a workspace
        notify_info = true,

        -- lists of hooks to run after specific actions
        -- hooks can be a lua function or a vim command (string)
        -- lua hooks take a name, a path, and an optional state table
        -- if only one hook is needed, the list may be omitted
        hooks = {
          add = {},
          remove = {},
          rename = {},
          open_pre = {},
          open = { "Telescope find_files" },
        },
      }
      vim.api.nvim_set_keymap(
        "n",
        "<leader>Wa",
        ":WorkspacesAdd<CR>",
        { noremap = true, silent = true, desc = "Add a workspace" }
      )
      vim.api.nvim_set_keymap(
        "n",
        "<leader>WR",
        ":WorkspacesRemove<CR>",
        { noremap = true, silent = true, desc = "Remove a workspace" }
      )
      vim.api.nvim_set_keymap(
        "n",
        "<leader>Wr",
        ":WorkspacesRename<CR>",
        { noremap = true, silent = true, desc = "Rename a workspace" }
      )
      vim.api.nvim_set_keymap(
        "n",
        "<leader>Wo",
        ":Telescope workspaces<CR>",
        { noremap = true, silent = true, desc = "Open workspaces" }
      )

      local wk = require "which-key"
      wk.add {
        { "<leader>W", group = "Workspaces" },
      }
    end,
  },

  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      { "tpope/vim-dadbod",                     lazy = true },
      { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true }, -- Optional
    },
    cmd = {
      "DBUI",
      "DBUIToggle",
      "DBUIAddConnection",
      "DBUIFindBuffer",
    },
    init = function()
      -- Your DBUI configuration
      vim.g.db_ui_use_nerd_fonts = 1

      vim.api.nvim_set_keymap("n", "<leader>Xo", ":DBUI<CR>", { noremap = true, silent = true, desc = "Open DBUI" })
      vim.api.nvim_set_keymap(
        "n",
        "<leader>Xt",
        ":DBUIToggle<CR>",
        { noremap = true, silent = true, desc = "Toggle DBUI" }
      )
      vim.api.nvim_set_keymap(
        "n",
        "<leader>Xa",
        ":DBUIAddConnection<CR>",
        { noremap = true, silent = true, desc = "Add a connection DBUI" }
      )
      vim.api.nvim_set_keymap(
        "n",
        "<leader>Xf",
        ":DBUIFindBuffer<CR>",
        { noremap = true, silent = true, desc = "Find a DBUI buffer" }
      )

      local wk = require "which-key"
      wk.add {
        { "<leader>X", group = "Dadbod UI" },
      }
    end,
  },

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
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      "3rd/image.nvim",              -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    config = function()
      require("neo-tree").setup {
        close_if_last_window = true,
        window = {
          position = "right",
        },
        sources = {
          "filesystem",
          "netman.ui.neo-tree",
          -- { source = "netman.ui.neo-tree", display_name = " Remote "},
        },
      }
    end,
  },
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

      local wk = require "which-key"
      wk.add {
        { "<leader>k", group = "Kulala" },
      }
    end,
  },

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
      local wk = require "which-key"
      wk.add {
        { "<leader>*", group = "Cellular Automaton" },
      }
    end,
  },
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
          path = "/home/rampantspark/Vaults/rampantspark",
        },
      },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
  },
  "andweeb/presence.nvim",
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },
  -- == Examples of Overriding Plugins ==

  -- customize alpha options
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      -- customize the dashboard header
      opts.section.header.val = {
        "                                        _                        _    ",
        "                                       | |                      | |   ",
        "  _ __ __ _ _ __ ___  _ __   __ _ _ __ | |_ ___ _ __   __ _ _ __| | __",
        " | '__/ _` | '_ ` _ \\| '_ \\ / _` | '_ \\| __/ __| '_ \\ / _` | '__| |/ /",
        " | | | (_| | | | | | | |_) | (_| | | | | |_\\__ \\ |_) | (_| | |  |   < ",
        " |_|  \\__,_|_| |_| |_| .__/ \\__,_|_| |_|\\__|___/ .__/ \\__,_|_|  |_|\\_\\",
        "                     | |                       | |                    ",
        "                     |_|                       |_|                    ",
      }
      return opts
    end,
  },

  -- You can disable default plugins as follows:
  { "max397574/better-escape.nvim", enabled = false },

  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
    run = "make install_jsregexp",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip" (plugin, opts) -- include the default astronvim config that calls the setup call
      require("luasnip.loaders.from_vscode").lazy_load({ paths = "~/.config/nvim/snippets" })
    end,
  },

  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.nvim-autopairs" (plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom autopairs configuration such as custom rules
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"
      npairs.add_rules(
        {
          Rule("$", "$", { "tex", "latex" })
          -- don't add a pair if the next character is %
              :with_pair(cond.not_after_regex "%%")
          -- don't add a pair if  the previous character is xxx
              :with_pair(
                cond.not_before_regex("xxx", 3)
              )
          -- don't move right when repeat character
              :with_move(cond.none())
          -- don't delete if the next character is xx
              :with_del(cond.not_after_regex "xx")
          -- disable adding a newline when you press <cr>
              :with_cr(cond.none()),
        },
        -- disable for .vim files, but it work for another filetypes
        Rule("a", "a", "-vim")
      )
    end,
  },
}
