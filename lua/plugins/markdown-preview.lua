return {
  -- Install markdown preview, use npx if available.
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  ft = { "markdown" },
  build = function(plugin)
    local install_cmd = vim.fn.executable("npx") and "npx --yes yarn install" or "npm install"
    vim.cmd("!cd " .. plugin.dir .. "/app && " .. install_cmd)
  end,
  init = function()
    if vim.fn.executable("npx") then
      vim.g.mkdp_filetypes = { "markdown" }
    end
  end,
}
