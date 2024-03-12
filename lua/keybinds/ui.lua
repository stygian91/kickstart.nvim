local nmap = require('utils.keybind').nmap

local function toggle_bool_option(option, enabled_msg, disabled_msg)
  vim.o[option] = not vim.o[option]
  if vim.o[option] then
    print(enabled_msg)
  else
    print(disabled_msg)
  end
end

local function uimap(key, option, msg, desc)
  nmap(
    '<leader>u' .. key,
    function() toggle_bool_option(option, msg .. ' enabled.', msg .. ' disabled.') end,
    { desc = desc }
  )
end

uimap('r', 'rnu', 'Relative numbers', 'Toggle relative line numbers')
uimap('w', 'wrap', 'Word wrap', 'Toggle word wrap')
uimap('h', 'hlsearch', 'Search highlight', 'Toggle search highlight.')
uimap('s', 'list', 'Show whitespace', 'Toggle whitespace symbols')
nmap('<leader>uc', ':TSContextToggle<cr>', { desc = 'Toggle TreeSitter context' })
