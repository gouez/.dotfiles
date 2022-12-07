local is_available = helper.is_available

local maps = { i = {}, n = {}, v = {}, t = {}, [""] = {} }

maps[""]["<Space>"] = "<Nop>"

-- Standard Operations
maps.n["<leader>w"] = { "<cmd>w<cr>", desc = "Save" }
maps.n["<leader>q"] = { "<cmd>q<cr>", desc = "Quit" }
maps.n["<leader>h"] = { "<cmd>nohlsearch<cr>", desc = "No Highlight" }
maps.n["<leader>fn"] = { "<cmd>enew<cr>", desc = "New File" }
maps.n["<C-s>"] = { "<cmd>w!<cr>", desc = "Force write" }
maps.n["<C-q>"] = { "<cmd>q!<cr>", desc = "Force quit" }
maps.n["Q"] = "<Nop>"
maps.n["\\"] = { "<cmd>split<cr>", desc = "horizontal split" }
maps.n["|"] = { "<cmd>vsplit<cr>", desc = "vertical split" }
if is_available "bufferline.nvim" then
  maps.n["<S-l>"] = { "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer tab" }
  maps.n["<S-h>"] = { "<cmd>BufferLineCyclePrev<cr>", desc = "Previous buffer tab" }
  maps.n[">b"] = { "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer tab right" }
  maps.n["<b"] = { "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer tab left" }
else
  maps.n["<S-l>"] = { "<cmd>bnext<cr>", desc = "Next buffer" }
  maps.n["<S-h>"] = { "<cmd>bprevious<cr>", desc = "Previous buffer" }
end
-- Smart Splits
if is_available "smart-splits.nvim" then
  -- Better window navigation
  maps.n["<C-h>"] = { function() require("smart-splits").move_cursor_left() end, desc = "Move to left split" }
  maps.n["<C-j>"] = { function() require("smart-splits").move_cursor_down() end, desc = "Move to below split" }
  maps.n["<C-k>"] = { function() require("smart-splits").move_cursor_up() end, desc = "Move to above split" }
  maps.n["<C-l>"] = { function() require("smart-splits").move_cursor_right() end, desc = "Move to right split" }

  -- Resize with arrows
  maps.n["<C-Up>"] = { function() require("smart-splits").resize_up() end, desc = "Resize split up" }
  maps.n["<C-Down>"] = { function() require("smart-splits").resize_down() end, desc = "Resize split down" }
  maps.n["<C-Left>"] = { function() require("smart-splits").resize_left() end, desc = "Resize split left" }
  maps.n["<C-Right>"] = { function() require("smart-splits").resize_right() end, desc = "Resize split right" }
else
  maps.n["<C-h>"] = { "<C-w>h", desc = "Move to left split" }
  maps.n["<C-j>"] = { "<C-w>j", desc = "Move to below split" }
  maps.n["<C-k>"] = { "<C-w>k", desc = "Move to above split" }
  maps.n["<C-l>"] = { "<C-w>l", desc = "Move to right split" }
  maps.n["<C-Up>"] = { "<cmd>resize -2<CR>", desc = "Resize split up" }
  maps.n["<C-Down>"] = { "<cmd>resize +2<CR>", desc = "Resize split down" }
  maps.n["<C-Left>"] = { "<cmd>vertical resize -2<CR>", desc = "Resize split left" }
  maps.n["<C-Right>"] = { "<cmd>vertical resize +2<CR>", desc = "Resize split right" }
end

-- Terminal
if is_available "toggleterm.nvim" then
  maps.n["<leader>t"] = { "<cmd>ToggleTerm direction=horizontal<cr>", desc = "open term" }
  if vim.fn.executable "lazygit" == 1 then
    -- maps.n["<leader>gg"] = { function() toggle_term_cmd "lazygit" end, desc = "ToggleTerm lazygit" }
    -- maps.n["<leader>tl"] = { function() toggle_term_cmd "lazygit" end, desc = "ToggleTerm lazygit" }
  end
end

maps.n["<leader>sf"] = { "<cmd>Telescope find_files<cr>", desc = "search files" }
maps.n["<leader>sw"] = { "<cmd>Telescope live_grep<cr>", desc = "search word" }
maps.n["<C-p>"] = { "<cmd>Legendary<cr>", desc = "Legendary" }
maps.n["<leader>1"] = { "<cmd>Neotree toggle<cr>", desc = "Neotree toggle" }

-- SymbolsOutline
if is_available "aerial.nvim" then
  maps.n["<leader>2"] = { function() require("aerial").toggle() end, desc = "Symbols outline" }
end

-- debug
maps.n["<leader>db"] = { function() require 'dap'.toggle_breakpoint() end, desc = "breakpoints" }

if is_available 'legendary.nvim' then
  local legendary = require('legendary')
  legendary.commands({
    -- { ':Lazygit', function() _LAZYGIT_TOGGLE() end, description = 'lazygit' },
  })
  legendary.funcs({
    -- { function()
    --   local Terminal = require("toggleterm.terminal").Terminal
    --   local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
    --   lazygit:toggle()
    -- end, description = 'lazygit' }
  })
end
helper.set_mappings(maps)
