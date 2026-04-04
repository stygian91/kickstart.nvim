-- Fuzzy Finder (files, lsp, etc)
return {
  -- Highlight, edit, and navigate code
  'nvim-treesitter/nvim-treesitter',
  dependencies = { },
  build = ':TSUpdate',
  config = function ()
    require('nvim-treesitter').install({
        'go',
        'lua',
        'rust',
        'vimdoc',
        'vim',
        'vue',
        'javascript',
        'typescript',
        'tsx',
        'html',
        'twig',
        'php',
        'yaml',
        'json',
        'blade',
    })
  end,
}
