return {
    -- cmp and lsp setup
    {
        "hrsh7th/nvim-cmp",
        lazy = true,
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-nvim-lsp",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
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
                },
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
                    ["<S-Tab>"] = function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        else
                            fallback()
                        end
                    end,
                    ["<Tab>"] = function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        else
                            fallback()
                        end
                    end,
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                },
                -- mapping = cmp.mapping.preset.insert({
                --   ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                --   ["<C-f>"] = cmp.mapping.scroll_docs(4),
                --   ["<C-Space>"] = cmp.mapping.complete(),
                --   ["<C-e>"] = cmp.mapping.abort(),
                --   ["<CR>"] = cmp.mapping.confirm({ select = true }),
                --   ["<TAB>"] = cmp.mapping.select_next_item(),
                -- }),
                --
                sources = {
                    { name = "nvim_lsp" },
                    { name = "luasnip", priority = 10 }, -- For luasnip users.
                    {
                        name = "buffer",
                        option = {
                            get_bufnrs = function()
                                local bufs = {}
                                for _, win in ipairs(vim.api.nvim_list_wins()) do
                                    bufs[vim.api.nvim_win_get_buf(win)] = true
                                end
                                return vim.tbl_keys(bufs)
                            end,
                        },
                    },
                    { name = "nvim_lua" },
                    { name = "path" },
                },
            })
        end,
    },
}
