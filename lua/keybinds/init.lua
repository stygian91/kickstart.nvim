local map = require('utils.keybind').map
local nmap = require('utils.keybind').nmap

require('keybinds.buffer')
require('keybinds.git')
require('keybinds.telescope')
require('keybinds.ui')
require('keybinds.debug')
require('keybinds.flash')
require('keybinds.session')

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
-- nmap('k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
-- nmap('j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

--------------------------------------------------
-- General
--------------------------------------------------

-- saving & quitting
nmap('<leader>q', ':q<cr>', { desc = 'Quit' })
nmap('<leader>Q', ':qa!<cr>', { desc = 'Force Quit' })
nmap('<leader>w', ':w<cr>', { desc = 'Write File' })
nmap('<leader>W', ':w!<cr>', { desc = 'Force Write File' })

-- Oil.nvim file explorer
nmap('<leader>e', '<CMD>Oil<CR>', { desc = 'Explore' })

-- clipboard
map('v', '<leader>y', '"*y', { desc = 'Yank into system register' });
nmap('<leader>p', '"*p', { desc = 'Paste from system register' });
-- nmap('<leader>d', '"_d', { desc = 'Delete into black hole register'})

-- quickfix navigation
nmap(']q', ':cnext<cr>', { desc = 'Go to next quickfix item.' })
nmap('[q', ':cprevious<cr>', { desc = 'Go to prev quickfix item.' })

-- move selected lines up/down and align them horizontally after
map('v', '<C-j>', ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map('v', '<C-k>', ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Center cursor while moving up/down half pages
nmap('<C-d>', '<C-d>zz', { silent = true })
nmap('<C-u>', '<C-u>zz', { silent = true })

-- TODO: figure out an easy keybind that would work on both mac/win/linux
--
-- nmap('<A-l>', '<C-w>l')
-- nmap('<A-h>', '<C-w>h')
-- nmap('<A-j>', '<C-w>j')
-- nmap('<A-k>', '<C-w>k')
