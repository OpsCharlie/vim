-- Docs at https://github.com/mfussenegger/nvim-dap-python are useful.
return {
  {
    "mfussenegger/nvim-dap",
    lazy = true,
    keys = {
      {
        "<leader>db",
        function() require("dap").toggle_breakpoint() end,
        desc = "Toggle Breakpoint"
      },
      {
        "<F7>",
        function() require("dap").step_into() end,
        desc = "Step Into"
      },
      {
        "<leader>dc",
        function() require("dap").continue() end,
        desc = "Continue"
      },
      {
        "<leader>dC",
        function() require("dap").run_to_cursor() end,
        desc = "Run to Cursor"
      },
      {
        "<leader>dT",
        function() require("dap").terminate() end,
        desc = "Terminate"
      },
    },
    config = function()
      vim.fn.sign_define("DapBreakpoint", {text = "⏺", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl="DapBreakpoint"})
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    config = true,
    keys = {
      {
        "<leader>du",
        function()
          require("dapui").toggle({})
        end,
        desc = "Dap UI"
      },
    },
    dependencies = {
      {
        "jay-babu/mason-nvim-dap.nvim",
        ---@type MasonNvimDapSettings
        opts = {
          handlers = {},
          automatic_installation = {
            -- These will be configured by separate plugins.
            exclude = {
              "delve",
              "python",
            },
          },
          -- DAP servers: Mason will be invoked to install these if necessary.
          ensure_installed = {
            "bash",
            "codelldb",
            "php",
            "python",
          },
        },
        dependencies = {
          "mfussenegger/nvim-dap",
          "williamboman/mason.nvim",
        },
      },
      {
        "leoluz/nvim-dap-go",
        config = true,
        dependencies = {
          "mfussenegger/nvim-dap",
        },
      },
      {
        "mfussenegger/nvim-dap-python",
        lazy = true,
        config = function()
          local python = vim.fn.expand("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python")
          require("dap-python").setup(python)
        end,
        -- Consider the mappings at
        -- https://github.com/mfussenegger/nvim-dap-python?tab=readme-ov-file#mappings
        dependencies = {
          "mfussenegger/nvim-dap",
        },
      },
      {
        "nvim-neotest/nvim-nio",
      },
      {
        "theHamsta/nvim-dap-virtual-text",
        config = true,
        dependencies = {
          "mfussenegger/nvim-dap",
        },
      },
    },
  },
}
-- return {
--   {
--     "mfussenegger/nvim-dap",
--     lazy = true,
--     dependencies = {
--       "rcarriga/nvim-dap-ui",
--       "leoluz/nvim-dap-go",
--       "nvim-neotest/nvim-nio"
--     },
--     keys = {
--       {
--         "<leader>db",
--         function() require("dap").toggle_breakpoint() end,
--         desc = "Toggle Breakpoint"
--       },
--
--       {
--         "<leader>dc",
--         function() require("dap").continue() end,
--         desc = "Continue"
--       },
--
--       {
--         "<leader>dC",
--         function() require("dap").run_to_cursor() end,
--         desc = "Run to Cursor"
--       },
--
--       {
--         "<leader>dT",
--         function() require("dap").terminate() end,
--         desc = "Terminate"
--       },
--     },
--   },
--   config = function()
--     local dap, dapui = require("dap"), require("dapui")
--
--     require("dapui").setup()
--     require("dap-go").setup()
--
--
--     dap.listeners.before.attach.dapui_config = function()
--       dapui.open()
--     end
--     dap.listeners.before.launch.dapui_config = function()
--       dapui.open()
--     end
--     dap.listeners.before.event_terminated.dapui_config = function()
--       dapui.close()
--     end
--     dap.listeners.before.event_exited.dapui_config = function()
--       dapui.close()
--     end
--
--     -- vim.keymap.set("n", "<Leader>dt", ":DapUiToggle<CR>", { desc = "Dap Toggle UI" })
--     -- vim.keymap.set("n", "<Leader>db", dap.toggle_breakpoint, { desc = "Dap Toggle Breakpoint" })
--     -- vim.keymap.set("n", "<Leader>di", dap.continue, { desc = "Dap Step Into" })
--     -- vim.keymap.set("n", "<Leader>dc", dap.continue, { desc = "Dap Continue" })
--     -- vim.keymap.set("n", "<Leader>dr", ":lua require('dapui').open({reset = true})<CR>", { desc = "Dap Restart" })
--
--     vim.fn.sign_define("DapBreakpoint", {text = "⏺", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl="DapBreakpoint"})
--   end,
-- },
--   {
--     "mfussenegger/nvim-dap-python",
--     ft = "python",
--     dependencies = {
--       "mfussenegger/nvim-dap",
--     },
--     config = function(_, opts)
--       local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python3"
--       require("dap-python").setup(path)
--       -- require("core.utils").load_mappings("dap_python")
--     end,
--   },
-- }
