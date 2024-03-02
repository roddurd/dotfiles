local actions = require("telescope.actions")
local builtin = require("telescope.builtin")

require("telescope").setup({
	defaults = {
		mappings = {
			n = {
				["lkj"] = actions.close,
			},
			i = {
				["<C-k>"] = actions.move_selection_previous,
				["<C-j>"] = actions.move_selection_next,
			},
		},
		file_ignore_patterns = {
			".git",
		},
	},
	-- show hidden files
	pickers = {
		find_files = {
			hidden = true,
		},
	},
})

-- keyboard shortcuts
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.git_files, {})
vim.keymap.set("n", "<leader>fs", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fc", builtin.grep_string, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
