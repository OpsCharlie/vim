-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/carl/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/carl/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/carl/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/carl/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/carl/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { "require'plugins.comment'" },
    loaded = true,
    path = "/home/carl/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  ["FTerm.nvim"] = {
    config = { "require'plugins.fterm'" },
    loaded = true,
    path = "/home/carl/.local/share/nvim/site/pack/packer/start/FTerm.nvim",
    url = "https://github.com/numtostr/FTerm.nvim"
  },
  ["alpha-nvim"] = {
    config = { "require'plugins.alpha-nvim'" },
    loaded = true,
    path = "/home/carl/.local/share/nvim/site/pack/packer/start/alpha-nvim",
    url = "https://github.com/goolord/alpha-nvim"
  },
  ["ansible-vim"] = {
    loaded = true,
    path = "/home/carl/.local/share/nvim/site/pack/packer/start/ansible-vim",
    url = "https://github.com/pearofducks/ansible-vim"
  },
  ["awesome-vim-colorschemes"] = {
    loaded = true,
    path = "/home/carl/.local/share/nvim/site/pack/packer/start/awesome-vim-colorschemes",
    url = "https://github.com/rafi/awesome-vim-colorschemes"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/carl/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-calc"] = {
    loaded = true,
    path = "/home/carl/.local/share/nvim/site/pack/packer/start/cmp-calc",
    url = "https://github.com/hrsh7th/cmp-calc"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/home/carl/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/carl/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-ultisnips"] = {
    loaded = true,
    path = "/home/carl/.local/share/nvim/site/pack/packer/start/cmp-nvim-ultisnips",
    url = "https://github.com/quangnguyen30192/cmp-nvim-ultisnips"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/carl/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-rg"] = {
    loaded = true,
    path = "/home/carl/.local/share/nvim/site/pack/packer/start/cmp-rg",
    url = "https://github.com/lukas-reineke/cmp-rg"
  },
  ["cmp-treesitter"] = {
    loaded = true,
    path = "/home/carl/.local/share/nvim/site/pack/packer/start/cmp-treesitter",
    url = "https://github.com/ray-x/cmp-treesitter"
  },
  ["csv.vim"] = {
    loaded = true,
    path = "/home/carl/.local/share/nvim/site/pack/packer/start/csv.vim",
    url = "https://github.com/chrisbra/csv.vim"
  },
  ["ctrlsf.vim"] = {
    config = { "require'plugins.ctrlsf'" },
    loaded = true,
    path = "/home/carl/.local/share/nvim/site/pack/packer/start/ctrlsf.vim",
    url = "https://github.com/dyng/ctrlsf.vim"
  },
  ["dressing.nvim"] = {
    config = { "require'plugins.dressing'" },
    loaded = true,
    path = "/home/carl/.local/share/nvim/site/pack/packer/start/dressing.nvim",
    url = "https://github.com/stevearc/dressing.nvim"
  },
  ["feline.nvim"] = {
    config = { "require'plugins.feline'" },
    loaded = true,
    path = "/home/carl/.local/share/nvim/site/pack/packer/start/feline.nvim",
    url = "https://github.com/famiu/feline.nvim"
  },
  ["focus.nvim"] = {
    config = { "require'plugins.focus'" },
    loaded = true,
    path = "/home/carl/.local/share/nvim/site/pack/packer/start/focus.nvim",
    url = "https://github.com/beauwilliams/focus.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "require'plugins.gitsigns'" },
    loaded = true,
    path = "/home/carl/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "require'plugins.indent-blankline'" },
    loaded = true,
    path = "/home/carl/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lazygit.nvim"] = {
    loaded = true,
    path = "/home/carl/.local/share/nvim/site/pack/packer/start/lazygit.nvim",
    url = "https://github.com/kdheepak/lazygit.nvim"
  },
  ["limelight.vim"] = {
    loaded = true,
    path = "/home/carl/.local/share/nvim/site/pack/packer/start/limelight.vim",
    url = "https://github.com/junegunn/limelight.vim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/home/carl/.local/share/nvim/site/pack/packer/start/lspkind-nvim",
    url = "https://github.com/onsails/lspkind-nvim"
  },
  ["markdown-preview.nvim"] = {
    loaded = true,
    path = "/home/carl/.local/share/nvim/site/pack/packer/start/markdown-preview.nvim",
    url = "https://github.com/iamcco/markdown-preview.nvim"
  },
  ["move.nvim"] = {
    loaded = true,
    path = "/home/carl/.local/share/nvim/site/pack/packer/start/move.nvim",
    url = "https://github.com/fedepujol/move.nvim"
  },
  ["numb.nvim"] = {
    config = { "require'plugins.numb'" },
    loaded = true,
    path = "/home/carl/.local/share/nvim/site/pack/packer/start/numb.nvim",
    url = "https://github.com/nacro90/numb.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "require'plugins.nvim-autopairs'" },
    loaded = true,
    path = "/home/carl/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-bqf"] = {
    loaded = true,
    path = "/home/carl/.local/share/nvim/site/pack/packer/start/nvim-bqf",
    url = "https://github.com/kevinhwang91/nvim-bqf"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/carl/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-code-action-menu"] = {
    commands = { "CodeActionMenu" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/carl/.local/share/nvim/site/pack/packer/opt/nvim-code-action-menu",
    url = "https://github.com/weilbith/nvim-code-action-menu"
  },
  ["nvim-cokeline"] = {
    config = { "require'plugins.nvim-cokeline'" },
    loaded = true,
    path = "/home/carl/.local/share/nvim/site/pack/packer/start/nvim-cokeline",
    url = "https://github.com/noib3/nvim-cokeline"
  },
  ["nvim-colorizer.lua"] = {
    config = { "require'plugins.colorizer'" },
    loaded = true,
    path = "/home/carl/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/crivotz/nvim-colorizer.lua"
  },
  ["nvim-hlslens"] = {
    config = { "require'plugins.hlslens'" },
    loaded = true,
    path = "/home/carl/.local/share/nvim/site/pack/packer/start/nvim-hlslens",
    url = "https://github.com/kevinhwang91/nvim-hlslens"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/carl/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-notify"] = {
    config = { "require'plugins.nvim-notify'" },
    loaded = true,
    path = "/home/carl/.local/share/nvim/site/pack/packer/start/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-tree.lua"] = {
    config = { "require'plugins.nvimtree'" },
    loaded = true,
    path = "/home/carl/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "require'plugins.treesitter'" },
    loaded = true,
    path = "/home/carl/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-context"] = {
    loaded = true,
    path = "/home/carl/.local/share/nvim/site/pack/packer/start/nvim-treesitter-context",
    url = "https://github.com/lewis6991/nvim-treesitter-context"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = true,
    path = "/home/carl/.local/share/nvim/site/pack/packer/start/nvim-ts-context-commentstring",
    url = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/carl/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/carl/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/carl/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["suda.vim"] = {
    loaded = true,
    path = "/home/carl/.local/share/nvim/site/pack/packer/start/suda.vim",
    url = "https://github.com/lambdalisue/suda.vim"
  },
  ["telescope-fzy-native.nvim"] = {
    loaded = true,
    path = "/home/carl/.local/share/nvim/site/pack/packer/start/telescope-fzy-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzy-native.nvim"
  },
  ["telescope-repo.nvim"] = {
    loaded = true,
    path = "/home/carl/.local/share/nvim/site/pack/packer/start/telescope-repo.nvim",
    url = "https://github.com/cljoly/telescope-repo.nvim"
  },
  ["telescope.nvim"] = {
    config = { "require'plugins.telescope'" },
    loaded = true,
    path = "/home/carl/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["trouble.nvim"] = {
    loaded = true,
    path = "/home/carl/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ultisnips = {
    loaded = true,
    path = "/home/carl/.local/share/nvim/site/pack/packer/start/ultisnips",
    url = "https://github.com/SirVer/ultisnips"
  },
  ["vim-devicons"] = {
    loaded = true,
    path = "/home/carl/.local/share/nvim/site/pack/packer/start/vim-devicons",
    url = "https://github.com/ryanoasis/vim-devicons"
  },
  ["vim-easy-align"] = {
    loaded = true,
    path = "/home/carl/.local/share/nvim/site/pack/packer/start/vim-easy-align",
    url = "https://github.com/junegunn/vim-easy-align"
  },
  ["vim-endwise"] = {
    loaded = true,
    path = "/home/carl/.local/share/nvim/site/pack/packer/start/vim-endwise",
    url = "https://github.com/tpope/vim-endwise"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/carl/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-jdaddy"] = {
    loaded = true,
    path = "/home/carl/.local/share/nvim/site/pack/packer/start/vim-jdaddy",
    url = "https://github.com/tpope/vim-jdaddy"
  },
  ["vim-matchup"] = {
    loaded = true,
    path = "/home/carl/.local/share/nvim/site/pack/packer/start/vim-matchup",
    url = "https://github.com/andymass/vim-matchup"
  },
  ["vim-rooter"] = {
    config = { "require'plugins.vim-rooter'" },
    loaded = true,
    path = "/home/carl/.local/share/nvim/site/pack/packer/start/vim-rooter",
    url = "https://github.com/airblade/vim-rooter"
  },
  ["vim-table-mode"] = {
    loaded = true,
    path = "/home/carl/.local/share/nvim/site/pack/packer/start/vim-table-mode",
    url = "https://github.com/dhruvasagar/vim-table-mode"
  },
  ["vim-tmux-navigator"] = {
    loaded = true,
    path = "/home/carl/.local/share/nvim/site/pack/packer/start/vim-tmux-navigator",
    url = "https://github.com/christoomey/vim-tmux-navigator"
  },
  ["which-key.nvim"] = {
    config = { "require'plugins.which-key'" },
    loaded = true,
    path = "/home/carl/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  },
  ["winbar.nvim"] = {
    loaded = true,
    path = "/home/carl/.local/share/nvim/site/pack/packer/start/winbar.nvim",
    url = "https://github.com/fgheng/winbar.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: focus.nvim
time([[Config for focus.nvim]], true)
require'plugins.focus'
time([[Config for focus.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
require'plugins.gitsigns'
time([[Config for gitsigns.nvim]], false)
-- Config for: nvim-cokeline
time([[Config for nvim-cokeline]], true)
require'plugins.nvim-cokeline'
time([[Config for nvim-cokeline]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
require'plugins.colorizer'
time([[Config for nvim-colorizer.lua]], false)
-- Config for: nvim-hlslens
time([[Config for nvim-hlslens]], true)
require'plugins.hlslens'
time([[Config for nvim-hlslens]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
require'plugins.comment'
time([[Config for Comment.nvim]], false)
-- Config for: FTerm.nvim
time([[Config for FTerm.nvim]], true)
require'plugins.fterm'
time([[Config for FTerm.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
require'plugins.telescope'
time([[Config for telescope.nvim]], false)
-- Config for: alpha-nvim
time([[Config for alpha-nvim]], true)
require'plugins.alpha-nvim'
time([[Config for alpha-nvim]], false)
-- Config for: nvim-notify
time([[Config for nvim-notify]], true)
require'plugins.nvim-notify'
time([[Config for nvim-notify]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
require'plugins.which-key'
time([[Config for which-key.nvim]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
require'plugins.indent-blankline'
time([[Config for indent-blankline.nvim]], false)
-- Config for: ctrlsf.vim
time([[Config for ctrlsf.vim]], true)
require'plugins.ctrlsf'
time([[Config for ctrlsf.vim]], false)
-- Config for: numb.nvim
time([[Config for numb.nvim]], true)
require'plugins.numb'
time([[Config for numb.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
require'plugins.nvimtree'
time([[Config for nvim-tree.lua]], false)
-- Config for: dressing.nvim
time([[Config for dressing.nvim]], true)
require'plugins.dressing'
time([[Config for dressing.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
require'plugins.nvim-autopairs'
time([[Config for nvim-autopairs]], false)
-- Config for: vim-rooter
time([[Config for vim-rooter]], true)
require'plugins.vim-rooter'
time([[Config for vim-rooter]], false)
-- Config for: feline.nvim
time([[Config for feline.nvim]], true)
require'plugins.feline'
time([[Config for feline.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
require'plugins.treesitter'
time([[Config for nvim-treesitter]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file CodeActionMenu lua require("packer.load")({'nvim-code-action-menu'}, { cmd = "CodeActionMenu", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
