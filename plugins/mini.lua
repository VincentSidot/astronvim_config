return {
  {
    "echasnovski/mini.map",
    version = false,
    lazy = false,
    config = function()
      local mini = require("mini.map")
      mini.setup(
        {
          symbols = {
            encode = mini.gen_encode_symbols.dot("4x2"),
          }
        }
      )
    end,
  },
}
