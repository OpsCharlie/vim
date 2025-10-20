-------------------------------------- user commands ------------------------------------------
local user_command = vim.api.nvim_create_user_command

user_command("PrettyPrintJSON", "%!jq '.'", { desc = "PrettyPrintJSON" })
user_command("PrettyPrintAnsibleJSON", "%!ppjson.py|jq '.'", { desc = "PrettyPrintAnsibleJSON" })
user_command("UnPrettyPrintJSON", "%!jq -c '.'", { desc = "UnPrettyPrintJSON" })
user_command("PrettyPrintHTML", "!tidy -mi -html -wrap 0 %", { desc = "PrettyPrintHTML" })
user_command("PrettyPrintXML", "!tidy -mi -xml -wrap 0 %", { desc = "PrettyPrintXML" })
user_command("SudoWrite", ":SudaWrite", { desc = "SudoWrite" })
user_command("LazyGit", ":Snacks.lazygit()", { desc = "LazyGit" })
