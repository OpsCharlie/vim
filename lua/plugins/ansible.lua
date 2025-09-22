return {
  "pearofducks/ansible-vim",
  -- Syntax plugin for Ansible 2.x, it supports YAML playbooks, Jinja2 templates, and Ansible's hosts files.
  lazy = true,
  ft = "yaml.ansible",
  config = function()
    vim.g.ansible_unindent_after_newline = 1
    vim.g.ansible_extra_keywords_highlight = 1
    vim.opt.colorcolumn = "160"
    vim.keymap.set({ "n", "i" }, "<leader>n", function()
      local filename = vim.fn.expand("%:t:r")             -- Get filename without path or extension
      vim.api.nvim_put({ filename .. " | " }, "c", true, true) -- Insert at cursor
    end, { desc = "Add name prefix", silent = true })
    vim.keymap.set("n", "<leader>N", ":%s/- name: /- name: %<BS><BS><BS><BS> | /<CR>",
      { desc = "Add buffer name prefix", silent = true })
    vim.keymap.set("n", "<leader>a", "wbiansible.builtin.<ESC>",
      { desc = "Add FQCN for builtin module", silent = true })
    vim.keymap.set('n', '<leader>ca', ':!ansible-lint --fix %<CR>', { desc = "Code Action ansiblelint", buffer = true })
    vim.keymap.set('n', 'K', function()
      -- Get the current word under the cursor
      local cword = vim.fn.expand("<cword>")

      -- Create a scratch buffer
      local buf = vim.api.nvim_create_buf(false, true) -- unlisted, scratch

      -- Window size & position
      local width = math.floor(vim.o.columns * 0.8)
      local height = math.floor(vim.o.lines * 0.8)
      local row = math.floor((vim.o.lines - height) / 2)
      local col = math.floor((vim.o.columns - width) / 2)

      -- Open floating window
      vim.api.nvim_open_win(buf, true, {
        relative = "editor",
        width = width,
        height = height,
        row = row,
        col = col,
        style = "minimal",
        border = "rounded",
      })

      -- Open a terminal channel in the buffer
      local chan = vim.api.nvim_open_term(buf, {})

      -- Run ansible-doc and stream output to the terminal
      vim.fn.jobstart(
        { "sh", "-c", "ANSIBLE_FORCE_COLOR=1 TERM=xterm-256color PAGER=cat ansible-doc " .. vim.fn.shellescape(cword) },
        {
          stdout_buffered = true,
          on_stdout = function(_, data, _)
            if data then
              for _, line in ipairs(data) do
                vim.api.nvim_chan_send(chan, line .. "\r\n")
              end
            end
          end,
          on_stderr = function(_, data, _)
            if data then
              for _, line in ipairs(data) do
                vim.api.nvim_chan_send(chan, line .. "\r\n")
              end
            end
          end,
        }
      )

      vim.keymap.set("n", "q", "<cmd>close<CR>", { buffer = buf, nowait = true })
    end, { desc = 'ansible-doc', buffer = 0 })
  end,
}
