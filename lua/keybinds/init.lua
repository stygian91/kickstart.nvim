local map = require 'utils.keybind'.map
local nmap = require 'utils.keybind'.nmap

require('keybinds.telescope')

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
-- Buffer
--------------------------------------------------

nmap('<leader>c', function() vim.api.nvim_buf_delete(0, {}) end, { desc = 'Close current buffer' })
nmap('<leader>bc', ':bufdo bd<cr>', { desc = 'Close All Buffers' })
nmap('<leader>bn', ':enew<cr>', { desc = 'Create an Empty Buffer' })
nmap(']b', '<cmd>bn<cr>', { desc = 'Next buffer' })
nmap('[b', '<cmd>bp<cr>', { desc = 'Previous buffer' })

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

nmap('<leader>ur', function()
  vim.o.rnu = not vim.o.rnu
  if vim.o.rnu then
    print('Relative numbers enabled.')
  else
    print('Relative numbers disabled.')
  end
end, { desc = 'Toggle relative line numbers' })

nmap('<leader>uw', function()
  vim.o.wrap = not vim.o.wrap
  if vim.o.wrap then
    print('Word wrap enabled.')
  else
    print('Word wrap disabled.')
  end
end, { desc = 'Toggle word wrap' })
