return {
  "echanovski/mini.surround",
  -- Fast and feature-rich surrounding.
  version = '*',
  lazy = true,
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    mappings = {
      add = "<leader>sa",
      delete = "<leader>sd",
      find = "<leader>sf",
      find_left = "<leader>sF",
      highlight = "<leader>sh",
      replace = "<leader>sr",
      update_n_lines = "<leader>sn",
    },
    search_method = "cover",
    n_lines = 20,
    highlight_duration = 2000,
  },
}
