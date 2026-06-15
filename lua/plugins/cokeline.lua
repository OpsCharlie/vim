return {
  "willothy/nvim-cokeline",
  -- A Neovim bufferline
  dependencies = {
    "nvim-lua/plenary.nvim",       -- Required for v0.4.0+
    "nvim-tree/nvim-web-devicons", -- If you want devicons
  },
  config = function()
    local get_hex = require("cokeline.hlgroups").get_hl_attr
    require("cokeline").setup({
      default_hl = {
        fg = function(buffer)
          if buffer.is_modified and buffer.is_focused then
            return "#ff0000"
          elseif buffer.is_focused then
            return get_hex("Normal", "fg")
          elseif buffer.is_modified then
            return "#b30000"
          else
            return get_hex("Comment", "fg")
          end
        end,
      },
      components = {
        {
          text = " │ ",
        },
        {
          text = function(buffer)
            return buffer.devicon.icon
          end,
          fg = function(buffer)
            return buffer.devicon.color
          end,
        },
        {
          text = function(buffer)
            local diagnostics = vim.diagnostic.get(buffer.number)
            local errors = #vim.tbl_filter(function(d)
              return d.severity == vim.diagnostic.severity.ERROR
            end, diagnostics)
            return errors > 0 and "  " .. errors .. " " or ""
          end,
          fg = "#ff0000",
        },
        {
          text = function(buffer)
            return buffer.filename .. " "
          end,
          bold = function(buffer)
            return buffer.is_focused
          end,
        },
        {
          text = " ",
        },
        {
          text = "X",
          delete_buffer_on_left_click = true,
        },
      },
      tabs = {
        placement = "right",
        components = {
          {
            text = function(tab)
              local tabpages = vim.api.nvim_list_tabpages()
              if #tabpages > 1 then
                local tabpage = tabpages[tab.number]
                local windows = vim.api.nvim_tabpage_list_wins(tabpage)
                local unique_buffers = {}
                for _, win in ipairs(windows) do
                  local buf = vim.api.nvim_win_get_buf(win)
                  if vim.api.nvim_get_option_value('buftype', { buf = buf }) == '' then
                    unique_buffers[buf] = true
                  end
                end
                local buf_count = vim.tbl_count(unique_buffers)
                return "｜Tab " .. tab.number .. ":" .. buf_count .. " "
              else
                return ""
              end
            end,
            fg = function(tab)
              return tab.is_active and get_hex("Normal", "fg") or get_hex("Comment", "fg")
            end,
            bold = function(tab)
              return tab.is_active
            end,
          },
        },
      },
    })

    vim.keymap.set("n", "<S-TAB>", function()
      require("cokeline.mappings").by_step("focus", -1)
    end, { desc = "Previous buffer" })
    vim.keymap.set("n", "<TAB>", function()
      require("cokeline.mappings").by_step("focus", 1)
    end, { desc = "Next buffer" })
  end,
}
