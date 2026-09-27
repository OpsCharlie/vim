return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    branch = "main",
    version = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.install").compilers = { "gcc", "clang" }

      vim.defer_fn(function()
        require("nvim-treesitter").install(require("config.treesitter").parsers)
      end, 0)

      -- Treesitter indent is no longer a setup() option; per the plugin README
      -- it must be enabled per filetype. get_lang() echoes unknown filetypes
      -- back unchanged, so gate on the parser actually loading. Files over
      -- g.bigfile_size_limit are relabelled filetype=bigfile by snacks, which
      -- has no parser, so they are skipped here.
      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("treesitter_indent", { clear = true }),
        callback = function(args)
          local lang = vim.treesitter.language.get_lang(args.match)
          if not (lang and vim.treesitter.get_parser(args.buf, lang)) then
            return
          end
          vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          vim.b[args.buf].undo_ftplugin = (vim.b[args.buf].undo_ftplugin or "") .. "\nsetlocal indentexpr<"
        end,
      })
    end,
  },
  -- {
  --   "nvim-treesitter/nvim-treesitter-context",
  --   lazy = true,
  --   event = { "BufReadPost", "BufNewFile" },
  --   dependencies = { "nvim-treesitter/nvim-treesitter" },
  --   opts = {
  --     enable = true,
  --     max_lines = 3,
  --     trim_scope = "outer",
  --   },
  -- },
}
