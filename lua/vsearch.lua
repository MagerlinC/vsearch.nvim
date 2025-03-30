local M = {}

---@class Options
---@field keymap string
---@param opts Options
M.setup = function(opts)
	vim.keymap.set(
		"v",
		opts.keymap,
		"<cmd>lua require('vsearch').search_for_selected_text()<cr>",
		{ noremap = true, silent = true }
	)
end

local function get_visual_text_selection()
	local _, start_line, start_col, _ = unpack(vim.fn.getpos("v"))
	local _, end_line, end_col, _ = unpack(vim.fn.getpos("."))
	local lines = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)
	local text = table.concat(lines, "\n")

	if start_line == end_line then
		text = vim.fn.strpart(text, start_col - 1, end_col - start_col)
	else
		text = vim.fn.strpart(text, start_col - 1)
	end

	return text
end

M.search_for_selected_text = function()
	local text = get_visual_text_selection()
	if text == "" then
		return
	end
	require("telescope.builtin").grep_string({ search = text })
end

return M
