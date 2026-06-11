return {
  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      ui = {
        border = "rounded",
      },
      definition = {
        width = 0.7,
        height = 0.6,
      },
      symbol_in_winbar = {
        enable = false,
      },
      lightbulb = {
        enable = false,
      },
    },
    keys = {
      {
        "gp",
        "<cmd>Lspsaga peek_definition<CR>",
        desc = "Peek Definition",
      },
      {
        "gP",
        "<cmd>Lspsaga peek_type_definition<CR>",
        desc = "Peek Type Definition",
      },
      {
        "K",
        "<cmd>Lspsaga hover_doc<CR>",
        desc = "Hover Doc",
      },
    },
  },
}
