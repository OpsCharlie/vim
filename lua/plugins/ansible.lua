return {
  "pearofducks/ansible-vim",
  -- Syntax plugin for Ansible 2.x, it supports YAML playbooks, Jinja2 templates, and Ansible's hosts files.
  lazy = true,
  ft = "yaml.ansible",
  config = function()
    vim.g.ansible_unindent_after_newline = 1
  end,
}
