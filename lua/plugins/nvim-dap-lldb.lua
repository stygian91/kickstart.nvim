return {
  "julianolf/nvim-dap-lldb",
  dependencies = { "mfussenegger/nvim-dap" },
  opts = {
    -- codelldb_path = "/path/to/codelldb"
    configurations = {
      nim = {
        {
          name = "Launch Nim Debugger",
          type = "lldb",
          request = "launch",
          cwd = "${workspaceFolder}",
          program = function()
            local binary_name = vim.fn.input({ prompt = "Binary name: " })

            if #binary_name == 0 then
              vim.notify("No binary name given", vim.log.levels.ERROR)
              return nil
            end

            local out = vim.fn.system({"nimble", "build", "-d:nimDebugUtils", "--debugger:native", binary_name})

            if vim.v.shell_error ~= 0 then
              vim.notify(out, vim.log.levels.ERROR)
              return nil
            end

            return binary_name
          end,
        },
      },
    }
  },
}
