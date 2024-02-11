return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.5",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
    {
      "benfowler/telescope-luasnip.nvim",
      module = "telescope._extensions.luasnip",
    },
  },
  lazy = true,
  cmd = "Telescope",
  keys = {
    { "<leader>fg", mode = "n", desc = "Find grep" },
    { "<leader>fG", mode = "n", desc = "Find Git grep" },
    { "<leader>fb", mode = "n", desc = "Find buffers" },
    { "<C-p>", mode = "n", desc = "Find Git files" },
  },
  config = function()
    require("telescope").setup({
      require("telescope").load_extension("luasnip"),
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown({}),
        },
      },
    })
    local builtin = require("telescope.builtin")
    local function find_git_root()
      -- Use the current buffer's path as the starting point for the git search
      local current_file = vim.api.nvim_buf_get_name(0)
      local current_dir
      local cwd = vim.fn.getcwd()
      -- If the buffer is not associated with a file, return nil
      if current_file == "" then
        current_dir = cwd
      else
        -- Extract the directory from the current file's path
        current_dir = vim.fn.fnamemodify(current_file, ":h")
      end

      -- Find the Git root directory from the current file's path
      local git_root =
        vim.fn.systemlist("git -C " .. vim.fn.escape(current_dir, " ") .. " rev-parse --show-toplevel")[1]
      if vim.v.shell_error ~= 0 then
        print("Not a git repository. Searching on current working directory")
        return cwd
      end
      return git_root
    end

    -- Custom live_grep function to search in git root
    local function live_grep_git_root()
      local git_root = find_git_root()
      if git_root then
        builtin.live_grep({
          search_dirs = { git_root },
        })
      end
    end

    vim.api.nvim_create_user_command("LiveGrepGitRoot", live_grep_git_root, {})

    -- vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "Find files" })
    vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Find git files" })
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Find Grep" })
    vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
    vim.keymap.set("n", "<leader>fG", ":LiveGrepGitRoot<cr>", { desc = "Find git grep" })

    require("telescope").load_extension("ui-select")
  end,
}
