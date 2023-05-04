return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- }
  {
    "gbprod/nord.nvim",
    config = function()
      vim.o.termguicolors = true
      require("nord").setup()
    end,
  },
}
