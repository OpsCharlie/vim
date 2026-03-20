local M = {}

function M.run_commit_message_prompt(extra)
  local prompt = [[Write a commit message for the current change using Commitizen / Conventional Commits format.

Requirements:
- Keep the title under 50 characters.
- Wrap the body at 72 characters.
- Output as a `gitcommit` fenced code block.
- Copy the plain text version to the clipboard.
- Return only the commit message.]]

  if extra and extra ~= '' then
    prompt = prompt .. '\n\nAdditional context:\n' .. extra
  end

  require('opencode.api').run(prompt, { agent = 'build' })
end

function M.setup_user_commands()
  vim.api.nvim_create_user_command('OpencodeCommitMsg', function(opts)
    M.run_commit_message_prompt(opts.args)
  end, {
    desc = 'Write a commit message with OpenCode',
    nargs = '*',
  })

  vim.api.nvim_create_autocmd("User", {
    pattern = "OpencodeEvent",
    callback = function(args)
      if args.data.type == "session.idle" then
        vim.notify("OpenCode finished responding", vim.log.levels.INFO)
      end
    end,
  })
end

return M
