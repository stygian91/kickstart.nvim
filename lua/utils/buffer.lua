return {
	list_valid_bufs = function()
		local all_buffs = vim.api.nvim_list_bufs()
		local buffs = {}

		for _, bufnr in ipairs(all_buffs) do
			local is_listed = vim.bo[bufnr].buflisted
			local is_valid = vim.api.nvim_buf_is_valid(bufnr)
			if is_listed and is_valid and bufnr > 0 then
				table.insert(buffs, bufnr)
			end
		end

		return buffs
	end,
}
