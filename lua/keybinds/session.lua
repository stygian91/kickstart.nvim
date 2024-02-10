local nmap = require('utils.keybind').nmap

local function get_sessions_dir()
  local data_path = vim.fn.stdpath('data')
  return vim.fn.resolve(data_path .. '/styg-sessions/')
end

local function get_cwd_session_name()
  local cwd = vim.fn.getcwd()
  local checksum_slice = string.sub(vim.fn.sha256(cwd), 1, 16)
  local basename = vim.fs.basename(cwd)

  return basename .. '-' .. checksum_slice .. '.vim'
end

local function get_session_path()
  local session_dir = get_sessions_dir()
  local session_name = get_cwd_session_name()
  return vim.fn.resolve(session_dir .. '/' .. session_name)
end

local function write_session()
  local session_dir = get_sessions_dir()
  local session_path = get_session_path()

  if vim.fn.isdirectory(session_dir) == 0 then
    vim.fn.mkdir(session_dir, 'p')
  end

  vim.cmd('mks! ' .. session_path)
  print("Session saved at: " .. session_path)
end

local function read_session()
  local session_path = get_session_path()

  if vim.fn.filereadable(session_path) == 0 then
    print('Session file "' .. session_path .. '" does not exist or not readable.')
    return
  end

  vim.cmd('so ' .. session_path)
  print('Session loaded from: ' .. session_path)
end

local function delete_session()
  local session_path = get_session_path()
  local readable = vim.fn.filereadable(session_path)

  if readable == 0 then
    print('Session file "' .. session_path .. '" does not exist.')
    return
  end

  vim.fn.delete(session_path)
  print('Session file "' .. session_path .. '" deleted.')
end

nmap('<leader>ow', write_session, { desc = 'Write cwd session' })
nmap('<leader>or', read_session, { desc = 'Read cwd session' })
nmap('<leader>od', delete_session, { desc = 'Delete cwd session' })
