local nmap = require('utils.keybind').nmap
local dap = require('dap')
local dapui = require('dapui')

nmap('<F3>', function ()
  dap.toggle_breakpoint()
end, { desc = "Toggle breakpoint" })

nmap('<F5>', function ()
  dap.continue()
  dapui.open()
end, { desc = "Start/Continue Debugging" })

nmap('<F6>', function ()
  dap.stop()
  dapui.close()
end, { desc = "Start/Continue Debugging" })

nmap('<F8>', function ()
  dap.step_over()
end, { desc = "Step Over" })

nmap('<F9>', function ()
  dap.step_into()
end, { desc = "Step Into" })
