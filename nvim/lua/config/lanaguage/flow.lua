local M = {
    requires = {
        "flow",
    },
}
function M.before() end
function M.after() end
function M.load()
    M.flow.setup({
        output = {
            buffer = true,
            split_cmd = "20split",
        },

        -- add/override the default command used for a perticular filetype
        -- the "%s" you see in the below example is interpolated by the contents of
        -- the file you are trying to run
        -- Format { <filetype> = <command> }
        filetype_cmd_map = {
            python = "python3 <<-EOF\n%s\nEOF",
            go = "go run <<-EOF\n%s\nEOF",
        },
    })
    -- optional custom variables
    require("flow.vars").add_vars({
        str = "test-val-2",
        num = 3,
        bool = true,
        var_with_func = function()
            -- the value of this var is computed by running this function at runtime
            return "test-val"
        end,
    })
end

return M
