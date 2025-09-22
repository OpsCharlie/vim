local done_buffers = {}
return {
  enabled = true,
  notify = false,
  size = vim.g.bigfile_size_limit,
  setup = function(ctx)
    if done_buffers[ctx.buf] then
      return
    end
    done_buffers[ctx.buf] = true
    if vim.fn.exists(":NoMatchParen") ~= 0 then
      vim.cmd([[NoMatchParen]])
    end

    vim.b.minianimate_disable = true

    -- Disable swapfile, undo file, backups globally or buffer local
    vim.o.backup = false
    vim.o.writebackup = false

    -- Window-local options optimization
    vim.api.nvim_set_option_value('foldmethod', 'manual', { win = 0 })
    vim.api.nvim_set_option_value('statuscolumn', '', { win = 0 })
    vim.api.nvim_set_option_value('conceallevel', 0, { win = 0 })
    vim.api.nvim_set_option_value('number', false, { win = 0 })
    vim.api.nvim_set_option_value('relativenumber', false, { win = 0 })
    vim.api.nvim_set_option_value('cursorline', false, { win = 0 })
    vim.api.nvim_set_option_value('colorcolumn', '', { win = 0 })


    -- Optionally disable syntax highlighting if desired:
    -- vim.bo[ctx.buf].syntax = "off"

    vim.schedule(function()
      if vim.api.nvim_buf_is_valid(ctx.buf) then
        vim.bo[ctx.buf].syntax = "off"
        vim.bo[ctx.buf].swapfile = false
        vim.bo[ctx.buf].undofile = false
        vim.bo[ctx.buf].completeopt = ""

        -- Disable LSP for this buffer (if LSP client attached)
        local clients = vim.lsp.get_clients({ bufnr = ctx.buf })
        for _, client in pairs(clients) do
          vim.lsp.buf_detach_client(ctx.buf, client.id)
        end
      end
    end)

		local fsize = vim.fn.getfsize(vim.fn.expand("%"))
    vim.notify(
      string.format("Big file optimizations applied: %.2f MiB", fsize / 1024 / 1024),
      vim.log.levels.WARN,
      { title = "Big File" }
    )
  end
}
