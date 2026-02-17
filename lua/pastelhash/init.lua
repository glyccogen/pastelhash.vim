local M = {}

local defaults = {
	variant = nil,
	deprecated_as_warn = false,
	highlight_immutable = false,
	highlight_keywords = false,
}

local function apply(opts)
	opts = vim.tbl_extend('force', defaults, opts or {})
	vim.g.pastelhash_variant = opts.variant
	vim.g.pastelhash_deprecated_as_warn = opts.deprecated_as_warn and 1 or 0
	vim.g.pastelhash_highlight_immutable = opts.highlight_immutable and 1 or 0
	vim.g.pastelhash_highlight_keywords = opts.highlight_keywords and 1 or 0
	if vim.g.colors_name == 'pastelhash' then
		vim.cmd('colorscheme pastelhash')
	end
end

function M.setup(opts)
	apply(opts)
end

return M
