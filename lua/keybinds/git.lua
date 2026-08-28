local nmap = require('utils.keybind').nmap

-- vim.keymap.set('n', '<leader>gl', require('gitsigns').preview_hunk, { buffer = bufnr, desc = '[P]review [H]unk' })
nmap('[g', require('gitsigns').prev_hunk, { buffer = bufnr, desc = 'Previous Hunk' })
nmap(']g', require('gitsigns').next_hunk, { buffer = bufnr, desc = 'Next Hunk' })
nmap('<leader>gd', '<cmd>Gitsigns diffthis<cr>', { desc = 'Diff' });
nmap('<leader>gl', '<cmd>Gitsigns blame_line<cr>', { desc = 'Blame line' });
