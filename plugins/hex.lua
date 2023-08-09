return {
  {
    'RaafatTurki/hex.nvim',
    ft = {
      'hex',
    },
    lazy = false,
    config = function()
      require('hex').setup()
    end,
  }
}
