local M = {}

function M.run_commit_message_prompt(extra)
  local args = extra and extra ~= '' and vim.split(extra, ' ') or {}
  require('opencode.api').run_user_command('commit', args)
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
