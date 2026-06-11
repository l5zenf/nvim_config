return {
  "chrisgrieser/nvim-spider",
  lazy = true,
  keys = {
    { "gw", "<cmd>lua require('spider').motion('w')<CR>", desc = "Spider-w" },
    { "gE", "<cmd>lua require('spider').motion('e')<CR>", desc = "Spider-e" },
    { "gb", "<cmd>lua require('spider').motion('b')<CR>", desc = "Spider-b" },
    { "gB", "<cmd>lua require('spider').motion('ge')<CR>", desc = "Spider-ge" },
  },
}
