local nmap = require('utils.keybind').nmap
local ts = require('telescope.builtin')
local function telemap(left, right, desc)
  return nmap(left, right, { desc = 'Find ' .. desc })
end

telemap('<leader>ff', ts.find_files, 'Files')
telemap('<leader>fc', ts.grep_string, 'Current Word')
telemap('<leader>fw', ts.live_grep, 'Words')
telemap('<leader>fd', ts.diagnostics, 'Diagnostics')
telemap('<leader>fb', ts.buffers, 'Buffers')
telemap('<leader>fg', ts.git_files, 'Git Files')
telemap('<leader>fh', ts.help_tags, 'Help')
telemap('<leader>fo', ts.oldfiles, 'recently opened files')
telemap('<leader>f/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
    layout_config = {
      width = function(_, cols, _) return math.min(cols, 100) end,
      height = function(_, rows, _) return math.min(rows, 30) end,
    },
  })
end, 'in current buffer')

