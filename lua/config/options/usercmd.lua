-------------------------------------- user commands ------------------------------------------
local user_command = vim.api.nvim_create_user_command

user_command("PrettyPrintJSON", "%!jq '.'", { desc = "PrettyPrintJSON" })
user_command("PrettyPrintAnsibleJSON", "%!ppjson.py|jq '.'", { desc = "PrettyPrintAnsibleJSON" })
user_command("UnPrettyPrintJSON", "%!jq -c '.'", { desc = "UnPrettyPrintJSON" })
user_command("PrettyPrintHTML", function()
  vim.cmd("!tidy -mi -html -wrap 0 %")
  vim.cmd("edit!")
end, { desc = "PrettyPrintHTML" })
user_command("PrettyPrintXML", function()
  vim.cmd("!tidy -mi -xml -wrap 0 %")
  vim.cmd("edit!")
end, { desc = "PrettyPrintXML" })
user_command("SudoWrite", ":SudaWrite", { desc = "SudoWrite" })
user_command("LazyGit", function() Snacks.lazygit() end, { desc = "LazyGit" })
