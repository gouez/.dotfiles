-- https://github.com/nvim-lualine/lualine.nvim

local M = {
    requires = {
        "lualine",
        "swenv.api",
    },
    pyversion = vim.fn.system("python --version"):match("%d.*%d"),
}

local function get_venv()
    local res = M.swenv_api.get_current_venv()
    if res then
        return string.format("(virtualenv: '%s')", res.name)
    end
    return string.format("(version: '%s')", M.pyversion)
end

local function diff_source()
    local gitsigns = vim.b.gitsigns_status_dict
    if gitsigns then
        return {
            added = gitsigns.added,
            modified = gitsigns.changed,
            removed = gitsigns.removed,
        }
    end
end

function M.before() end
function M.load()
    local file_name = {
        "filename",
        file_status = true, -- Displays file status (readonly status, modified status)
        path = 1, -- 0: Just the filename
        -- 1: Relative path
        -- 2: Absolute path

        shorting_target = 40, -- Shortens path to leave 40 spaces in the window
        -- for other components. (terrible name, any suggestions?)
        symbols = {
            modified = "[+]", -- Text to show when the file is modified.
            readonly = "[-]", -- Text to show when the file is non-modifiable or readonly.
            unnamed = "[No Name]", -- Text to show for unnamed buffers.
        },
    }
    M.lualine.setup({
        options = {
            theme = "auto",
            icons_enabled = true,
            component_separators = { left = "", right = "" },
            section_separators = { left = "", right = "" },
            disabled_filetypes = {},
            globalstatus = true,
            refresh = {
                statusline = 100,
                tabline = 100,
                winbar = 100,
            },
        },
        sections = {
            lualine_a = {
                { "mode" },
            },
            lualine_b = {
                "branch",
                { "diff", source = diff_source },
                "diagnostics",
            },
            lualine_c = {
                file_name,
            },
            lualine_x = {
                "encoding",
                "fileformat",
                "filetype",
                {
                    get_venv,
                    cond = function()
                        return vim.bo.filetype == "python"
                    end,
                },
            },
            lualine_y = {
                "progress",
            },
            lualine_z = { "location" },
        },
    })
end

function M.after() end

return M
