return {
  {
    "folke/snacks.nvim",
    opts = {
      -- === 功能模块 ===
      words = { enabled = true },
      image = { enabled = true },
      scratch = { enabled = true },
      picker = {
        sources = {
          explorer = {
            hidden = true,
            ignored = true,
          },
        },
      },
      indent = {
        enabled = true,
        indent = {
          char = "│",
          only_scope = false,
          only_current = false,
        },
        scope = {
          enabled = true,
          char = "│",
          underline = false,
        },
        animate = {
          enabled = true,
          style = "out",
          duration = 200,
        },
      },
      dim = {
        enabled = true,
        scope = {
          min_size = 5,
          max_size = 40,
        },
        animate = {
          enabled = true,
          easing = "outQuad",
          duration = 200,
        },
      },
      zen = {
        enabled = true,
        toggles = {
          dim = true,
          git_signs = false,
          mini_diff_signs = false,
          diagnostics = false,
          inlay_hints = false,
        },
        show = {
          statusline = false,
          tabline = false,
        },
      },
      statuscolumn = {
        enabled = true,
        left = { "mark", "sign" },
        right = { "fold", "git" },
        folds = {
          open = false,
          git_hl = false,
        },
      },
    },
    keys = {
      -- Zen mode
      {
        "<leader>uz",
        function()
          Snacks.zen()
        end,
        desc = "Toggle Zen Mode",
      },
      {
        "<leader>uZ",
        function()
          Snacks.zen.zoom()
        end,
        desc = "Toggle Zoom",
      },

      -- Dim
      {
        "<leader>uD",
        function()
          Snacks.dim()
        end,
        desc = "Toggle Dim",
      },

      -- Git browse (open file on GitHub/GitLab)
      {
        "<leader>go",
        function()
          Snacks.gitbrowse()
        end,
        desc = "Open in Browser",
      },
      {
        "<leader>gO",
        function()
          Snacks.gitbrowse({ what = "permalink" })
        end,
        desc = "Open Permalink",
      },
      {
        "<leader>gB",
        function()
          Snacks.gitbrowse({ what = "branch" })
        end,
        desc = "Open Branch",
      },

      -- Buffer delete (smart, preserves layout)
      {
        "<leader>bd",
        function()
          Snacks.bufdelete()
        end,
        desc = "Delete Buffer",
      },
      {
        "<leader>bD",
        function()
          Snacks.bufdelete({ force = true })
        end,
        desc = "Delete Buffer (Force)",
      },
      {
        "<leader>bo",
        function()
          Snacks.bufdelete.other()
        end,
        desc = "Delete Other Buffers",
      },
      {
        "<leader>ba",
        function()
          Snacks.bufdelete.all()
        end,
        desc = "Delete All Buffers",
      },

      -- GitHub CLI
      {
        "<leader>gI",
        function()
          Snacks.gh.issue()
        end,
        desc = "GitHub Issues (gh)",
      },
      {
        "<leader>gP",
        function()
          Snacks.gh.pr()
        end,
        desc = "GitHub PRs (gh)",
      },

      -- Rename file with LSP
      {
        "<leader>cR",
        function()
          Snacks.rename.rename_file()
        end,
        desc = "Rename File (LSP)",
      },
    },
  },
}
