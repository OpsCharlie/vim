local python = vim.fn.expand("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python")
require("dap-python").setup(python)
