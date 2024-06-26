local exports = {
  -- Git related plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- Useful plugin to show you pending keybinds.
  { 'folke/which-key.nvim',  opts = {}, event = "VeryLazy" },
  

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {}, event = "VeryLazy" },

  -- change surrounding things like quotes, tags etc
  'tpope/vim-surround',

}

return exports
