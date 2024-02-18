return {
  "pearofducks/ansible-vim",
  lazy = true,
  ft = "yaml.ansible",
  config = function ()
    vim.g.ansible_unindent_after_newline = 1
  end
}
