return {
  {
    "jake-stewart/multicursor.nvim",
    branch = "1.0",
    event = "VeryLazy",
    config = function()
      local mc = require("multicursor-nvim")
      mc.setup()

      local set = vim.keymap.set

      -- Add cursors with mouse
      set("n", "<C-leftmouse>", mc.handleMouse)
      set("n", "<C-leftdrag>", mc.handleMouseDrag)

      -- Add/skip cursor above/below
      set("n", "<leader>mk", function() mc.lineAddCursor(-1) end, { desc = "Add Cursor Above" })
      set("n", "<leader>mj", function() mc.lineAddCursor(1) end, { desc = "Add Cursor Below" })
      set("n", "<leader>mK", function() mc.lineSkipCursor(-1) end, { desc = "Skip Cursor Above" })
      set("n", "<leader>mJ", function() mc.lineSkipCursor(1) end, { desc = "Skip Cursor Below" })

      -- Add all matches
      set("n", "<leader>ma", mc.matchAllAddCursors, { desc = "Add Cursors to Matches" })

      -- Rotate cursor
      set("n", "<leader>mn", mc.nextCursor, { desc = "Next Cursor" })
      set("n", "<leader>mp", mc.prevCursor, { desc = "Previous Cursor" })

      -- Delete cursor
      set("n", "<leader>mx", mc.deleteCursor, { desc = "Delete Cursor" })

      -- Align cursors
      set("n", "<leader>ml", mc.alignCursors, { desc = "Align Cursors" })
    end,
  },
}
