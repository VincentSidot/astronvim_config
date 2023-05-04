-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(function(bufnr)
          require("astronvim.utils.buffer").close(
            bufnr)
        end)
      end,
      desc = "Pick to close",
    },
    ["<leader>mc"] = { "<cmd>lua MiniMap.close()<cr>", desc = "Close MiniMap" },
    ["<leader>mo"] = { "<cmd>lua MiniMap.open()<cr>", desc = "Open MiniMap" },
    ["<leader>mf"] = { "<cmd>lua MiniMap.toggle_focus()<cr>", desc = "Toggle focus of MiniMap" },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    ["<leader>b<Left>"] = { "<cmd>bprevious<cr>", desc = "Go to previous buffer" },
    ["<leader>b<Right>"] = { "<cmd>bnext<cr>", desc = "Go to next buffer" },
    ["<leader>bk"] = { "<cmd>Bdelete<cr>", desc = "Kill current buffer" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
