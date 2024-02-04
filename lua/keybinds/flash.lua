local nmap = require('utils.keybind').nmap

-- local function flashmap(left, right, desc)
--   return nmap('<leader>s' .. left, right, { desc = 'Flash ' .. desc })
-- end
--
-- flashmap('s', function () require('flash').jump() end, 'Jump')
-- flashmap('S', function () require('flash').treesitter() end, 'Treesitter')
-- flashmap('r', function () require('flash').treesitter_search() end, 'Treesitter Search')

nmap('<leader>s', function () require('flash').jump() end, { desc = 'Flash Jump'})
