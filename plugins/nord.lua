return {
  {
    "gbprod/nord.nvim",
    config = function()
      vim.o.termguicolors = true
      require("nord").setup({
        -- add alpha-nvim highlight color --
        on_highlights = function(highlights, colors)
          highlights["AlphaHeader"] = {
            fg = colors["frost"]["polar_water"],
          }
          highlights["AlphaFooter"] = {
            fg = colors["frost"]["ice"],
          }
          highlights["AlphaShortcut"] = {
            fg = colors["frost"]["artic_water"],
          }
          highlights["AlphaButtons"] = {
            fg = colors["frost"]["artic_ocean"],
          }
        end,
      })
    end,
  },
}
