local lang = {
  -- Syntax highlighting
  ["nvim-treesitter/nvim-treesitter"] = {
    module = "nvim-treesitter",
    setup = function()
      helper.lazy_load_commands("nvim-treesitter", {
        "TSBufDisable",
        "TSBufEnable",
        "TSBufToggle",
        "TSDisable",
        "TSEnable",
        "TSToggle",
        "TSInstall",
        "TSInstallInfo",
        "TSInstallSync",
        "TSModuleInfo",
        "TSUninstall",
        "TSUpdate",
        "TSUpdateSync",
      })
    end,
    run = function() require("nvim-treesitter.install").update { with_sync = true } () end,
    config = function() require "modules.lang.treesitter" end,
  },
  -- LSP symbols
  ["stevearc/aerial.nvim"] = {
    module = "aerial",
    after = { "nvim-treesitter", "nvim-lspconfig" },
    ft = { "man", "markdown" },
    config = function() require "modules.lang.aerial" end,
  },
  ["mfussenegger/nvim-dap"] = { config = "require('modules.lang.dap')" },
  ["rcarriga/nvim-dap-ui"] = {},
  ["theHamsta/nvim-dap-virtual-text"] = {},
  ["sakhnik/nvim-gdb"] = {
    opt = true,
    run = "./install.sh",
    cmd = { "GdbStart", "GdbStartLLDB", },
    keys = {
      "<F4>",
    },
    config = "require('modules.lang.gdb')"
  },
  ["mfussenegger/nvim-jdtls"] = {
    opt = true,
    ft = { "java" },
  },
  ["ray-x/go.nvim"] = {
    ft = { "go", "gomod" }, module = { "go" }, config = "require('modules.lang.go')",
  },

}


return lang
