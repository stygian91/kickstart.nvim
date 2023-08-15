return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require('bufferline').setup({})
  end
}

