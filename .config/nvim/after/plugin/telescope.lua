local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

require('telescope').setup{
  defaults = {
    mappings = {
      n = {
        ["lkj"] = actions.close,
      },
    },
  },
  pickers = {
      find_files = {
          hidden = true
      },
      git_files = {
          hidden = true
      }
  }
}


vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>g', function()
	builtin.grep_string({ search = vim.fn.input("grep > ") })
end)
vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})

