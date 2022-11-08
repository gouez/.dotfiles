if not vim.fn.has("nvim-0.8") then
    assert(false, "this config require nvim-0.8")
end

if vim.g.vscode then
    -- VSCode extension
else
    require("core.setting")
    require("core.options")
    require("core.mapping")

    require("core.plugins")
    require("core.after")
end
