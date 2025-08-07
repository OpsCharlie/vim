local opt = vim.opt
local g = vim.g

g.mapleader = ","

opt.clipboard = "unnamedplus"
opt.cursorline = true

-- Indenting
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2

opt.listchars = { tab = "» ", extends = "›", precedes = "‹", nbsp = "·", trail = "·" }
opt.list = true
opt.ignorecase = true
opt.smartcase = true
opt.mouse = "a"
opt.autochdir = true
opt.scrolloff = 4

-- Numbers
opt.number = true
opt.relativenumber = true
-- opt.numberwidth = 2
-- opt.ruler = false

-- disable nvim intro
opt.shortmess:append({ s = true, I = true })

opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.timeoutlen = 400

-- interval for writing swap file to disk, also used by gitsigns
opt.updatetime = 250

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append("<>")

-- persistent undo
local home = os.getenv("HOME")
vim.fn.mkdir(home .. "/.vim/backup", "p")
vim.fn.mkdir(home .. "/.vim/swap", "p")
vim.fn.mkdir(home .. "/.vim/undo", "p")

opt.backupdir = home .. "/.vim/backup//"
opt.directory = home .. "/.vim/swap//"
opt.undodir = home .. "/.vim/undo//"
opt.undofile = true
opt.undolevels = 1000
opt.undoreload = 10000

vim.keymap.set("n", "<ESC><ESC>", ":nohlsearch<CR>", { silent = true, desc = "Clear search" })
vim.keymap.set("n", "<CR>", "i<CR><ESC>", { silent = true, desc = "New line in normal mode" })
vim.keymap.set("n", "<SPACE>", "i <ESC>l", { silent = true, desc = "Add space in normal mode" })
vim.keymap.set("v", "<", "<gv", { silent = true, desc = "Indent line" })
vim.keymap.set("v", ">", ">gv", { silent = true, desc = "Indent line" })
vim.keymap.set("n", "<C-t>", ":tabnext<CR>", { silent = true })
vim.keymap.set("n", "<C-S-t>", ":tabprevious<CR>", { silent = true })
vim.keymap.set("i", "<C-t>", "<ESC>:tabnext<CR>i", { silent = true })
vim.keymap.set("i", "<C-S-t>", "<ESC>:tabprevious<CR>i", { silent = true })
vim.keymap.set("n", "<C-S-n>", "<cmd>tabnew<CR>", { desc = "New tab" })
vim.keymap.set("n", "n", "nzz", { desc = "Center search result" })
vim.keymap.set("n", "N", "Nzz", { desc = "Center search result" })
vim.keymap.set("n", "<leader>n", ":exec &nu==&rnu? 'se nu!' : 'se rnu!'<CR>", { desc = "Toggle numbers" })
-- vim.wo.number = true

-- folding
-- opt.foldmethod = "expr"
-- opt.foldexpr = "nvim_treesitter#foldexpr()"
-- opt.foldenable = false
opt.fillchars = { eob = " ", fold = " ", foldopen = "", foldsep = " ", foldclose = "" }
opt.foldcolumn = '1' -- '0' is not bad
opt.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
opt.foldlevelstart = 99
opt.foldenable = true

-- Nvimtree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1


