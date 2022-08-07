-- vim.cmd [[packadd packer.nvim]]
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  execute 'packadd packer.nvim'
end

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "plugins.lua",
  command = "source <afile> | PackerCompile",
})

require('packer').init({display = {auto_clean = false}})

return require('packer').startup(function(use)

  -- Load lua path
  local lua_path = function(name)
    return string.format("require'plugins.%s'", name)
  end

  -- Packer can manage itself as an optional plugin
  use { 'wbthomason/packer.nvim' }

  -- LSP
  use { 'neovim/nvim-lspconfig' }
  use { 'onsails/lspkind-nvim' }
  use { 'weilbith/nvim-code-action-menu', cmd = 'CodeActionMenu' }

  -- Autocomplete
  use { 'hrsh7th/nvim-cmp' }
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-buffer' }
  use { 'hrsh7th/cmp-path' }
  use { 'hrsh7th/cmp-calc' }
  use { 'hrsh7th/cmp-cmdline' }
  use { 'ray-x/cmp-treesitter' }
  use { 'lukas-reineke/cmp-rg' }
  use { 'windwp/nvim-autopairs', config = lua_path"nvim-autopairs" }
  use { 'andymass/vim-matchup' }
  use { 'SirVer/ultisnips' }
  use { 'quangnguyen30192/cmp-nvim-ultisnips' }
  use { 'pearofducks/ansible-vim', run = './UltiSnips/generate.sh --output yaml.snippets --style dictionary --no-description' }

  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = lua_path"treesitter" }
  use { 'lukas-reineke/indent-blankline.nvim', config = lua_path"indent-blankline" }
  use { 'JoosepAlviste/nvim-ts-context-commentstring' }
  use { 'lewis6991/nvim-treesitter-context' }

  -- Syntax
  use { 'chrisbra/csv.vim' }
  use { 'junegunn/vim-easy-align' }
  use { 'numToStr/Comment.nvim', config = lua_path"comment"}

  -- Icons
  use { 'kyazdani42/nvim-web-devicons' }
  use { 'ryanoasis/vim-devicons' }

  -- Status Line and Bufferline
  use { 'famiu/feline.nvim', config = lua_path"feline" }
  use { 'noib3/nvim-cokeline', config = lua_path"nvim-cokeline" }

  -- Telescope
  use { 'nvim-telescope/telescope.nvim', config = lua_path"telescope" }
  use { 'nvim-telescope/telescope-fzy-native.nvim' }
  use { 'cljoly/telescope-repo.nvim' }

  -- Explorer
  use { 'kyazdani42/nvim-tree.lua', config = lua_path"nvimtree" }

  -- Color
  use { 'crivotz/nvim-colorizer.lua', config = lua_path"colorizer" }
  use { 'junegunn/limelight.vim' }

  -- Git
  use { 'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'}, config = lua_path"gitsigns" }
  use { 'kdheepak/lazygit.nvim' }

  -- Move & Search & replace
  use { 'nacro90/numb.nvim', config = lua_path"numb" }
  use { 'dyng/ctrlsf.vim', config = lua_path"ctrlsf" }
  use { 'kevinhwang91/nvim-hlslens', config = lua_path"hlslens" }
  use { 'fedepujol/move.nvim' }

  -- Tim Pope docet
  use { 'tpope/vim-endwise' }
  use { 'tpope/vim-jdaddy' }
  use { 'tpope/vim-fugitive' }

  -- Folke
  use { 'folke/trouble.nvim' }
  use { 'folke/which-key.nvim', config = lua_path"which-key" }

  -- Tmux
  use { 'christoomey/vim-tmux-navigator' }

  -- Colorschema
  use { 'rafi/awesome-vim-colorschemes' }
  use { 'stevearc/dressing.nvim', config = lua_path"dressing" }

  -- General Plugins
  use { 'rcarriga/nvim-notify', config = lua_path"nvim-notify" }
  use { 'airblade/vim-rooter', config = lua_path"vim-rooter" }
  use { 'goolord/alpha-nvim', config = lua_path"alpha-nvim" }
  use { 'lambdalisue/suda.vim' }
  use { 'numtostr/FTerm.nvim', config = lua_path"fterm" }
  use { 'fgheng/winbar.nvim' }
  use { 'beauwilliams/focus.nvim', config = lua_path"focus" }
  use { 'kevinhwang91/nvim-bqf' }
  use { 'dhruvasagar/vim-table-mode' }
  use { "iamcco/markdown-preview.nvim", run = function() vim.fn["mkdp#util#install"]() end, }
end)
