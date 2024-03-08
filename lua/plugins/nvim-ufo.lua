-- return {}
return {
  "kevinhwang91/nvim-ufo",
  -- enabled = false,
  event = "BufReadPost",
  dependencies = { "kevinhwang91/promise-async" },
  -- stylua: ignore
  keys = {
    { "zR", function() require("ufo").openAllFolds() end, desc = "Open all folds" },
    { "zM", function() require("ufo").closeAllFolds() end, desc = "Close all folds" },
    { "zP", function() require("ufo").peekFoldedLinesUnderCursor() end, desc = "Preview fold" },
  },
  config = function ()
    vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
    vim.o.foldcolumn = '1' -- '0' is not bad
    vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true
    }
    local language_servers = require("lspconfig").util.available_servers() -- or list servers manually like {'gopls', 'clangd'}
    for _, ls in ipairs(language_servers) do
      require('lspconfig')[ls].setup({
        capabilities = capabilities
        -- you can add other fields for setting up lsp server in this table
      })
    end
    require('ufo').setup()
  end
  -- opts = {
  --   open_fold_hl_timeout = 0,
  --   enable_get_fold_virt_text = true,
  --   close_fold_kinds = { "imports", "comment" },
  --   preview = {
  --     win_config = {
  --       winblend = 0,
  --       border = "rounded",
  --       winhighlight = "Normal:Folded",
  --     },
  --   },
  --   fold_virt_text_handler = function(virt_text, lnum, end_lnum, width, truncate, ctx)
  --     local result, cur_width = {}, 0
  --     local suffix = (" 󰁂 %d "):format(end_lnum - lnum)
  --     local suffix_width = vim.fn.strdisplaywidth(suffix)
  --     local target_width = width - suffix_width
  --
  --     for _, chunk in ipairs(virt_text) do
  --       local chunk_text = chunk[1]
  --       local chunk_width = vim.fn.strdisplaywidth(chunk_text)
  --       if target_width > cur_width + chunk_width then
  --         table.insert(result, chunk)
  --       else
  --         chunk_text = truncate(chunk_text, target_width - cur_width)
  --         local hl_group = chunk[2]
  --         table.insert(result, { chunk_text, hl_group })
  --         chunk_width = vim.fn.strdisplaywidth(chunk_text)
  --         if cur_width + chunk_width < target_width then
  --           suffix = suffix .. (" "):rep(target_width - cur_width - chunk_width)
  --         end
  --         break
  --       end
  --       cur_width = cur_width + chunk_width
  --     end
  --
  --     local end_text = ctx.get_fold_virt_text(end_lnum)
  --     -- reformat the end text to trim excess whitespace
  --     for _, chunk_text in pairs(end_text) do
  --       chunk_text[1] = chunk_text[1]:gsub("[%s\t]+", "")
  --     end
  --
  --     vim.list_extend(result, { { suffix, "UfoFoldedEllipsis" }, unpack(end_text) })
  --     return result
  --   end,
  --   provider_selector = function()
  --     return { "treesitter", "indent" }
  --   end,
  -- },
}
