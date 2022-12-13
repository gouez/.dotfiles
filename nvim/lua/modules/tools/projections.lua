require("projections").setup({})

-- Bind <leader>fp to Telescope projections
require('telescope').load_extension('projections')
vim.keymap.set("n", "<leader>sp", function() vim.cmd("Telescope projections") end)

-- Autostore session on VimExit
local Session = require("projections.session")

vim.api.nvim_create_autocmd({ "VimEnter" }, {
  callback = function()
    if vim.fn.argc() ~= 0 then return end
    local session_info = Session.info(vim.loop.cwd())
    if session_info == nil then
      Session.restore_latest()
    else
      Session.restore(vim.loop.cwd())
    end
  end,
  desc = "Restore last session automatically"
})
vim.api.nvim_create_autocmd({ 'VimLeavePre' }, {
  callback = function() Session.store(vim.loop.cwd()) end,
})

-- Switch to project if vim was started in a project dir
local switcher = require("projections.switcher")
vim.api.nvim_create_autocmd({ "VimEnter" }, {
  callback = function()
    if vim.fn.argc() == 0 then switcher.switch(vim.loop.cwd()) end
  end,
})
