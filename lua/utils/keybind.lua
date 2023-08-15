local function map(mode, left, right, opts)
	return vim.keymap.set(mode, left, right, opts)
end

local function nmap(left, right, opts)
	return map('n', left, right, opts)
end

return {
	map = map,
	nmap = nmap,
}
