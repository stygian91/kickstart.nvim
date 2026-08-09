return {
  -- Server definitions from nvim-lspconfig; configuration via native vim.lsp API (Nvim 0.11+)
  'neovim/nvim-lspconfig',
  dependencies = {
    { 'mason-org/mason.nvim', config = true },
    'mason-org/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',

    -- Useful status updates for LSP
    {
      'j-hui/fidget.nvim',
      tag = 'legacy',
      opts = {},
    },
  },

  config = function()
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
      callback = function(event)
        require('keybinds.lsp')(event.buf)

        vim.api.nvim_buf_create_user_command(event.buf, 'Format', function(_)
          vim.lsp.buf.format()
        end, { desc = 'Format current buffer with LSP' })
      end,
    })

    vim.diagnostic.config {
      severity_sort = true,
      float = { border = 'rounded', source = 'if_many' },
      underline = { severity = vim.diagnostic.severity.ERROR },
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = '󰅚 ',
          [vim.diagnostic.severity.WARN] = '󰀪 ',
          [vim.diagnostic.severity.INFO] = '󰋽 ',
          [vim.diagnostic.severity.HINT] = '󰌶 ',
        },
      },
      virtual_text = {
        source = 'if_many',
        spacing = 2,
        format = function(diagnostic)
          local diagnostic_message = {
            [vim.diagnostic.severity.ERROR] = diagnostic.message,
            [vim.diagnostic.severity.WARN] = diagnostic.message,
            [vim.diagnostic.severity.INFO] = diagnostic.message,
            [vim.diagnostic.severity.HINT] = diagnostic.message,
          }
          return diagnostic_message[diagnostic.severity]
        end,
      },
    }

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

    vim.lsp.config('*', {
      capabilities = capabilities,
    })

    vim.lsp.config('gopls', {})
    vim.lsp.config('ts_ls', {})
    vim.lsp.config('html', { filetypes = { 'html', 'twig', 'hbs' } })
    vim.lsp.config('intelephense', {
      settings = {
        intelephense = {
          files = {
            maxSize = 5000000,
          },
        },
      },
    })
    vim.lsp.config('sqlls', {})
    vim.lsp.config('vuels', {})
    vim.lsp.config('jsonls', {})
    vim.lsp.config('yamlls', { filetypes = { 'yaml' } })
    vim.lsp.config('lua_ls', {
      settings = {
        Lua = {
          completion = {
            callSnippet = 'Replace',
          },
        },
      },
    })

    local servers = {
      'gopls',
      'ts_ls',
      'html',
      'intelephense',
      'sqlls',
      'vuels',
      'jsonls',
      'yamlls',
      'lua_ls',
    }

    vim.lsp.enable(servers)

    local ensure_installed = vim.list_extend(vim.deepcopy(servers), {
      'stylua',
    })
    require('mason-tool-installer').setup { ensure_installed = ensure_installed }
    require('mason-lspconfig').setup {
      automatic_enable = false,
    }
  end,
}
