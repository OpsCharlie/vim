-------------------------------------- vim options ------------------------------------------
local opt = vim.opt
local g = vim.g

g.mapleader = ","

opt.clipboard = "unnamedplus"
opt.cursorline = true

-- Indenting
opt.expandtab = true
opt.shiftround = true -- Round indent
opt.shiftwidth = 2
opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
opt.smartindent = false -- use treesitter for indenting
opt.tabstop = 2
opt.softtabstop = 2

opt.listchars = { tab = " »", extends = "›", precedes = "‹", nbsp = "·", trail = "·" }
opt.list = true
opt.ignorecase = true
opt.smartcase = true
opt.mouse = "a"
opt.smoothscroll = true
opt.scrolloff = 4

opt.virtualedit = "block" -- Allow cursor to move where there is no text in visual block mode
opt.wildmode = "longest:full,full" -- Command-line completion mode
opt.pumblend = 10 -- Popup blend
opt.pumheight = 10 -- Maximum number of entries in a popup

-- Numbers
opt.number = true
opt.relativenumber = true
-- opt.numberwidth = 2
-- opt.ruler = false

-- disable nvim intro
opt.shortmess:append({ s = true, I = true })

opt.splitbelow = true -- Put new windows below current
opt.splitkeep = "screen"
opt.splitright = true -- Put new windows right of current
opt.termguicolors = true
opt.timeout = true
opt.timeoutlen = 300

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

-- Session options for persistence
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp" }

-- Create scratch directory for unnamed buffers
vim.fn.mkdir(home .. "/.vim/scratch", "p")

-- Set max size before bigfiles options are applied in B
g.bigfile_size_limit = 1024 * 1024 * 10

-- Fall back to OSC 52 clipboard for the + and * registers when no functional
-- native clipboard tool is found. Requires Neovim 0.10+ and a terminal that
-- supports OSC 52 (WezTerm, iTerm2, Kitty, Ghostty, etc.).
-- We check not only whether clipboard tools are installed, but also whether
-- their display server is available ($DISPLAY for X11, $WAYLAND_DISPLAY for
-- Wayland). This ensures that tools like xclip or wl-copy on a headless server
-- or in an SSH session without display forwarding correctly fall through to
-- OSC 52. Fixes clipboard issues when running Neovim on a remote server from a
-- local tmux session.
local has_osc52, osc52 = pcall(require, 'vim.ui.clipboard.osc52')
local has_native_clipboard = (vim.fn.executable('pbcopy') == 1)
    or (vim.fn.executable('xclip') == 1 and vim.env.DISPLAY)
    or (vim.fn.executable('xsel') == 1 and vim.env.DISPLAY)
    or (vim.fn.executable('wl-copy') == 1 and vim.env.WAYLAND_DISPLAY)
if has_osc52 and not has_native_clipboard then
  vim.g.clipboard = {
    name = 'OSC 52',
    copy = {
      ['+'] = osc52.copy('+'),
      ['*'] = osc52.copy('*'),
    },
    paste = {
      ['+'] = osc52.paste('+'),
      ['*'] = osc52.paste('*'),
    },
  }
end