-- Neovide scaling
if vim.g.neovide == true then
  vim.api.nvim_set_keymap("n", "<C-+>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>", { silent = true })
  vim.api.nvim_set_keymap("n", "<C-->", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>", { silent = true })
  vim.api.nvim_set_keymap("n", "<C-=>", ":lua vim.g.neovide_scale_factor = 1<CR>", { silent = true })
--   vim.api.nvim_set_keymap("n", "<C-0>", ":lua vim.g.neovide_scale_factor = 1<CR>", { silent = true })
  -- vim.api.nvim_set_keymap("n", "<C-=>", ":lua vim.g.neovide_scale_factor = math.min(vim.g.neovide_scale_factor + 0.1,  1.0)<CR>", { silent = true })
  -- vim.api.nvim_set_keymap("n", "<C-->", ":lua vim.g.neovide_scale_factor = math.max(vim.g.neovide_scale_factor - 0.1,  0.1)<CR>", { silent = true })
  -- vim.api.nvim_set_keymap("n", "<C-+>", ":lua vim.g.neovide_transparency = math.min(vim.g.neovide_transparency + 0.05, 1.0)<CR>", { silent = true })
  -- vim.api.nvim_set_keymap("n", "<C-_>", ":lua vim.g.neovide_transparency = math.max(vim.g.neovide_transparency - 0.05, 0.0)<CR>", { silent = true })
end

-------------------------------------- autocmds ------------------------------------------
local autocmd = vim.api.nvim_create_autocmd
local function augroup(name)
	return vim.api.nvim_create_augroup(name, { clear = true })
end

-- don't list quickfix buffers
autocmd("FileType", {
	group = augroup('quickfix'),
  pattern = "qf",
  callback = function()
    vim.opt_local.buflisted = false
  end,
})


-- disable swap/undo/backup files in temp directories or shm
autocmd({ 'BufNewFile', 'BufReadPre' }, {
	group = augroup('disable_undo_swap_backup'),
	pattern = { '/tmp/*', '*.tmp', 'COMMIT_EDITMSG', 'MERGE_MSG' },
	callback = function()
		vim.opt_local.undofile = false
		vim.opt_local.swapfile = false
		vim.opt_global.backup = false
		vim.opt_global.writebackup = false
	end,
})

-- disable swap/undo/backup files for large files
autocmd({ "BufReadPre" }, {
  group = augroup('large_file_group'),
  callback = function()
    local max_size = 1024 * 1024 * 100  -- 100 MB in bytes
    local file = vim.fn.expand("<afile>")
    local size = vim.fn.getfsize(file)
    if size > max_size then
      vim.opt_local.swapfile = false
      vim.opt_local.undofile = false
      vim.opt_local.backup = false
      vim.opt_local.writebackup = false
      vim.cmd("syntax off")
      vim.bo.filetype = ""
    end
  end,
})


-- open nvim-tree on startup if no files are opened
autocmd("VimEnter", {
	group = augroup('open_nvim_tree'),
  callback = function()
    if vim.fn.argc() == 0 then
      require('nvim-tree.api').tree.open()
    end
  end,
})

-- set filetype for specific file patterns
autocmd({ "BufRead", "BufNewFile" }, {
  group = augroup('set_filetype'),
  pattern = { "*/ansible/*.yml", "*/ansible/hosts" },
  command = "set filetype=yaml.ansible",
})

autocmd("FileType", {
  group = augroup('yaml_ansible_filetype'),
  pattern = "yaml.ansible",
  callback = function()
    vim.keymap.set("n", "<leader>n", "i%<BS><BS><BS><BS> | <ESC>", { silent = true })
    vim.keymap.set("i", "<leader>n", "%<BS><BS><BS><BS> |", { silent = true })
    vim.keymap.set("n", "<leader>N", ":%s/- name: /- name: %<BS><BS><BS><BS> | /<CR>", { silent = true })
    vim.keymap.set("n", "<leader>a", "wbiansible.builtin.<ESC>", { silent = true })
    vim.opt.colorcolumn = "160"
  end,
})

autocmd("FileType", {
  group = augroup('go_filetype'),
  pattern = "go",
  callback = function()
    vim.opt_local.expandtab = false
    vim.opt_local.tabstop = 4
    vim.opt_local.softtabstop = 4
    vim.opt_local.shiftwidth = 4
  end,
})

autocmd("LspAttach", {
  group = augroup('lsp_attach'),
  callback = function(event)
    vim.diagnostic.config({
    virtual_lines = {
      current_line = true
    },
    virtual_text = false,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
        header = "",
        border = "rounded",
        source = true,
        focusable = true,
    },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "󰅚 ",
            [vim.diagnostic.severity.WARN] = "󰀪 ",
            [vim.diagnostic.severity.INFO] = "󰋽 ",
            [vim.diagnostic.severity.HINT] = "󰌶 ",
        },
    },
})

    vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover Document" })
    vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "LSP Definition" })
    vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "LSP References" })
    vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { desc = "LSP Rename All References" })
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP Code Action" })
    vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, { desc = "LSP Code Format File" })
    vim.keymap.set("n", "<leader>D", function()
      local state = vim.g._diagnostic_toggle_state or 1
      -- 1: virtual lines, 2: float, 3: disabled
      if state == 1 then
        -- Show float for current line
        autocmd( { "CursorHold", "CursorHoldI" }, {
          group = augroup('diagnostic_float'),
          callback = function()
            vim.diagnostic.open_float(nil, { focus = false, scope = "line"})
          end,
          }
        )
        vim.diagnostic.config({ virtual_lines = false})
        vim.g._diagnostic_toggle_state = 2
        vim.o.updatetime = 100
        vim.notify("Diagnostic float enabled", vim.log.levels.INFO, { render = "minimal" })
      elseif state == 2 then
        -- Disable diagnostics
        vim.diagnostic.config({ virtual_lines = false})
        vim.g._diagnostic_toggle_state = 3
        vim.api.nvim_clear_autocmd({ group = 'diagnostic_float'})
        vim.notify("Diagnostic disabled", vim.log.levels.INFO, { render = "minimal" })
      else
        -- Enable virtual lines for current line
        vim.diagnostic.config({ virtual_lines = { current_line = true }})
        vim.g._diagnostic_toggle_state = 1
        vim.notify("Diagnostic Virtual lines", vim.log.levels.INFO, { render = "minimal" })
      end
    end, { desc = "Toggle Diagnostic Display" })

    local function client_supports_method(client, method, bufnr)
      if vim.fn.has 'nvim-0.11' == 1 then
        return client:supports_method(method, bufnr)
      else
        return client.supports_method(method, { bufnr = bufnr })
      end
    end

    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
      local highlight_augroup = vim.api.nvim_create_augroup('lsp-highlight', { clear = false })

      -- When cursor stops moving: Highlights all instances of the symbol under the cursor
      -- When cursor moves: Clears the highlighting
      autocmd({ 'CursorHold', 'CursorHoldI' }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.document_highlight,
      })
      autocmd({ 'CursorMoved', 'CursorMovedI' }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.clear_references,
      })

      -- When LSP detaches: Clears the highlighting
      autocmd('LspDetach', {
        group = augroup('lsp-detach'),
        callback = function(event2)
          vim.lsp.buf.clear_references()
          vim.api.nvim_clear_autocmds { group = 'lsp-highlight', buffer = event2.buf }
        end,
      })
    end
  end,
})


