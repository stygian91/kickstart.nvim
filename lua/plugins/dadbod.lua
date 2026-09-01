return {
  'kristijanhusak/vim-dadbod-ui',
  dependencies = {
    { 'tpope/vim-dadbod', lazy = true },
    { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
    { 'pbogut/vim-dadbod-ssh' },
  },
  cmd = {
    'DBUI',
    'DBUIToggle',
    'DBUIAddConnection',
    'DBUIFindBuffer',
  },
  init = function()
    vim.g.db_ui_use_nerd_fonts = 1

    local CONNECTION_NAME = 'localhost'
    local group = vim.api.nvim_create_augroup('dadbod_layout', { clear = true })

    local function find_dbui_win()
      for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
        local buf = vim.api.nvim_win_get_buf(win)
        if vim.bo[buf].filetype == 'dbui' then
          return win
        end
      end
    end

    local function is_right_vsplit(win)
      local pos = vim.api.nvim_win_get_position(win)
      local width = vim.api.nvim_win_get_width(win)
      local height = vim.api.nvim_win_get_height(win)
      return (pos[2] + width) >= (vim.o.columns - 2) and height > (vim.o.lines * 0.5)
    end

    local function move_dbout_to_vsplit(win)
      win = win or vim.api.nvim_get_current_win()
      if not vim.api.nvim_win_is_valid(win) then
        return
      end

      local buf = vim.api.nvim_win_get_buf(win)
      if vim.bo[buf].filetype ~= 'dbout' then
        return
      end

      if is_right_vsplit(win) then
        return
      end

      local width = vim.api.nvim_win_get_width(win)
      local height = vim.api.nvim_win_get_height(win)
      local is_bottom_split = width > (vim.o.columns * 0.6) and height < (vim.o.lines * 0.55)
      if not (vim.wo[win].previewwindow or is_bottom_split) then
        return
      end

      local current = vim.api.nvim_get_current_win()
      vim.api.nvim_set_current_win(win)
      vim.cmd.wincmd('L')
      if vim.api.nvim_win_is_valid(current) and current ~= win then
        vim.api.nvim_set_current_win(current)
      end
    end

    local function latest_dbout_path()
      local drawer = vim.fn['db_ui#drawer#get']()
      local dbout_list = drawer.dbui and drawer.dbui.dbout_list
      if type(dbout_list) ~= 'table' or vim.tbl_isempty(dbout_list) then
        return nil
      end

      local latest_path
      local latest_num = -1
      for path in pairs(dbout_list) do
        local num = tonumber(vim.fn.fnamemodify(path, ':t:r')) or 0
        if num >= latest_num then
          latest_num = num
          latest_path = path
        end
      end
      return latest_path
    end

    local function show_dbout_in_vsplit()
      for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
        local buf = vim.api.nvim_win_get_buf(win)
        if vim.bo[buf].filetype == 'dbout' then
          move_dbout_to_vsplit(win)
          return
        end
      end

      local latest = latest_dbout_path()
      if not latest or vim.fn.filereadable(latest) == 0 or vim.fn.bufwinnr(latest) ~= -1 then
        return
      end

      vim.cmd.vsplit(vim.fn.fnameescape(latest))
      vim.cmd.wincmd('L')
    end

    local function connect_localhost()
      local dbui_win = find_dbui_win()
      if not dbui_win then
        return
      end

      local current = vim.api.nvim_get_current_win()
      vim.api.nvim_set_current_win(dbui_win)
      vim.fn.cursor(1, 1)

      if vim.fn.search('\\V' .. CONNECTION_NAME, 'W') == 0 then
        vim.notify('DBUI: no saved connection named ' .. CONNECTION_NAME, vim.log.levels.WARN)
        vim.api.nvim_set_current_win(current)
        return
      end

      local collapsed = vim.g.db_ui_icons.collapsed.db
      local line = vim.api.nvim_get_current_line()
      if collapsed and line:find(collapsed, 1, true) then
        local keys = vim.api.nvim_replace_termcodes('<Plug>(DBUI_SelectLine)', true, false, true)
        vim.api.nvim_feedkeys(keys, 'xt', false)
      end

      if vim.api.nvim_win_is_valid(current) then
        vim.api.nvim_set_current_win(current)
      end
    end

    vim.api.nvim_create_autocmd('User', {
      group = group,
      pattern = 'DBUIOpened',
      callback = function()
        vim.schedule(function()
          connect_localhost()
          show_dbout_in_vsplit()
        end)
      end,
    })

    vim.api.nvim_create_autocmd('BufWinEnter', {
      group = group,
      pattern = '*.dbout',
      callback = function()
        local win = vim.api.nvim_get_current_win()
        vim.schedule(function()
          move_dbout_to_vsplit(win)
        end)
      end,
    })
  end,
}
