return {
  "lewis6991/gitsigns.nvim",
  -- Git integration for buffers
  -- ft = { "gitcommit", "diff" },
  event = { "BufReadPre", "BufNewFile" },
  keys = {
    { "<leader>gj", mode = "n", "<cmd>Gitsigns next_hunk<CR>",                     desc = "Git Next Hunk" },
    { "<leader>gk", mode = "n", "<cmd>Gitsigns prev_hunk<CR>",                     desc = "Git Previous Hunk" },
    { '<leader>gD', mode = "n", "<cmd>Gitsigns diffthis<CR>",                      desc = 'Git diff' },
    { '<leader>gq', mode = "n", "<cmd>lua require'gitsigns'.setqflist()<CR>",      desc = 'Git qflist' },
    { '<leader>gQ', mode = "n", "<cmd>lua require'gitsigns'.setqflist('all')<CR>", desc = 'Git qflist all' },
    { "<leader>ga", mode = "n", "<cmd>Gitsigns stage_hunk<CR>",                    desc = "Git Add Hunk" },
    { "<leader>gA", mode = "n", "<cmd>Gitsigns stage_buffer<CR>",                  desc = "Git Add Buffer" },
    { "<leader>gp", mode = "n", "<cmd>Gitsigns preview_hunk<CR>",                  desc = "Git Preview hunk" },
    --   { "<leader>gu", mode = "n", "<cmd>Gitsigns undo_stage_hunk<CR>", desc = "Git Undo Stage Hunk" },
    --   { "<leader>gr", mode = "n", "<cmd>Gitsigns reset_hunk<CR>",      desc = "Git Reset Hunk" },
    --   { "<leader>gR", mode = "n", "<cmd>Gitsigns reset_buffer<CR>",    desc = "Git Reset buffer" },
    --   { "<leader>gb", mode = "n", "<cmd>Gitsigns blame_line<CR>",      desc = "Git Blame line" },
  },
  config = function()
    require("gitsigns").setup({
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "-" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "?" },
      },
      vim.api.nvim_create_user_command("Gdiff", ":Gitsigns diffthis", { desc = "Git diff (Gitsigns)" }),
      vim.api.nvim_create_user_command("Gread", ":Gitsigns reset_buffer", { desc = "Git reset buffer (Gitsigns)" }),
      vim.api.nvim_create_user_command("Gadd", function()
        local file = vim.api.nvim_buf_get_name(0)
        if file == "" then
          vim.api.nvim_echo({ { "No file associated with current buffer.", "ErrorMsg" } }, false, {})
          return
        end
        vim.fn.jobstart({ "git", "add", file }, {
          on_exit = function(_, code)
            if code == 0 then
              vim.schedule(function()
                vim.api.nvim_echo({ { "Added: " .. file, "Normal" } }, false, {})
              end)
            else
              vim.schedule(function()
                vim.api.nvim_echo({ { "Failed to add: " .. file, "ErrorMsg" } }, false, {})
              end)
            end
          end,
        })
      end, { desc = "Git add current buffer" }),
      vim.api.nvim_create_user_command("Git", function(opts)
        local cmd = { "git" }
        for _, arg in ipairs(opts.fargs) do
          table.insert(cmd, arg)
        end
        vim.fn.jobstart(cmd, {
          stdout_buffered = true,
          on_stdout = function(_, data)
            if data then
              vim.schedule(function()
                vim.api.nvim_echo({ { table.concat(data, "\n"), "Normal" } }, false, {})
              end)
            end
          end,
          on_stderr = function(_, data)
            if data then
              vim.schedule(function()
                vim.api.nvim_echo({ { table.concat(data, "\n"), "ErrorMsg" } }, false, {})
              end)
            end
          end,
        })
      end, { desc = "Run git command", nargs = "+", complete = "shellcmd" })
    })
  end,
}
