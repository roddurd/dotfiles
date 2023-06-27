-- import lualine plugin safely
local status, lualine = pcall(require, "lualine")
if not status then
  return
end

-- get lualine catppuccin theme
local lualine_catppuccin = require("lualine.themes.catppuccin")

-- new colors for theme
local new_colors = {
  blue = "#304090",
  green = "#2c7a3c",
  violet = "#7550b0",
}

-- change theme colors
lualine_catppuccin.normal.a.bg = new_colors.blue
lualine_catppuccin.insert.a.bg = new_colors.green
lualine_catppuccin.visual.a.bg = new_colors.violet

-- configure lualine with modified theme
lualine.setup({
  options = {
    theme = lualine_catppuccin,
  },
})
