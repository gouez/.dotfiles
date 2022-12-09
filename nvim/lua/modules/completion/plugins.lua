local completion = {
  ["VonHeikemen/lsp-zero.nvim"] = {
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    },
    -- event = "InsertEnter *",
    config = function()
      require('modules.completion.lsp-zero')
    end
  },
  ["ray-x/navigator.lua"] = {
    event = 'BufRead',
    requires = {
      { 'ray-x/guihua.lua', run = 'cd lua/fzy && make' },
      { 'onsails/lspkind.nvim' },
      { 'nvim-treesitter/nvim-treesitter' },
      { 'neovim/nvim-lspconfig' }
    },
    config = function()
      require 'modules.completion.navigator'
    end
  },
}
return completion
