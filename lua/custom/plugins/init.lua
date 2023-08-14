-- local function req(name)
--   return require('custom.plugins.'..name)
-- end
--
-- local names = {
--   'telescope',
--   'treesitter',
-- }

local exports = {
  -- NOTE: First, some plugins that don't require any configuration

  -- Git related plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- Useful plugin to show you pending keybinds.
  { 'folke/which-key.nvim', opts = {} },

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },
}

-- for _, name in pairs(names) do
--   exports[#exports+1] = req(name)
-- end

return exports

