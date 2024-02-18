local Marks = {}

function Marks.add(key)
  local cur_buf = vim.api.nvim_get_current_buf()
  local cur_pos = vim.fn.getcurpos()

  vim.fn.setpos("'" .. key, { cur_buf, cur_pos[2], cur_pos[3], 0 })
end

function Marks.go(key, first)
  local mark = vim.api.nvim_get_mark(key, {})
  local col = 0

  if mark[3] == 0 then
    print('No mark set for ' .. key)
    return
  end

  vim.api.nvim_set_current_buf(mark[3])

  if first then
    local line = vim.api.nvim_buf_get_lines(mark[3], mark[1], mark[1] + 1, false)[0]
    col = vim.fn.match(line, '\\S') + 1
  else
    col = mark[2] + 1
  end

  vim.fn.setpos('.', { mark[3], mark[1], col, 0 })
end

return Marks
