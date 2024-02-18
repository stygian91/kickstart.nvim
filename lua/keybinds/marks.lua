local nmap = require('utils.keybind').nmap
local marks = require('local-plugins.marks')

nmap('<leader>m', function ()
  local first_empty = marks.get_first_empty()
  if first_empty == false then
    print("No empty slots")
    return
  end

  marks.add(first_empty)
end, { desc = 'Add mark' })

