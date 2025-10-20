return {
  -- cmp and lsp setup
  {
    "hrsh7th/nvim-cmp",
    lazy = true,
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/cmp-nvim-lua",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
      "hrsh7th/cmp-emoji",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      require("luasnip.loaders.from_vscode").lazy_load({
        paths = vim.fn.stdpath("config") .. "/vim-snippets/luasnippets",
      })

      cmp.setup({
        completion = {
          completeopt = "menu,menuone,preview,noselect",
          keyword_length = 3,
        },
        enabled = function()
          -- Disable completion in snacks picker input
          if vim.b.snacks_picker_input then
            return false
          end
          local line = vim.api.nvim_get_current_line()
          local col = vim.fn.col('.') - 1
          local prefix = line:sub(1, col)
          -- Allow completion with any length if line starts with ':'
          if prefix:match("^:%S*") then
            return true
          end
          -- Otherwise, require at least 3 characters before cursor
          return #prefix >= 3
        end,
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        preselect = cmp.PreselectMode.None,
        mapping = {
          ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = false,
          }),
          ["<Tab>"] = function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end,
          ["<S-Tab>"] = function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end,
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
        },
        sources = {
          { name = "luasnip",                 priority = 100 }, -- For luasnip users.
          { name = "nvim_lsp",                priority = 90 },
          { name = "nvim_lsp_signature_help", priority = 80 },
          {
            name = "buffer",
            priority = 95,
            option = {
              -- Returns a list of buffer numbers that are currently visible in open windows.
              get_bufnrs = function()
                local bufs = {}
                for _, win in ipairs(vim.api.nvim_list_wins()) do
                  bufs[vim.api.nvim_win_get_buf(win)] = true
                end
                return vim.tbl_keys(bufs)
              end,
            },
          },
          { name = "nvim_lua",        priority = 70 },
          { name = "path",            priority = 60 },
          { name = 'render-markdown', priority = 50 },
          { name = "emoji",           priority = 20 },
        },
      })
    end,
  },
}
