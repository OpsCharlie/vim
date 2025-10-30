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
      local filename = vim.fn.expand("%:t:r")                  -- Get current buffer's filename
      vim.api.nvim_put({ filename .. " | " }, "c", true, true) -- Insert at cursor
    end, { desc = "Add name prefix", silent = true })
    vim.keymap.set("n", "<leader>N", function()
      local filename = vim.fn.expand("%:t:r")
      vim.cmd("silent! %s/- name: /- name: " .. filename .. " | /g")
    end, { desc = "Add buffer name prefix", silent = true })
    vim.keymap.set("n", "<leader>a", "wbiansible.builtin.<ESC>",
      { desc = "Add FQCN for builtin module", silent = true })
    -- Set 'K' and 'ca' mappings for every yaml.ansible buffer using autocmd
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "yaml.ansible",
      callback = function(ev)
        -- make 'gf' work from include_tasks
        local function find_tasks_dir(filepath)
          local dir = vim.fn.fnamemodify(filepath, ':h')
          while dir ~= '/' do
            if vim.fn.isdirectory(dir .. '/tasks') == 1 then
              return dir .. '/tasks'
            end
            dir = vim.fn.fnamemodify(dir, ':h')
          end
          return nil
        end
        local tasks_dir = find_tasks_dir(vim.fn.expand('%:p'))
        if tasks_dir then
          vim.opt_local.path:append(tasks_dir)
        end

        vim.keymap.set('n', '<leader>ca', ':!ansible-lint --fix % &>/dev/null<CR>', { desc = "Action ansiblelint", buffer = ev.buf })

        vim.keymap.set({ 'n', 'v' }, 'K', function()
          local mode = vim.fn.mode(true)
          local module
          if mode:sub(1, 1) == 'v' or mode:sub(1, 1) == 'V' then
            -- Reselect visual selection
            local save_reg = vim.fn.getreg('"')
            vim.cmd('normal! "vy')
            module = vim.fn.getreg('v')
            vim.fn.setreg('"', save_reg)
            module = module and module:gsub("\n", "") or ""
          else
            local cword = vim.fn.expand("<cword>")
            module = cword:match("(.+)%..+") or cword
          end
          if not module or module == "" then return end
          local buf = vim.api.nvim_create_buf(false, true)
          local width = math.floor(vim.o.columns * 0.8)
          local height = math.floor(vim.o.lines * 0.8)
          local row = math.floor((vim.o.lines - height) / 2)
          local col = math.floor((vim.o.columns - width) / 2)
          vim.api.nvim_open_win(buf, true, {
            relative = "editor",
            width = width,
            height = height,
            row = row,
            col = col,
            style = "minimal",
            border = "rounded",
          })
          local chan = vim.api.nvim_open_term(buf, {})
          vim.fn.jobstart(
            { "sh", "-c", "ANSIBLE_FORCE_COLOR=1 TERM=xterm-256color PAGER=cat ansible-doc " ..
            vim.fn.shellescape(module) },
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
        end, { desc = 'ansible-doc', buffer = ev.buf })
      end,
    })
  end,
}
