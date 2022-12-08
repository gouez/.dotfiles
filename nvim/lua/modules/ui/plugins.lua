local ui = {
    -- Neovim UI Enhancer
    ["stevearc/dressing.nvim"] = {
        opt = true,
        setup = function() helper.load_plugin_with_func("dressing.nvim", vim.ui, { "input", "select" }) end,
        config = function() require "modules.ui.dressing" end,
    },

    -- Icons
    ["kyazdani42/nvim-web-devicons"] = {
        disable = not vim.g.icons_enabled,
        module = "nvim-web-devicons",
    },
    -- Bufferline
    ["akinsho/bufferline.nvim"] = {
        module = "bufferline",
        event = "UIEnter",
        config = function() require "modules.ui.bufferline" end,
    },
    -- Better buffer closing
    ["famiu/bufdelete.nvim"] = {
        module = "bufdelete",
        setup = function() helper.lazy_load_commands("bufdelete.nvim", { "Bdelete", "Bwipeout" }) end,
    },

    -- color s
    ["EdenEast/nightfox.nvim"] = {
        opt = true,
        -- config = function() vim.cmd("colorscheme carbonfox") end
    },

    -- File explorer
    ["nvim-neo-tree/neo-tree.nvim"] = {
        branch = "v2.x",
        module = "neo-tree",
        requires = { { "MunifTanjim/nui.nvim", module = "nui" } },
        setup = function()
            helper.lazy_load_commands("neo-tree.nvim", "Neotree")
            vim.g.neo_tree_remove_legacy_commands = true
        end,
        config = function() require "modules.ui.neo-tree" end,
    },

    -- Statusline
    ["nvim-lualine/lualine.nvim"] = {
        config = function() require "modules.ui.lualine" end
    },

    ["lukas-reineke/indent-blankline.nvim"] = { config = "require('modules.ui.blankline')" },
    -- Color highlighting
    ["NvChad/nvim-colorizer.lua"] = {
        opt = true,
        config = function() require "modules.ui.colorizer" end,
    },

    ["rose-pine/neovim"] = {
       
    },
    ["NLKNguyen/papercolor-theme"] = {
        config = function() 
            vim.cmd("colorscheme PaperColor") 
            vim.cmd('hi VertSplit  guifg=#444444   guibg=none gui=none')
        end
    },
    ["sainnhe/gruvbox-material"]={},
}


return ui
