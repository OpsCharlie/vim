return {
  "robbles/logstash.vim",
  config = function ()
    vim.opt.tabstop = 4
    vim.opt.shiftwidth = 4
    vim.keymap.set("n", "<F2>",  ":%s/^\\s*<CR>:g/{/+ normal >G<CR>:g/}/normal <G<CR>:g/{.*}/:><CR>:g/\\[/+ normal >G<CR>:g/\\]/normal <G<CR>:g/\\[.*\\]/:><CR>")

  end
}
