_G.helper = {}
local home = vim.env.HOME
local map = vim.keymap.set


function helper.get_config_path()
  local config = os.getenv('XDG_CONFIG_DIR')
  if not config then
    return home .. '/.config/nvim'
  end
  return config
end

function helper.get_data_path()
  local data = os.getenv('XDG_DATA_DIR')
  if not data then
    return home .. '/.local/share/nvim'
  end
  return data
end

function helper.get_cache_path()
  local cache = os.getenv('XDG_CACHE_DIR')
  if not cache then
    return home .. '/.cache/nvim/'
  end
end

--- Check if a plugin is defined in packer. Useful with lazy loading when a plugin is not necessarily loaded yet
-- @param plugin the plugin string to search for
-- @return boolean value if the plugin is available
function helper.is_available(plugin) return packer_plugins ~= nil and packer_plugins[plugin] ~= nil end

function helper.load_plugin_with_func(plugin, module, func_names)
  if type(func_names) == "string" then func_names = { func_names } end
  for _, func in ipairs(func_names) do
    local old_func = module[func]
    module[func] = function(...)
      module[func] = old_func
      require("packer").loader(plugin)
      module[func](...)
    end
  end
end

function helper.lazy_load_commands(plugin, commands)
  if type(commands) == "string" then commands = { commands } end
  if helper.is_available(plugin) and not packer_plugins[plugin].loaded then
    for _, command in ipairs(commands) do
      pcall(
        vim.cmd,
        string.format(
          'command -nargs=* -range -bang -complete=file %s lua require("packer.load")({"%s"}, { cmd = "%s", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)'
          ,
          command,
          plugin,
          command
        )
      )
    end
  end
end

--- Table based API for setting keybindings
-- @param map_table A nested table where the first key is the vim mode, the second key is the key to map, and the value is the function to set the mapping to
-- @param base A base set of options to set on every keybinding
function helper.set_mappings(map_table, base)
  -- iterate over the first keys for each mode
  for mode, maps in pairs(map_table) do
    -- iterate over each keybinding set in the current mode
    for keymap, options in pairs(maps) do
      -- build the options for the command accordingly
      if options then
        local cmd = options
        local keymap_opts = base or {}
        if type(options) == "table" then
          cmd = options[1]
          keymap_opts = vim.tbl_deep_extend("force", options, keymap_opts)
          keymap_opts[1] = nil
        end
        -- extend the keybinding options with the base provided and set the mapping
        map(mode, keymap, cmd, keymap_opts)
      end
    end
  end
end

function helper.join(...)
  return table.concat(vim.tbl_flatten({ ... }), "/")
end

function helper.get_importable_subfiles(dir)
  local sub_dir = dir:gsub("%.", "/")
  local root_dir = helper.join(vim.fn.stdpath("config"), "lua", sub_dir)
  ---@diagnostic disable-next-line: param-type-mismatch
  local file_tbl = vim.fn.globpath(root_dir, "*.lua", false, true)
  for i, v in ipairs(file_tbl) do
    file_tbl[i] = string.format("%s/%s", sub_dir, vim.fn.fnamemodify(v, ":t:r"))
  end
  return file_tbl
end

function helper.legend_register(table)
  if not helper.is_available('legendary.nvim') then
    return
  end
  local legendary = require('legendary')
  print(table)
end

return helper
