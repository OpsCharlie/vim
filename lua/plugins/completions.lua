return {
  {
    "saghen/blink.cmp",
    version = "1.*",
    lazy = true,
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    config = function()

      require("blink.cmp").setup({
        enabled = function()
          return not vim.b.snacks_picker_input
        end,
        keymap = {
          preset = "none",
          ["<CR>"] = { "accept", "fallback" },
          ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
          ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
          ["<C-b>"] = { "scroll_documentation_up", "fallback" },
          ["<C-f>"] = { "scroll_documentation_down", "fallback" },
        },
        completion = {
          list = {
            selection = {
              preselect = false,
              auto_insert = false,
            },
          },
          menu = {
            border = "rounded",
            draw = {
              columns = {
                { "label", "label_description", gap = 1 },
                { "kind_icon", "kind" },
              },
            },
          },
          documentation = {
            auto_show = false,
            window = {
              border = "rounded",
            },
          },
        },
        signature = {
          enabled = true,
          window = {
            border = "rounded",
          },
        },
        sources = {
          default = { "snippets", "lsp", "path", "buffer" },
          providers = {
            snippets = {
              opts = {
                search_paths = {
                  vim.fn.stdpath("config") .. "/vim-snippets/luasnippets",
                },
              },
            },
            lsp = {
              min_keyword_length = 3,
              fallbacks = {},
            },
            path = {
              min_keyword_length = 3,
            },
            buffer = {
              min_keyword_length = 3,
              opts = {
                get_bufnrs = function()
                  local bufs = {}
                  for _, win in ipairs(vim.api.nvim_list_wins()) do
                    bufs[vim.api.nvim_win_get_buf(win)] = true
                  end
                  return vim.tbl_keys(bufs)
                end,
              },
            },
          },
        },
        cmdline = {
          enabled = true,
        },
      })
    end,
  },
}
