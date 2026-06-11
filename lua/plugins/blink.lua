return {
  "saghen/blink.cmp",
  opts = {
    completion = {
      trigger = {
        show_in_snippet = false,
      },
    },

    keymap = {
      preset = "super-tab",
      ["<CR>"] = { "select_and_accept", "fallback" },
    },
  },
}
