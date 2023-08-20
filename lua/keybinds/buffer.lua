local nmap = require('utils.keybind').nmap
local list_buffs = require('utils.buffer').list_valid_bufs

--------------------------------------------------
-- Buffer
--------------------------------------------------

nmap('<leader>c', function() vim.api.nvim_buf_delete(0, {}) end, { desc = 'Close current buffer' })
nmap('<leader>C', function() vim.api.nvim_buf_delete(0, { force = true }) end, { desc = 'Close current buffer' })
nmap('<leader>bc', ':bufdo bd<cr>', { desc = 'Close All Buffers' })
nmap('<leader>bn', ':enew<cr>', { desc = 'Create an Empty Buffer' })
nmap(']b', '<cmd>bn<cr>', { desc = 'Next buffer' })
nmap('[b', '<cmd>bp<cr>', { desc = 'Previous buffer' })

for i = 1, 5, 1 do
  nmap('<leader>' .. i, function()
    local buffs = list_buffs()
    if buffs[i] then
      vim.api.nvim_set_current_buf(buffs[i])
    end
  end, { desc = 'which_key_ignore' });
end
