local editor = {
    ["numToStr/Comment.nvim"] = { event = BufRead, config = "require('Comment').setup()" },
    ["windwp/nvim-autopairs"] = { event = "InsertEnter", config = function() require "modules.editor.autopairs" end },
}


return editor
