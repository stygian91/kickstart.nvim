local nmap = require('utils.keybind').nmap
local ts = require('telescope.builtin')
local function telemap(left, right, desc)
  return nmap('<leader>f' .. left, right, { desc = 'Find ' .. desc })
end

telemap('f', ts.find_files, 'Files')
telemap('F', function() ts.find_files({ hidden = true, no_ignore = true }) end, 'Files Everywhere')
telemap('c', ts.grep_string, 'Current Word')
telemap('w', ts.live_grep, 'Words')
telemap('W', function()
  ts.live_grep({
    glob_pattern = '!.git',
    additional_args = function(args)
      return vim.list_extend(args, {
        "--hidden",
        "--no-ignore",
      })
    end,
  })
end, 'Words Everywhere')

telemap('d', function() ts.diagnostics({ bufnr = 0 }) end, 'Diagnostics')
telemap('D', ts.diagnostics, 'Workspace Diagnostics')
telemap('b', ts.buffers, 'Buffers')
telemap('g', ts.git_status, 'Git Files')
telemap('h', ts.help_tags, 'Help')
telemap('o', ts.oldfiles, 'Recently Opened Files')
telemap('y', '<cmd>Telescope neoclip<cr>', 'Yank History')
telemap('q', ts.quickfix, 'Quickfix')

telemap('/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    -- previewer = false,
    layout_config = {
      width = function(_, cols) return math.min(cols, 100) end,
      height = function(_, rows) return math.min(rows, 30) end,
    },
  })
end, 'in current buffer')
