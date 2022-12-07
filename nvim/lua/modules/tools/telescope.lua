local telescope = require "telescope"
local actions = require "telescope.actions"

telescope.setup( {
  defaults = {
    path_display = { "truncate" },
    layout_strategy = "bottom_pane",
    sorting_strategy = "ascending",
    layout_config = {
        bottom_pane = {
          height = 15,
          preview_cutoff = 100,
          prompt_position = "bottom",
        },
      },

    mappings = {
      i = {
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      },
      n = { ["q"] = actions.close },
    },
  },
})
