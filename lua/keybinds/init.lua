local map = require('utils.keybind').map
local nmap = require('utils.keybind').nmap

require('keybinds.telescope')
require('keybinds.buffer')
require('keybinds.ui')

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
