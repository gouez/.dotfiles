local impatient_ok, impatient = pcall(require, "impatient")
if impatient_ok then impatient.enable_profile() end
if vim.g.vscode then
else
    require('core')
end
