return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',

  dependencies = {
    'nvim-lua/plenary.nvim',
    -- Fuzzy Finder Algorithm which requires local dependencies to be built.
    -- Only load if `make` is available. Make sure you have the system
    -- requirements installed.
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      -- NOTE: If you are having trouble with this installation,
      --       refer to the README for telescope-fzf-native for more instructions.
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
  },

  config = function()
    local telescope = require('telescope')
    telescope.setup {
      defaults = {
        mappings = {
          i = {
            ['<C-u>'] = false,
            ['<C-d>'] = false,
          },
        },
      },

      extensions = {
        file_browser = {
          hijack_netrw = true,
          select_buffer = true,
          grouped = true,
          hidden = true,
          initial_mode = 'normal',
          mappings = {
            n = {
              h = function(bufnr)
                telescope.extensions.file_browser.actions.toggle_respect_gitignore(bufnr)
              end,
            },
          },
        },
      },
    }

    -- Enable telescope fzf native, if installed
    pcall(telescope.load_extension, 'fzf')

    telescope.load_extension('file_browser')
    telescope.load_extension('neoclip')
  end,
}