-- Go to last loc when opening a buffer, see ':h last-position-jump'
autocmd('BufReadPost', {
	group = augroup('last_loc'),
	callback = function(event)
		local exclude = { 'gitcommit', 'commit', 'gitrebase' }
		local buf = event.buf
		if
			vim.tbl_contains(exclude, vim.bo[buf].filetype)
			or vim.b[buf].lazyvim_last_loc
		then
			return
		end
		vim.b[buf].lazyvim_last_loc = true
		local mark = vim.api.nvim_buf_get_mark(buf, '"')
		local lcount = vim.api.nvim_buf_line_count(buf)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})
-------------------------------------- user commands ------------------------------------------
local user_command = vim.api.nvim_create_user_command
user_command("PrettyPrintJSON", "%!jq '.'", { desc = "PrettyPrintJSON" })
user_command("PrettyPrintAnsibleJSON", "%!ppjson.py|jq '.'", { desc = "PrettyPrintAnsibleJSON" })
user_command("UnPrettyPrintJSON", "%!jq -c '.'", { desc = "UnPrettyPrintJSON" })
user_command("PrettyPrintHTML", "!tidy -mi -html -wrap 0 %", { desc = "PrettyPrintHTML" })
user_command("PrettyPrintXML", "!tidy -mi -xml -wrap 0 %", { desc = "PrettyPrintXML" })
