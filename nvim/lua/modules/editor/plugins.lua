local editor = {
  ["numToStr/Comment.nvim"] = { event = BufRead, config = "require('Comment').setup()" },
  ["windwp/nvim-autopairs"] = { event = "InsertEnter", config = function() require "modules.editor.autopairs" end },
  ["ggandor/leap.nvim"] = {
    event = "BufRead",
    config = function() require "modules.editor.leap" end
  },
  ["ggandor/flit.nvim"] = {
    requires = "ggandor/leap.nvim"
  }
}


return editor
