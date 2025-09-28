return {
  -- Debugging setup using nvim-dap and nvim-dap-ui
  -- {
    "mfussenegger/nvim-dap",
    dependencies = {
      'rcarriga/nvim-dap-ui',
      'nvim-neotest/nvim-nio',
      'williamboman/mason.nvim',
      'leoluz/nvim-dap-go',
      'mfussenegger/nvim-dap-python',
      "theHamsta/nvim-dap-virtual-text",
    },
    lazy = true,
    keys = {
      { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
      { "<F7>",       function() require("dap").step_into() end,         desc = "Step Into" },
      { "<leader>dc", function() require("dap").continue() end,          desc = "Continue" },
      { "<leader>dC", function() require("dap").run_to_cursor() end,     desc = "Run to Cursor" },
      { "<leader>dT", function() require("dap").terminate() end,         desc = "Terminate" },
      { "<leader>du", function() require("dapui").toggle({}) end,        desc = "Dap UI" },
    },
    config = function()
      require("config.dap")
    end,
}
