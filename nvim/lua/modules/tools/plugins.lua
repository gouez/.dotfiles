local tools = {
  -- Optimiser
  ["lewis6991/impatient.nvim"] = {},
  -- Lua functions
  ["nvim-lua/plenary.nvim"] = { module = "plenary" },

  -- Fuzzy finder
  ["nvim-telescope/telescope.nvim"] = {
    module = "telescope",
    setup = function() helper.lazy_load_commands("telescope.nvim", "Telescope") end,
    config = function() require "modules.tools.telescope" end,
  },

  -- Fuzzy finder syntax support
  ["nvim-telescope/telescope-fzf-native.nvim"] = {
    after = "telescope.nvim",
    disable = vim.fn.executable "make" == 0,
    run = "make",
    config = function() require("telescope").load_extension "fzf" end,
  },
  -- term
  ["akinsho/toggleterm.nvim"] = {
    -- cmd = { "ToggleTerm", "TermExec" },
    -- event = { "CmdwinEnter", "CmdlineEnter" },
    config = "require('modules.tools.floaterm')",
  },

  ["mrjones2014/legendary.nvim"] = {
    requires = "dressing.nvim",
    config = "require('modules.tools.legendary')",
  },

  ["mrjones2014/smart-splits.nvim"] = {
    config = "require('modules.tools.smart-splits')",
  },

  -- Git integration
  ["lewis6991/gitsigns.nvim"] = {
    disable = vim.fn.executable "git" == 0,
    ft = "gitcommit",
    config = function() require "modules.tools.gitsigns" end,
  },
  -- ["tanvirtin/vgit.nvim"] = {
  --   config = function() require "modules.tools.vgit" end
  -- }
  ["gnikdroy/projections.nvim"] = {
    config = function() require("modules.tools.projections") end
  },
}


return tools
