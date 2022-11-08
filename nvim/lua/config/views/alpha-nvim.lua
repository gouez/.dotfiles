local M = {
    requires = {
        "alpha",
    },
}

function M.before() end
function M.after()end
function M.load()
    local startify = require ("alpha.themes.startify")
    M.alpha.setup(startify.config)
end


return M
