local nmap = require('utils.keybind').nmap
local marks = require('local-plugins.marks')
local letters = {
  'q', 'w', 'e', 'r', 't', 'y', 'u', 'i', 'o', 'p',
  'a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l',
  'z', 'x', 'c', 'v', 'b', 'n', 'm',
}

for _, letter in pairs(letters) do
  local upper = string.upper(letter)
  nmap('m' .. letter, function()
    print('Added mark to ' .. upper)
    marks.add(upper)
  end, { desc = 'Add mark to ' .. upper })

  nmap('\'' .. letter, function()
    marks.go(upper)
  end, { desc = 'Go to mark ' .. upper })

  nmap('`' .. letter, function()
    marks.go(upper, true)
  end, { desc = 'Go to mark ' .. upper })
end
