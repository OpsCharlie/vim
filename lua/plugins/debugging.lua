return {
  -- Debugging setup using nvim-dap and nvim-dap-ui
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
      vim.fn.sign_define("DapBreakpoint",
        { text = "⏺", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" })
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
        -- Docs at https://github.com/mfussenegger/nvim-dap-python are useful.
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
