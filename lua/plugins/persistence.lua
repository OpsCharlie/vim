return {
  "folke/persistence.nvim",
  event = "BufReadPre",
  opts = {},
  init = function()
    local scratch_dir = vim.fn.expand("~/.vim/scratch")
    vim.g.autosave_enabled = vim.g.neovide or false

    -- Helper: Save unnamed buffer to scratch directory
    local function save_unnamed_buffer()
      if vim.fn.expand("%") == "" and vim.bo.modified and vim.bo.buftype == "" then
        local filename = scratch_dir .. "/scratch_" .. os.date("%Y%m%d_%H%M%S") .. ".txt"
        vim.cmd("silent! write " .. vim.fn.fnameescape(filename))
        vim.notify("Saved unnamed buffer to " .. filename, vim.log.levels.INFO)
      end
    end

    -- Helper: Save named buffer
    local function save_named_buffer()
      if vim.fn.expand("%") ~= "" and vim.bo.modified and vim.bo.buftype == "" then
        vim.cmd("silent! write")
      end
    end

    -- Helper: Save all buffers (named and unnamed)
    local function save_all_buffers()
      if not vim.g.autosave_enabled then return end
      for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_is_loaded(buf) then
          vim.api.nvim_buf_call(buf, function()
            if vim.bo.modified and vim.bo.buftype == "" then
              if vim.fn.expand("%") == "" then
                save_unnamed_buffer()
              else
                save_named_buffer()
              end
            end
          end)
        end
      end
    end

    if vim.g.neovide then
      -- Auto-restore session on startup (only if no arguments were passed)
      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          if vim.fn.argc() == 0 and not vim.g.started_with_stdin then
            -- Restore session
            require("persistence").load()
            -- Reopen scratch files
            local scratch_files = vim.fn.glob(scratch_dir .. "/scratch_*.txt", false, true)
            for _, file in ipairs(scratch_files) do
              vim.cmd("edit " .. vim.fn.fnameescape(file))
            end
          end
        end,
        nested = true,
      })

      -- Auto-save on focus lost or buffer leave
      vim.api.nvim_create_autocmd({ "FocusLost", "BufLeave" }, {
        callback = function()
          if not vim.g.autosave_enabled then return end
          if vim.fn.expand("%") == "" then
            save_unnamed_buffer()
          else
            save_named_buffer()
          end
        end,
      })

      -- Periodic auto-save (every 2 minutes)
      local autosave_timer = vim.uv.new_timer()
      autosave_timer:start(
        120000,
        120000,
        vim.schedule_wrap(save_all_buffers)
      )
    end
  end,
  -- stylua: ignore
  keys = {
    { "<leader>sr", function() require("persistence").load() end,                desc = "Session Restore" },
    { "<leader>sS", function() require("persistence").select() end,              desc = "Session Select" },
    { "<leader>sl", function() require("persistence").load({ last = true }) end, desc = "Session Restore Last Session" },
    { "<leader>sd", function() require("persistence").stop() end,                desc = "Don't Save Current Session" },
    {
      "<leader>ta",
      function()
        vim.g.autosave_enabled = not vim.g.autosave_enabled
        vim.notify("Auto-save " .. (vim.g.autosave_enabled and "enabled" or "disabled"), vim.log.levels.INFO)
      end,
      desc = "Toggle Auto-save",
    },
    {
      "<leader>bd",
      function()
        local filepath = vim.fn.expand("%:p")
        local scratch_dir = vim.fn.expand("~/.vim/scratch")
        local is_scratch = filepath:find(scratch_dir, 1, true) ~= nil

        if is_scratch and filepath ~= "" then
          -- Confirm before deleting scratch file
          vim.ui.input({ prompt = "Delete scratch file? (y/n): " .. filepath .. " " }, function(input)
            if input and input:lower() == "y" then
              local success, err = os.remove(filepath)
              if success then
                vim.notify("Deleted scratch file: " .. filepath, vim.log.levels.INFO)
                vim.cmd("bdelete!")
              else
                vim.notify("Failed to delete: " .. err, vim.log.levels.ERROR)
              end
            else
              vim.notify("Cancelled", vim.log.levels.INFO)
            end
          end)
        else
          -- Normal buffer delete
          vim.cmd("bdelete")
        end
      end,
      desc = "Delete Buffer (and file if scratch)",
    },
  },
}
