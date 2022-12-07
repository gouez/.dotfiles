vim.g.gruvbox_material_background = "hard"
vim.g.gruvbox_material_better_performance = 1
vim.g.gruvbox_material_diagnostic_virtual_text = "colored"
vim.g.gruvbox_material_diagnostic_text_highlight = 1
vim.g.gruvbox_material_palette = "material" -- original, mix, material
vim.g.gruvbox_material_enable_italic = 1
vim.g.gruvbox_material_sign_column_background = "none"

vim.g.gruvbox_material_invert_selection = 0
vim.g.gruvbox_material_enable_italic = 1
vim.g.gruvbox_material_improved_strings = 1
vim.g.gruvbox_material_improved_warnings = 1
vim.g.gruvbox_material_enable_bold = 1

local grpid = vim.api.nvim_create_augroup('custom_highlights_gruvboxmaterial', {})
vim.api.nvim_create_autocmd('ColorScheme', {
  group = grpid,
  pattern = 'gruvbox-material',
  command =
  'hi NvimTreeNormal                     guibg=#181818 |' ..
      'hi NvimTreeEndOfBuffer                guibg=#181818 |' ..
      'hi NeoTreeDirectoryIcon               guifg=#e78a4e |' ..
      'hi NoiceCmdlinePopupBorderCmdline     guifg=#ea6962 guibg=#282828 |' ..
      -- 'hi TelescopePromptBorder              guifg=#ea6962 guibg=#282828 |' ..
      'hi Normal                             guibg=black |' ..
      'hi EndOfBuffer                        guibg=black |' ..
      -- 'hi TelescopePromptNormal              guifg=#ea6962 guibg=#282828 |' ..
      -- 'hi TelescopePromptTitle               guifg=#ea6962 guibg=#282828 |' ..
      -- 'hi TelescopePromptPrefix              guifg=#ea6962 guibg=#282828 |' ..
      -- 'hi TelescopePromptCounter             guifg=#ea6962 guibg=#282828 |' ..
      -- 'hi TelescopePreviewTitle              guifg=#89b482 guibg=#282828 |' ..
      -- 'hi TelescopePreviewBorder             guifg=#89b482 guibg=#282828 |' ..
      -- 'hi TelescopeResultsTitle              guifg=#89b482 guibg=#282828 |' ..
      -- 'hi TelescopeResultsBorder             guifg=#89b482 guibg=#282828 |' ..
      -- 'hi TelescopeMatching                  guifg=#d8a657 guibg=#282828 |' ..
      -- 'hi TelescopeSelection                 guifg=#ffffff guibg=#32302f |' ..
      'hi FloatBorder                         guibg=black|' ..
      'hi BqfPreviewBorder                    guibg=black |' ..
      'hi NormalFloat                        guibg=black |' ..
      'hi IndentBlanklineContextChar         guifg=#d3869b |' ..
      'hi markid1                            guifg=#ff8f88 |' ..
      'hi markid2                            guifg=#ffb074 |' ..
      'hi markid3                            guifg=#cfdc8b |' ..
      'hi markid4                            guifg=#a3d4c9 |' ..
      'hi markid5                            guifg=#f9acc1 |' ..
      'hi markid6                            guifg=#afdaa8 |' ..
      'hi markid7                            guifg=#fecc7d |' ..
      'hi markid8                            guifg=#eed8b2 |' ..
      'hi markid9                            guifg=#ffedc7 |' ..
      'hi Pmenu                              guibg=black |' ..
      'hi PmenuSel NONE |' ..
      'hi link PmenuSel DiffAdd |' ..
      'hi markid10                           guifg=#cebfaa |'
})

