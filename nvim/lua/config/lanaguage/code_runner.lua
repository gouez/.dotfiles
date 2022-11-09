local api = require("utils.api")

local M = {
    requires = {
        "code_runner",
    },
}
function M.before()
    M.register_key()
end
function M.after() end
function M.load()
    M.code_runner.setup({
        -- put here the commands by filetype
        filetype = {
            java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
            python = "python3 -u",
            typescript = "deno run",
            rust = "cd $dir && rustc $fileName && $dir/$fileNameWithoutExt",
            go = "cd $dir && go run $fileName ",
        },
    })
end

function M.register_key()
    api.map.bulk_register({
        {
            mode = { "n" },
            lhs = "<leader>crr",
            rhs = ":RunCode<CR>",
            options = { silent = true },
            description = "run code",
        },
        {
            mode = { "n" },
            lhs = "<leader>crf",
            rhs = ":RunFile<CR>",
            options = { silent = true },
            description = "run file",
        },
        {
            mode = { "n" },
            lhs = "<leader>crc",
            rhs = ":RunClose<CR>",
            options = { silent = true },
            description = "run close",
        },
        {
            mode = { "n" },
            lhs = "<leader>crt",
            rhs = ":CRFiletype<CR>",
            options = { silent = true },
            description = "Open json with supported files",
        },
        {
            mode = { "n" },
            lhs = "<leader>crp",
            rhs = ":CRProjects<CR>",
            options = { silent = true },
            description = "Open json with list of projects",
        },
    })
end

return M
