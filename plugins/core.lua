return {
  -- customize alpha options
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      math.randomseed(os.time())


      -- customize the dashboard header --
      opts.section.header.val = require('user.utils.headers').random
      -- add custom buttons --
      opts.section.buttons.val = {
        opts.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
        opts.button("n", " " .. " New file", ":ene <BAR> startinsert <CR>"),
        opts.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
        opts.button("g", " " .. " Find text", ":Telescope live_grep <CR>"),
        opts.button("c", " " .. " Config", ":e $MYVIMRC <CR>"),
        opts.button("s", " " .. " Restore Session", [[:lua require("persistence").load() <cr>]]),
        opts.button("l", "󰒲 " .. " Lazy", ":Lazy<CR>"),
        opts.button("m", " " .. " Mason", ":Mason<CR>"),
        opts.button("q", " " .. " Quit", ":qa<CR>"),
      }

      for _, button in ipairs(opts.section.buttons.val) do
        button.opts.hl = "AlphaButtons"
        button.opts.hl_shortcut = "AlphaShortcut"
      end
      opts.section.header.opts.hl = "AlphaHeader"
      opts.section.buttons.opts.hl = "AlphaButtons"
      opts.section.footer.opts.hl = "AlphaFooter"
      opts.opts.layout[1].val = 8

      return opts
    end,
    config = function(_, opts)
      if vim.o.filetype == "lazy" then
        vim.cmd.close()
        vim.api.nvim_create_autocmd("User", {
          pattern = "AlphaReady",
          callback = function()
            require("lazy").show()
          end,
        })
      end

      require("alpha").setup(opts.opts)

      function footer()
        local stats = require('lazy').stats()
        local v = vim.version()
        local datetime = os.date " %d-%m-%Y   %H:%M:%S"
        return string.format(" %s plugins loaded in %s ms\n v%s.%s.%s  %s", stats.count,
          math.floor(stats.startuptime * 100 + 0.5) / 100, v.major, v.minor, v.patch, datetime)
      end

      vim.api.nvim_create_autocmd("User", {
        pattern = "LazyVimStarted",
        callback = function()
          opts.section.footer.val = footer()
          pcall(vim.cmd.AlphaRedraw)
        end,
      })
    end,
  },
  {
    "folke/drop.nvim",
    event = "VimEnter",
    config = function()
      require("drop").setup({
        theme = "snow",
        interval = 75,
        max = 40,
        screensaver = 1000 * 60 * 2,
        filetype = { "dashboard", "alpha", "starter" },
      })
    end,
  }
  -- You can disable default plugins as follows:
  -- { "max397574/better-escape.nvim", enabled = false },
  --
  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  -- {
  --   "L3MON4D3/LuaSnip",
  --   config = function(plugin, opts)
  --     require "plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
  --     -- add more custom luasnip configuration such as filetype extend or custom snippets
  --     local luasnip = require "luasnip"
  --     luasnip.filetype_extend("javascript", { "javascriptreact" })
  --   end,
  -- },
  -- {
  --   "windwp/nvim-autopairs",
  --   config = function(plugin, opts)
  --     require "plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
  --     -- add more custom autopairs configuration such as custom rules
  --     local npairs = require "nvim-autopairs"
  --     local Rule = require "nvim-autopairs.rule"
  --     local cond = require "nvim-autopairs.conds"
  --     npairs.add_rules(
  --       {
  --         Rule("$", "$", { "tex", "latex" })
  --           -- don't add a pair if the next character is %
  --           :with_pair(cond.not_after_regex "%%")
  --           -- don't add a pair if  the previous character is xxx
  --           :with_pair(
  --             cond.not_before_regex("xxx", 3)
  --           )
  --           -- don't move right when repeat character
  --           :with_move(cond.none())
  --           -- don't delete if the next character is xx
  --           :with_del(cond.not_after_regex "xx")
  --           -- disable adding a newline when you press <cr>
  --           :with_cr(cond.none()),
  --       },
  --       -- disable for .vim files, but it work for another filetypes
  --       Rule("a", "a", "-vim")
  --     )
  --   end,
  -- },
  -- By adding to the which-key config and using our helper function you can add more which-key registered bindings
  -- {
  --   "folke/which-key.nvim",
  --   config = function(plugin, opts)
  --     require "plugins.configs.which-key"(plugin, opts) -- include the default astronvim config that calls the setup call
  --     -- Add bindings which show up as group name
  --     local wk = require "which-key"
  --     wk.register({
  --       b = { name = "Buffer" },
  --     }, { mode = "n", prefix = "<leader>" })
  --   end,
  -- },
}
