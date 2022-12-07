local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.setup()

local cmp = require('cmp')
local cmp_config = lsp.defaults.cmp_config()
cmp_config.window.completion = cmp.config.window.bordered()
cmp_config.window.documentation = cmp.config.disable
cmp.setup(cmp_config)
