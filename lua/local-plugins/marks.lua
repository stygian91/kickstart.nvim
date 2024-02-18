local Marks = {
  marks = {
    { key = 'Q', active = false, },
    { key = 'W', active = false, },
    { key = 'E', active = false, },
    { key = 'R', active = false, },
    { key = 'T', active = false, },
    { key = 'A', active = false, },
    { key = 'S', active = false, },
    { key = 'D', active = false, },
    { key = 'F', active = false, },
    { key = 'G', active = false, },
  },
}

function Marks.add(num)
  local current_buf = vim.api.nvim_get_current_buf()
  local cur_pos = vim.fn.getcurpos()
  local cur_mark = Marks.marks[num];

  vim.api.nvim_buf_set_mark(current_buf, cur_mark.key, cur_pos[2], cur_pos[3], {})
  cur_mark.active = true
end

function Marks.remove(num)
  local cur_mark = Marks.marks[num];

  vim.api.nvim_del_mark(cur_mark.key)
  cur_mark.active = false
end

function Marks.go(num)
  local cur_mark = Marks.marks[num];
  local vim_mark = vim.api.nvim_get_mark(cur_mark.key, {})
  
  if vim_mark == false then
    return
  end
  
  vim.api.nvim_set_current_buf(vim_mark[3])
  vim.fn.setpos('.', {vim_mark[3], vim_mark[1], vim_mark[2], 0})
end

function Marks.get_first_empty()
  for idx, mark in pairs(Marks.marks) do
    if mark.active == false then
      return idx
    end
  end

  return false
end

return Marks
