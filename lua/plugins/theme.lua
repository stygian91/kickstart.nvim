return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function ()
    -- vim.cmd.colorscheme "catppuccin-mocha"
    vim.cmd.colorscheme "catppuccin-latte"

    -- override colorscheme making comments italic
    vim.cmd.highlight('Comment gui=none')
    vim.cmd.highlight('Comment cterm=none')
  end
}
