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
    "VincentSidot/vim-skill",
    lazy = true,
    -- load only when a file with a supported extension is opened
    autocmd = {
      ft_ext = { "il", "ils" }
    }
  },
}
