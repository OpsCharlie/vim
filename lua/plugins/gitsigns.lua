return {
  "lewis6991/gitsigns.nvim",
  -- Git integration for buffers
  ft = { "gitcommit", "diff" },
  keys = {
    {"<leader>gj", mode = "n", "<cmd>Gitsigns next_hunk<CR>", desc = "Git Next Hunk" },
    {"<leader>gk", mode = "n", "<cmd>Gitsigns prev_hunk<CR>" , desc = "Git Previous Hunk" },
    {"<leader>gs", mode = "n", "<cmd>Gitsigns stage_hunk<CR>", desc = "Git Stage Hunk" },
    {"<leader>gu", mode = "n", "<cmd>Gitsigns undo_stage_hunk<CR>", desc = "Git Undo Stage Hunk" },
    {"<leader>gr", mode = "n", "<cmd>Gitsigns reset_hunk<CR>", desc = "Git Reset Hunk" },
    {"<leader>gR", mode = "n", "<cmd>Gitsigns reset_buffer<CR>", desc = "Git Reset buffer" },
    {"<leader>gp", mode = "n", "<cmd>Gitsigns preview_hunk<CR>", desc = "Git Preview hunk" },
    {"<leader>gb", mode = "n", "<cmd>Gitsigns blame_line<CR>", desc = "Git Blame line" },
  },
  init = function()
    -- load gitsigns only when a git file is opened
    vim.api.nvim_create_autocmd({ "BufRead" }, {
      group = vim.api.nvim_create_augroup("GitSignsLazyLoad", { clear = true }),
      callback = function()
        vim.fn.jobstart({ "git", "-C", vim.loop.cwd(), "rev-parse" }, {
          on_exit = function(_, return_code)
            if return_code == 0 then
              vim.api.nvim_del_augroup_by_name("GitSignsLazyLoad")
              vim.schedule(function()
                require("lazy").load({ plugins = { "gitsigns.nvim" } })
              end)
            end
          end,
        })
      end,
    })
  end,
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
    })
  end,
}
