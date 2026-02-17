local M = {}

local function palette()
	local variant = vim.g.pastelhash_variant
	if variant ~= "light" and variant ~= "dark" then
		variant = vim.o.background == "light" and "light" or "dark"
	end

	if variant == "light" then
		return {
			bg_alt = "#EEEEFC",
			fg = "#3F3F53",
			add = "#79C779",
			change = "#FABD2F",
			delete = "#EE5E66",
			info = "#66AFEF",
			comment = "#7F879E",
		}
	end

	return {
		bg_alt = "#202025",
		fg = "#BDBDD9",
		add = "#79C779",
		change = "#FABD2F",
		delete = "#EE5E66",
		info = "#66AFEF",
		comment = "#7F879E",
	}
end

function M.apply()
	local c = palette()
	local set = vim.api.nvim_set_hl

	local groups = {
		GitSignsAdd = { fg = c.add },
		GitSignsChange = { fg = c.change },
		GitSignsDelete = { fg = c.delete },
		GitSignsTopdelete = { fg = c.delete },
		GitSignsChangedelete = { fg = c.change },
		GitSignsUntracked = { fg = c.info },

		GitSignsAddNr = { fg = c.add },
		GitSignsChangeNr = { fg = c.change },
		GitSignsDeleteNr = { fg = c.delete },
		GitSignsTopdeleteNr = { fg = c.delete },
		GitSignsChangedeleteNr = { fg = c.change },
		GitSignsUntrackedNr = { fg = c.info },

		GitSignsAddLn = { bg = c.bg_alt },
		GitSignsChangeLn = { bg = c.bg_alt },
		GitSignsDeleteLn = { bg = c.bg_alt },

		GitSignsAddInline = { bg = c.bg_alt, fg = c.add },
		GitSignsChangeInline = { bg = c.bg_alt, fg = c.change },
		GitSignsDeleteInline = { bg = c.bg_alt, fg = c.delete },

		GitSignsAddPreview = { bg = c.bg_alt, fg = c.add },
		GitSignsDeletePreview = { bg = c.bg_alt, fg = c.delete },

		GitSignsAddCul = { fg = c.add },
		GitSignsChangeCul = { fg = c.change },
		GitSignsDeleteCul = { fg = c.delete },

		GitSignsStagedAdd = { fg = c.add },
		GitSignsStagedChange = { fg = c.change },
		GitSignsStagedDelete = { fg = c.delete },
		GitSignsStagedTopdelete = { fg = c.delete },
		GitSignsStagedChangedelete = { fg = c.change },
		GitSignsStagedUntracked = { fg = c.info },

		GitSignsCurrentLineBlame = { fg = c.comment, italic = true },
		GitSignsCurrentLineBlameLn = { fg = c.comment, italic = true },
		GitSignsCurrentLineBlameNr = { fg = c.comment, italic = true },
		GitSignsCurrentLineBlameDelete = { fg = c.comment, italic = true },
	}

	for name, spec in pairs(groups) do
		set(0, name, spec)
	end
	set(0, "GitSignsSignColumn", { fg = c.fg, bg = "NONE" })
end

return M
