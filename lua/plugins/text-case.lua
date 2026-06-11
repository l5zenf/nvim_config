return {
  "johmsalas/text-case.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  cmd = {
    "Subs",
    "TextCaseOpenTelescope",
    "TextCaseOpenTelescopeQuickChange",
    "TextCaseOpenTelescopeLSPChange",
    "TextCaseStartReplacingCommand",
  },
  config = function()
    require("textcase").setup({})
  end,
}
