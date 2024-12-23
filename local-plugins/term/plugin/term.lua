local set = vim.opt_local

vim.api.nvim_create_autocmd("TermOpen", {
  group = vim.api.nvim_create_augroup("custom-term-open", {}),
  callback = function()
    set.scrolloff = 0

    vim.bo.filetype = "terminal"
  end,
})

vim.keymap.set("t", "<c-[>", "<c-\\><c-n>")

vim.keymap.set("n", "<leader>tb", function()
  vim.cmd.new()
  vim.cmd.wincmd "J"
  vim.api.nvim_win_set_height(0, 12)
  vim.wo.winfixheight = true
  vim.cmd.term()
end, { desc = "Open Terminal at the bottom" })

vim.keymap.set("n", "<leader>tv", function()
  vim.cmd.new()
  vim.cmd.wincmd "L"
  vim.cmd.term()
end, { desc = "Open a terminal in a vertical split" })
