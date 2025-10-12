return {
  "lewis6991/gitsigns.nvim",
  -- Git integration for buffers
  -- ft = { "gitcommit", "diff" },
  event = { "BufReadPre", "BufNewFile" },
  keys = {
    { "<leader>gj", mode = "n", "<cmd>Gitsigns next_hunk<CR>", desc = "Git Next Hunk" },
    { "<leader>gk", mode = "n", "<cmd>Gitsigns prev_hunk<CR>", desc = "Git Previous Hunk" },
    { '<leader>gD', mode = "n", "<cmd>Gitsigns diffthis<CR>",  desc = 'Git diff' },
    { '<leader>gq', mode = "n", "<cmd>lua require'gitsigns'.setqflist()<CR>",  desc = 'Git qflist' },
    { '<leader>gQ', mode = "n", "<cmd>lua require'gitsigns'.setqflist('all')<CR>",  desc = 'Git qflist all' },
    --   { "<leader>gs", mode = "n", "<cmd>Gitsigns stage_hunk<CR>",      desc = "Git Stage Hunk" },
    --   { "<leader>gu", mode = "n", "<cmd>Gitsigns undo_stage_hunk<CR>", desc = "Git Undo Stage Hunk" },
    --   { "<leader>gr", mode = "n", "<cmd>Gitsigns reset_hunk<CR>",      desc = "Git Reset Hunk" },
    --   { "<leader>gR", mode = "n", "<cmd>Gitsigns reset_buffer<CR>",    desc = "Git Reset buffer" },
    --   { "<leader>gp", mode = "n", "<cmd>Gitsigns preview_hunk<CR>",    desc = "Git Preview hunk" },
    --   { "<leader>gb", mode = "n", "<cmd>Gitsigns blame_line<CR>",      desc = "Git Blame line" },
  },
  -- init = function()
  --   -- load gitsigns only when a git file is opened
  --   vim.api.nvim_create_autocmd({ "BufRead" }, {
  --     group = vim.api.nvim_create_augroup("GitSignsLazyLoad", { clear = true }),
  --     callback = function()
  --       vim.fn.jobstart({ "git", "-C", vim.loop.cwd(), "rev-parse" }, {
  --         on_exit = function(_, return_code)
  --           if return_code == 0 then
  --             vim.api.nvim_del_augroup_by_name("GitSignsLazyLoad")
  --             vim.schedule(function()
  --               require("lazy").load({ plugins = { "gitsigns.nvim" } })
  --             end)
  --           end
  --         end,
  --       })
  --     end,
  --   })
  -- end,
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
      vim.api.nvim_create_user_command("GDiff", ":Gitsigns diffthis", { desc = "Git diff (Gitsigns)" }),
      vim.api.nvim_create_user_command("GRead", ":Gitsigns reset_buffer", { desc = "Git reset buffer (Gitsigns)" }),
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
