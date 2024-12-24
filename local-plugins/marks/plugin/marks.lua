local marks = require "marks"

local letters = {
  'q', 'w', 'e', 'r', 't', 'y', 'u', 'i', 'o', 'p',
  'a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l',
  'z', 'x', 'c', 'v', 'b', 'n', 'm',
}

for _, letter in pairs(letters) do
  local upper = string.upper(letter)
  vim.keymap.set('n', 'm' .. letter, function()
    marks.add(upper)
  end, { desc = 'Add mark to ' .. upper, noremap = true })

  vim.keymap.set('n', '\'' .. letter, function()
    marks.go(upper)
  end, { desc = 'Go to mark ' .. upper, noremap = true })

  vim.keymap.set('n', '`' .. letter, function()
    marks.go(upper, true)
  end, { desc = 'Go to mark ' .. upper, noremap = true })
end
