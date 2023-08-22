local map = require 'utils.keybind'.map
local nmap = require 'utils.keybind'.nmap

require('keybinds.telescope')
require('keybinds.buffer')

--------------------------------------------------
-- Diagnostic keymaps
--------------------------------------------------

local diagnostic = vim.diagnostic
nmap('[d', diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
nmap(']d', diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
nmap('<leader>ld', diagnostic.open_float, { desc = 'Open floating diagnostic message' })
-- vim.keymap.set('n', '<leader>q', diagnostic.setloclist, { desc = 'Open diagnostics list' })

--------------------------------------------------
-- Keymaps for better default experience
--------------------------------------------------

map({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
nmap('k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
nmap('j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

--------------------------------------------------
-- General
--------------------------------------------------

nmap('<leader>q', ':q<cr>', { desc = 'Quit' })
nmap('<leader>w', ':w<cr>', { desc = 'Write File' })
nmap('<leader>e', function()
  require('telescope').extensions.file_browser.file_browser({
    path = '%:p:h',
  })
end, { desc = 'Explore' })

--------------------------------------------------
-- UI
--------------------------------------------------

local function toggle_bool_option(option, enabled_msg, disabled_msg)
  vim.o[option] = not vim.o[option]
  if vim.o[option] then
    print(enabled_msg)
  else
    print(disabled_msg)
  end
end

nmap('<leader>ur', function()
  toggle_bool_option('rnu', 'Relative numbers enabled.', 'Relative numbers disabled.')
end, { desc = 'Toggle relative line numbers' })

nmap('<leader>uw', function()
  toggle_bool_option('wrap', 'Word wrap enabled.', 'Word wrap disabled.')
end, { desc = 'Toggle word wrap' })

nmap('<leader>uh', function()
  toggle_bool_option('hlsearch', 'Search highlight enabled', 'Search highlight disabled.')
end, { desc = 'Toggle search highlight' })

nmap('<leader>us', function()
  toggle_bool_option('list', 'Show whitespace enabled.', 'Show whitespace disabled.')
end, { desc = 'Toggle whitespace symbols' })
