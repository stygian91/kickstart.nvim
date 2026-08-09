--- Vetur language server (vls). Not bundled in nvim-lspconfig's lsp/ directory.
--- Mason package: vetur-vls

---@type vim.lsp.Config
return {
  cmd = { 'vls' },
  filetypes = { 'vue' },
  root_markers = { 'package.json', 'vue.config.js' },
  init_options = {
    config = {
      vetur = {
        useWorkspaceDependencies = false,
        validation = {
          template = true,
          style = true,
          script = true,
        },
        completion = {
          autoImport = false,
          useScaffoldSnippets = false,
          tagCasing = 'kebab',
        },
        format = {
          defaultFormatter = {
            js = 'none',
            ts = 'none',
          },
          defaultFormatterOptions = {},
          scriptInitialIndent = false,
          styleInitialIndent = false,
        },
      },
      css = {},
      html = {
        suggest = {},
      },
      javascript = {
        format = {},
      },
      typescript = {
        format = {},
      },
      emmet = {},
      stylusSupremacy = {},
    },
  },
}
