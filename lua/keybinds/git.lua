local nmap = require('utils.keybind').nmap

nmap('<leader>gd', '<cmd>Gitsigns diffthis<cr>', { desc = 'Diff' });
nmap('<leader>gl', '<cmd>Gitsigns blame_line<cr>', { desc = 'Blame line' });
