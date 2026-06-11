return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "frappe",
      transparent_background = false,
      integrations = {
        flash = true,
        gitsigns = true,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
        which_key = true,
        noice = true,
        notify = true,
        snacks = true,
        mini = true,
        mason = true,
        lsp_trouble = true,
        aerial = true,
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-frappe",
    },
  },
}
