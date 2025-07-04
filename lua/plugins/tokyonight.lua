return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000, -- load this before all the other plugins
  config = function()
    require("tokyonight").setup({
      style = "night", -- options: storm, moon, night, day
      transparent = true,
      terminal_colors = true,
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
        sidebars = "dark",
        floats = "dark",
      },
      sidebars = { "qf", "help", "terminal", "packer" },
      day_brightness = 0.3,
      hide_inactive_statusline = false,
      dim_inactive = false,
      lualine_bold = false,
    })

    -- Load the colorscheme
    vim.cmd([[colorscheme tokyonight]])
  end,
}
