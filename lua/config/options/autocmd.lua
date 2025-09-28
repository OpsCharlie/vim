-------------------------------------- autocmds ------------------------------------------
local autocmd = vim.api.nvim_create_autocmd
local function augroup(name)
  return vim.api.nvim_create_augroup(name, { clear = true })
end

-- don't list quickfix buffers
autocmd("FileType", {
  group = augroup('quickfix'),
  pattern = "qf",
  callback = function()
    vim.opt_local.buflisted = false
  end,
})


-- disable swap/undo/backup files in temp directories or shm
autocmd({ 'BufNewFile', 'BufReadPre' }, {
  group = augroup('disable_undo_swap_backup'),
  pattern = { '/tmp/*', '*.tmp', 'COMMIT_EDITMSG', 'MERGE_MSG' },
  callback = function()
    vim.opt_local.undofile = false
    vim.opt_local.swapfile = false
    vim.opt_global.backup = false
    vim.opt_global.writebackup = false
    vim.notify("Swap and undo disabled", vim.log.levels.INFO, { title = "Temp File" })
  end,
})


-- open snacks explorer on startup if no files are opened
-- autocmd("VimEnter", {
--   group = augroup('open_snacks_explorer'),
--   callback = function()
--     if vim.fn.argc() == 0 then
--       require("snacks").explorer()
--     end
--   end,
-- })


-- detect filetype if not set
autocmd("BufReadPost", {
  callback = function()
    if vim.bo.filetype == "" then
      vim.cmd("filetype detect")
    end
  end,
})


-- set filetype for specific file patterns
autocmd({ "BufRead", "BufNewFile" }, {
  group = augroup('set_filetype'),
  pattern = { "*/ansible/*.yml", "*/ansible/hosts" },
  command = "set filetype=yaml.ansible",
})


autocmd("FileType", {
  group = augroup('sh_filetype'),
  pattern = "sh",
  callback = function()
    vim.opt_local.expandtab = false
    vim.opt_local.tabstop = 4
    vim.opt_local.softtabstop = 4
    vim.opt_local.shiftwidth = 4
  end,
})


autocmd("FileType", {
  group = augroup('go_filetype'),
  pattern = "go",
  callback = function()
    vim.opt_local.expandtab = false
    vim.opt_local.tabstop = 4
    vim.opt_local.softtabstop = 4
    vim.opt_local.shiftwidth = 4
  end,
})

autocmd("LspAttach", {
  group = augroup('lsp_attach'),
  callback = function(event)
    vim.diagnostic.config({
      virtual_lines = {
        current_line = true
      },
      virtual_text = false,
      underline = true,
      update_in_insert = false,
      severity_sort = true,
      float = {
        header = "",
        border = "rounded",
        source = true,
        focusable = true,
      },
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "󰅚 ",
          [vim.diagnostic.severity.WARN] = "󰀪 ",
          [vim.diagnostic.severity.INFO] = "󰋽 ",
          [vim.diagnostic.severity.HINT] = "󰌶 ",
        },
      },
    })

    vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover Document" })
    vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "LSP Definition" })
    vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "LSP References" })
    vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { desc = "LSP Rename All References" })
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Action LSP" })
    vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, { desc = "Format File LSP" })
    vim.keymap.set("n", "<leader>D", function()
      local state = vim.g._diagnostic_toggle_state or 1
      -- 1: virtual lines, 2: float, 3: disabled
      if state == 1 then
        -- Show float for current line
        autocmd({ "CursorHold", "CursorHoldI" }, {
          group = augroup('diagnostic_float'),
          callback = function()
            vim.diagnostic.open_float(nil, { focus = false, scope = "line" })
          end,
        }
        )
        vim.diagnostic.config({ virtual_lines = false })
        vim.g._diagnostic_toggle_state = 2
        vim.o.updatetime = 100
        vim.notify("Diagnostic float enabled", vim.log.levels.INFO, { render = "minimal", title = "Diagnostic" })
      elseif state == 2 then
        -- Disable diagnostics
        vim.diagnostic.config({ virtual_lines = false })
        vim.g._diagnostic_toggle_state = 3
        vim.api.nvim_clear_autocmds({ group = 'diagnostic_float' })
        vim.notify("Diagnostic disabled", vim.log.levels.INFO, { render = "minimal", title = "Diagnostic" })
      else
        -- Enable virtual lines for current line
        vim.diagnostic.config({ virtual_lines = { current_line = true } })
        vim.g._diagnostic_toggle_state = 1
        vim.notify("Diagnostic Virtual lines", vim.log.levels.INFO, { render = "minimal", title = "Diagnostic" })
      end
    end, { desc = "Diagnostic Display Toggle" })

    local function client_supports_method(client, method, bufnr)
      if vim.fn.has 'nvim-0.11' == 1 then
        return client:supports_method(method, bufnr)
      else
        return client.supports_method(method, { bufnr = bufnr })
      end
    end

    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
      local highlight_augroup = vim.api.nvim_create_augroup('lsp-highlight', { clear = false })

      -- When cursor stops moving: Highlights all instances of the symbol under the cursor
      -- When cursor moves: Clears the highlighting
      autocmd({ 'CursorHold', 'CursorHoldI' }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.document_highlight,
      })
      autocmd({ 'CursorMoved', 'CursorMovedI' }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.clear_references,
      })

      -- When LSP detaches: Clears the highlighting
      autocmd('LspDetach', {
        group = augroup('lsp-detach'),
        callback = function(event2)
          vim.lsp.buf.clear_references()
          vim.api.nvim_clear_autocmds { group = 'lsp-highlight', buffer = event2.buf }
        end,
      })
    end
  end,
})


-- Go to last loc when opening a buffer, see ':h last-position-jump'
autocmd('BufReadPost', {
  group = augroup('last_loc'),
  callback = function(event)
    local exclude = { 'gitcommit', 'commit', 'gitrebase' }
    local buf = event.buf
    if
        vim.tbl_contains(exclude, vim.bo[buf].filetype)
        or vim.b[buf].lazyvim_last_loc
    then
      return
    end
    vim.b[buf].lazyvim_last_loc = true
    local mark = vim.api.nvim_buf_get_mark(buf, '"')
    local lcount = vim.api.nvim_buf_line_count(buf)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- highlight yanked text
autocmd('TextYankPost', {
  group = augroup('highlight_yank'),
  callback = function()
    vim.highlight.on_yank({ timeout = 250 })
  end,
})
