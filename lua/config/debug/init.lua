vim.fn.sign_define("DapBreakpoint",
  { text = "⏺", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" })

local dap = require 'dap'
local dapui = require 'dapui'

dapui.setup()
dap.listeners.after.event_initialized['dapui_config'] = dapui.open

require("config.debug.go")
require("config.debug.python")
require("config.debug.sh")
