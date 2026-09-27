return {
  "nvim-lualine/lualine.nvim",
  -- A blazing fast and easy to configure Neovim statusline
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local function buf_step(dir)
      local bufs = vim.fn.getbufinfo({ buflisted = 1 })
      if #bufs < 2 then
        return
      end
      local idx = 1
      for i, b in ipairs(bufs) do
        if b.bufnr == vim.api.nvim_get_current_buf() then
          idx = i
          break
        end
      end
      vim.api.nvim_set_current_buf(bufs[((idx - 1 + dir) % #bufs) + 1].bufnr)
    end

    local function state_bg(buf)
      if vim.api.nvim_get_option_value("modified", { buf = buf }) then
        return "#B22222"
      end
      if vim.api.nvim_get_option_value("readonly", { buf = buf }) then
        return "#B26A22"
      end
    end

    -- Two lualine internals need correcting to get a usable tabline:
    --   1. the filter at init.lua:87 is hardcoded (listed, non-quickfix only)
    --   2. the fallback at init.lua:140 injects nvim_get_current_buf() whenever
    --      no listed buffer is current, so a focused float (snacks picker,
    --      explorer, notifications) renders as a phantom "[No Name]" entry
    -- is_hidden drops the unlisted/quickfix buffers lualine already skips plus
    -- the empty placeholder buffer Neovim starts with.
    local function is_hidden(b, current)
      if vim.fn.buflisted(b) == 0 or vim.api.nvim_get_option_value("buftype", { buf = b }) == "quickfix" then
        return true
      end
      return vim.api.nvim_buf_get_name(b) == ""
        and not vim.api.nvim_get_option_value("modified", { buf = b })
        and b ~= current
    end

    -- Resolve a focused float to the visible file buffer underneath, so the
    -- fallback above never fires.
    local function effective_current_buf()
      local fallback = vim.api.nvim_get_current_buf()
      if vim.fn.win_gettype(vim.api.nvim_get_current_win()) ~= "popup" then
        return fallback
      end
      for _, w in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
        local b = vim.api.nvim_win_get_buf(w)
        if vim.fn.win_gettype(w) ~= "popup" and not is_hidden(b, fallback) then
          return b
        end
      end
      return fallback
    end

    -- Intentional method overrides; see the note above.
    ---@diagnostic disable: duplicate-set-field
    require("lualine.components.buffers.buffer").is_current = function(self)
      return effective_current_buf() == self.bufnr
    end

    local buffers_component = require("lualine.components.buffers.init")
    buffers_component.buffers = function(self)
      local buffers = {}
      local current = effective_current_buf()
      buffers_component.bufpos2nr = {}
      for b = 1, vim.fn.bufnr("$") do
        if not is_hidden(b, current) then
          buffers[#buffers + 1] = self:new_buffer(b, #buffers + 1)
          buffers_component.bufpos2nr[#buffers] = b
        end
      end
      return buffers
    end
    ---@diagnostic enable: duplicate-set-field

    require("lualine").setup({
      options = {
        theme = "auto",
        globalstatus = true,
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
      },
      sections = {
        lualine_c = {
          {
            function()
              local bg = state_bg(vim.api.nvim_get_current_buf()) or "#404040"
              vim.cmd("hi! lualine_filename_status guibg=" .. bg)
              return vim.fn.expand("%:p")
            end,
            "filename",
            color = "lualine_filename_status",
          },
        },
      },
      tabline = {
        lualine_c = {
          {
            "buffers",
            show_filename_only = true,
            show_modified_status = true,
            icons_enabled = false,
            padding = { left = 1, right = 1 },
            component_separators = { left = "%#NonText#|", right = "" },
            section_separators = { left = "%#NonText#|", right = "" },
            symbols = { modified = " ●", alternate_file = "" },
            buffers_color = {
              active = function()
                local text = vim.api.nvim_get_hl(0, { name = "lualine_c_normal" })
                return {
                  -- lualine's sanitize_color only accepts hex strings or cterm
                  -- indices, never the 24-bit integers nvim_get_hl returns.
                  fg = text.fg and ("#%06X"):format(text.fg) or nil,
                  bg = state_bg(effective_current_buf()) or "#404040",
                  gui = "bold",
                }
              end,
              inactive = "lualine_c_normal",
            },
            fmt = function(name, buf)
              local bn = buf.bufnr
              local errors = #vim.tbl_filter(function(d)
                return d.severity == vim.diagnostic.severity.ERROR
              end, vim.diagnostic.get(bn))
              return errors > 0 and ("%s %d "):format(name, errors) or name
            end,
          },
        },
        lualine_z = { 'tabs' },
      },
      extensions = { "quickfix", "nvim-dap-ui", "lazy", "mason", "toggleterm", "trouble" },
    })

    vim.keymap.set("n", "<TAB>", function() buf_step(1) end, { desc = "Next buffer" })
    vim.keymap.set("n", "<S-TAB>", function() buf_step(-1) end, { desc = "Previous buffer" })

    -- Refresh tabline on diagnostic changes so error counts update
    vim.api.nvim_create_autocmd("DiagnosticChanged", {
      group = vim.api.nvim_create_augroup("lualine_tabline_refresh", { clear = true }),
      callback = function()
        vim.cmd.redrawtabline()
      end,
    })
  end,
}
