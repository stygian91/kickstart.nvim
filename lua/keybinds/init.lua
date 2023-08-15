
-- Telescope --
-- See `:help telescope.builtin`

local function map(mode, left, right, opts)
 return vim.keymap.set(mode, left, right, opts) 
end

local telescope = require('telescope.builtin')

map('n', '<leader>ff', telescope.find_files, { desc = 'Find Files' })
map('n', '<leader>fc', telescope.grep_string, { desc = 'Find Current Word' })
map('n', '<leader>fw', telescope.live_grep, { desc = 'Find Words' })
map('n', '<leader>fd', telescope.diagnostics, { desc = 'Find Diagnostics' })
map('n', '<leader>fb', telescope.buffers, { desc = 'Find Buffers' })
map('n', '<leader>fg', telescope.git_files, { desc = 'Find Git Files' })
map('n', '<leader>fh', telescope.help_tags, { desc = 'Find Help' })
map('n', '<leader>fo', telescope.oldfiles, { desc = 'Find recently opened files' })
map('n', '<leader>f/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
    layout_config = {
      width = function(_, cols, _) return math.min(cols, 100) end,
      height = function(_, rows,_ ) return math.min(rows, 30) end,
    },
  })
end, { desc = 'Fuzzily search in current buffer' })

-------------------------- ------------------------
-- Diagnostic keymaps
local diagnostic = vim.diagnostic
map('n', '[d', diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
map('n', ']d', diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
map('n', '<leader>ld', diagnostic.open_float, { desc = 'Open floating diagnostic message' })
-- vim.keymap.set('n', '<leader>q', diagnostic.setloclist, { desc = 'Open diagnostics list' })

-------------------------- ------------------------
-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
map({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

