local function map(mode, left, right, opts)
  return vim.keymap.set(mode, left, right, opts)
end

local function nmap(left, right, opts)
  return map('n', left, right, opts)
end

--------------------------------------------------
-- Telescope
-- See `:help telescope.builtin`
--------------------------------------------------

local telescope = require('telescope.builtin')

nmap('<leader>ff', telescope.find_files, { desc = 'Find Files' })
nmap('<leader>fc', telescope.grep_string, { desc = 'Find Current Word' })
nmap('<leader>fw', telescope.live_grep, { desc = 'Find Words' })
nmap('<leader>fd', telescope.diagnostics, { desc = 'Find Diagnostics' })
nmap('<leader>fb', telescope.buffers, { desc = 'Find Buffers' })
nmap('<leader>fg', telescope.git_files, { desc = 'Find Git Files' })
nmap('<leader>fh', telescope.help_tags, { desc = 'Find Help' })
nmap('<leader>fo', telescope.oldfiles, { desc = 'Find recently opened files' })
nmap('<leader>f/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
    layout_config = {
      width = function(_, cols, _) return math.min(cols, 100) end,
      height = function(_, rows, _) return math.min(rows, 30) end,
    },
  })
end, { desc = 'Fuzzily search in current buffer' })

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
-- See `:help vim.keymap.set()`
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
nmap('<leader>n', ':enew<cr>', { desc = 'Create an Empty Buffer' })

--------------------------------------------------

--------------------------------------------------
-- General
--------------------------------------------------

nmap('<leader>w', ':w<cr>', { desc = 'Write File' })

