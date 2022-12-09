vim.cmd([[
      augroup daprepl
        autocmd FileType dap-repl set nobuflisted
      augroup end
    ]])
-- auto save
vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
  pattern = { "*" },
  command = "silent! wall",
  nested = true,
})
