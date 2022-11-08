local api = require("utils.api")
local M = {
    requires = {
        "symbols-outline",
    },
}

function M.before()
    M.register_key()
end
function M.load()
    local opts = {
        highlight_hovered_item = true,
        show_guides = true,
        auto_preview = false,
        position = "right",
        relative_width = true,
        width = 25,
        auto_close = false,
        show_numbers = false,
        show_relative_numbers = false,
        show_symbol_details = true,
        preview_bg_highlight = "Pmenu",
        autofold_depth = nil,
        auto_unfold_hover = true,
        fold_markers = { "", "" },
        wrap = false,
        keymaps = { -- These keymaps can be a string or a table for multiple keys
            close = { "<Esc>", "q" },
            goto_location = "<Cr>",
            focus_location = "o",
            hover_symbol = "<C-space>",
            toggle_preview = "K",
            rename_symbol = "r",
            code_actions = "a",
            fold = "h",
            unfold = "l",
            fold_all = "W",
            unfold_all = "E",
            fold_reset = "R",
        },
        lsp_blacklist = {},
        symbol_blacklist = {},
        symbols = {
            File = { icon = "", hl = "TSURI" },
            Module = { icon = "", hl = "TSNamespace" },
            Namespace = { icon = "", hl = "TSNamespace" },
            Package = { icon = "", hl = "TSNamespace" },
            Class = { icon = "𝓒", hl = "TSType" },
            Method = { icon = "ƒ", hl = "TSMethod" },
            Property = { icon = "", hl = "TSMethod" },
            Field = { icon = "", hl = "TSField" },
            Constructor = { icon = "", hl = "TSConstructor" },
            Enum = { icon = "ℰ", hl = "TSType" },
            Interface = { icon = "ﰮ", hl = "TSType" },
            Function = { icon = "", hl = "TSFunction" },
            Variable = { icon = "", hl = "TSConstant" },
            Constant = { icon = "", hl = "TSConstant" },
            String = { icon = "𝓐", hl = "TSString" },
            Number = { icon = "#", hl = "TSNumber" },
            Boolean = { icon = "⊨", hl = "TSBoolean" },
            Array = { icon = "", hl = "TSConstant" },
            Object = { icon = "⦿", hl = "TSType" },
            Key = { icon = "🔐", hl = "TSType" },
            Null = { icon = "NULL", hl = "TSType" },
            EnumMember = { icon = "", hl = "TSField" },
            Struct = { icon = "𝓢", hl = "TSType" },
            Event = { icon = "🗲", hl = "TSType" },
            Operator = { icon = "+", hl = "TSOperator" },
            TypeParameter = { icon = "𝙏", hl = "TSParameter" },
        },
    }
    M.symbols_outline.setup(opts)
end
function M.after() end
function M.register_key()
    api.map.bulk_register({
        {
            mode = { "n" },
            lhs = "<leader>2",
            rhs = "<cmd>SymbolsOutline<cr>",
            options = { silent = true },
            description = "Open Outline Explorer",
        },
        -- {
        --     mode = { "n" },
        --     lhs = "{",
        --     rhs = "<cmd>AerialPrev<cr>",
        --     options = { silent = true },
        --     description = "Move item up",
        -- },
        -- {
        --     mode = { "n" },
        --     lhs = "}",
        --     rhs = "<cmd>AerialNext<cr>",
        --     options = { silent = true },
        --     description = "Move item down",
        -- },
        -- {
        --     mode = { "n" },
        --     lhs = "[[",
        --     rhs = "<cmd>AerialPrevUp<cr>",
        --     options = { silent = true },
        --     description = "Move up one level",
        -- },
        -- {
        --     mode = { "n" },
        --     lhs = "]]",
        --     rhs = "<cmd>AerialNextUp<cr>",
        --     options = { silent = true },
        --     description = "Move down one level",
        -- },
    })
end

return M
