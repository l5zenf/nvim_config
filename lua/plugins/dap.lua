-- DAP + Python venv integration
local function cleanup_debugpy_artifacts()
  for _, f in ipairs(vim.fn.glob("__DEBUG__", false, true)) do
    vim.fn.delete(f)
  end
end

return {
  {
    "mfussenegger/nvim-dap",
    optional = true,
    init = function()
      vim.api.nvim_create_autocmd("User", {
        pattern = "LazyLoad",
        group = vim.api.nvim_create_augroup("dap_cleanup", { clear = true }),
        callback = function(args)
          if args.data ~= "nvim-dap" then
            return
          end

          local ok, dap = pcall(require, "dap")
          if not ok then
            return
          end

          dap.listeners.after.event_terminated["cleanup_debugpy_artifacts"] = cleanup_debugpy_artifacts
          dap.listeners.after.event_exited["cleanup_debugpy_artifacts"] = cleanup_debugpy_artifacts
        end,
      })
    end,
  },

  {
    "mfussenegger/nvim-dap-python",
    optional = true,
    config = function()
      local dap_python = require("dap-python")

      -- Auto-detect uv / venv python path
      local function find_python()
        local uv_python = vim.fn.getcwd() .. "/.venv/bin/python"
        if vim.fn.filereadable(uv_python) == 1 then
          return uv_python
        end
        return "debugpy-adapter"
      end

      dap_python.setup(find_python())
    end,
  },

  {
    "linux-cultist/venv-selector.nvim",
    optional = true,
    opts = {
      -- Use telescope as picker (no fzf dependency)
      name = "telescope",
      settings = {
        search = {
          -- uv project-local .venv
          venvs = {
            find_python = function(path)
              return require("venv-selector.utils").find_python_in(path .. "/.venv")
            end,
          },
        },
      },
      options = {
        notify_user_on_venv_activation = true,
      },
    },
    -- After venv changes, re-setup dap-python with the new python
    config = function(_, opts)
      require("venv-selector").setup(opts)

      -- Hook: when venv changes, update dap-python
      local group = vim.api.nvim_create_augroup("venv_dap_sync", { clear = true })
      vim.api.nvim_create_autocmd("User", {
        pattern = "VenvSelectorActivated",
        group = group,
        callback = function()
          local venv_path = require("venv-selector").get_active_venv()
          if venv_path then
            local python = venv_path .. "/bin/python"
            if vim.fn.filereadable(python) == 1 then
              require("dap-python").setup(python)
            end
          end
        end,
      })
    end,
  },
}
