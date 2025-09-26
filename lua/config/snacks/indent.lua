return {
  indent = {
    enabled = true,
    char = "¦",
    animate = { enabled = false },
  },
  animate = {
    enabled = vim.fn.has("nvim-0.10") == 1,
    style = "out",
    easing = "linear",
    duration = {
      step = 20,   -- ms per step
      total = 100, -- maximum duration
    },
  },
  scope = { enabled = true },
  chunk = {
    enabled = true,
    char = {
      -- corner_top = "┌",
      -- corner_bottom = "└",
      corner_top = "╭",
      corner_bottom = "╰",
      horizontal = "─",
      vertical = "│",
      arrow = "─",
    },
  },
}
