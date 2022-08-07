<pre>
  <p align="center" style="line-height:100%">
  ███╗   ██╗██╗   ██╗      ██╗██████╗ ███████╗
  ████╗  ██║██║   ██║      ██║██╔══██╗██╔════╝
  ██╔██╗ ██║██║   ██║█████╗██║██║  ██║█████╗  
  ██║╚██╗██║╚██╗ ██╔╝╚════╝██║██║  ██║██╔══╝  
  ██║ ╚████║ ╚████╔╝       ██║██████╔╝███████╗
  ╚═╝  ╚═══╝  ╚═══╝        ╚═╝╚═════╝ ╚══════╝
  </p>
</pre>

[Neovim](https://neovim.io/) LUA configuration, oriented for ansible developers.  
I use this repository mainly to keep track of the changes that I made on my Neovim configuration, but I hope that it will be useful to others.  
The project is constantly changing.  


This is inspired from [Crivotz](https://github.com/crivotz/nv-ide) configuration.  

---

**SYNTAX**

Check [tree-sitter](https://github.com/tree-sitter/tree-sitter) for full list.  

**INSTALLATION**
```console
git clone git@github.com:OpsCharlie/vim.git
git checkout nv-ide
./__deploy.sh
nvim
:PackerInstall
:PackerSync
```
**UPDATE**
```console
nvim
:PackerUpdate
:PackerSync
```
**DEPENDENCIES**

* Neovim
* [FZF](https://github.com/junegunn/fzf)
* [ripgrep](https://github.com/BurntSushi/ripgrep): ripgrep recursively searches directories for a regex pattern  
* Needed LSP, show `lua/lsp/init.lua`
* Terminal that supports ligatures for proper representation


**PLUGINS**  

* [wbthomason/packer.nvim](https://github.com/wbthomason/packer.nvim): A use-package inspired plugin manager for Neovim. Uses native packages, supports Luarocks dependencies, written in Lua, allows for expressive config  
* [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig): Quickstart configs for Nvim LSP  
* [onsails/lspkind-nvim](https://github.com/onsails/lspkind-nvim): vscode-like pictograms for neovim lsp completion items  
* [weilbith/nvim-code-action-menu](https://github.com/weilbith/nvim-code-action-menu): Pop-up menu for code actions to show meta-information and diff preview  
* [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp): A completion plugin for neovim coded in Lua.  
* [hrsh7th/cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp): nvim-cmp source for neovim builtin LSP client  
* [hrsh7th/cmp-buffer](https://github.com/hrsh7th/cmp-buffer): nvim-cmp source for buffer words  
* [hrsh7th/cmp-path](https://github.com/hrsh7th/cmp-path): nvim-cmp source for path  
* [hrsh7th/cmp-calc](https://github.com/hrsh7th/cmp-calc): nvim-cmp source for math calculation  
* [hrsh7th/cmp-cmdline](https://github.com/hrsh7th/cmp-cmdline): nvim-cmp source for vim's cmdline  
* [ray-x/cmp-treesitter](https://github.com/ray-x/cmp-treesitter): cmp source for treesitter  
* [lukas-reineke/cmp-rg](https://github.com/lukas-reineke/cmp-rg): ripgrep source for nvim-cmp  
* [windwp/nvim-autopairs](https://github.com/windwp/nvim-autopairs): autopairs for neovim written by lua  
* [andymass/vim-matchup](https://github.com/andymass/vim-matchup): vim match-up: even better % 👊 navigate and highlight matching words 👊 modern matchit and matchparen  
* [SirVer/ultisnips](https://github.com/SirVer/ultisnips): UltiSnips - The ultimate snippet solution for Vim. Send pull requests to SirVer/ultisnips!  
* [quangnguyen30192/cmp-nvim-ultisnips](https://github.com/quangnguyen30192/cmp-nvim-ultisnips): nvim-cmp source for ultisnips  
* [pearofducks/ansible-vim](https://github.com/pearofducks/ansible-vim): A vim plugin for syntax highlighting Ansible's common filetypes  
* [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter): Nvim Treesitter configurations and abstraction layer  
* [lukas-reineke/indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim): Indent guides for Neovim  
* [JoosepAlviste/nvim-ts-context-commentstring](https://github.com/JoosepAlviste/nvim-ts-context-commentstring): Neovim treesitter plugin for setting the commentstring based on the cursor location in a file.  
* [lewis6991/nvim-treesitter-context](https://github.com/lewis6991/nvim-treesitter-context): Show code context  
* [chrisbra/csv.vim](https://github.com/chrisbra/csv.vim): A Filetype plugin for csv files  
* [junegunn/vim-easy-align](https://github.com/junegunn/vim-easy-align): 🌻 A Vim alignment plugin  
* [numToStr/Comment.nvim](https://github.com/numToStr/Comment.nvim): 🧠 💪 // Smart and powerful comment plugin for neovim. Supports treesitter, dot repeat, left-right/up-down motions, hooks, and more  
* [kyazdani42/nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons): lua `fork` of vim-web-devicons for neovim  
* [ryanoasis/vim-devicons](https://github.com/ryanoasis/vim-devicons): Adds file type icons to Vim plugins such as: NERDTree, vim-airline, CtrlP, unite, Denite, lightline, vim-startify and many more  
* [famiu/feline.nvim](https://github.com/famiu/feline.nvim): A minimal, stylish and customizable statusline for Neovim written in Lua  
* [noib3/nvim-cokeline](https://github.com/noib3/nvim-cokeline): 👃 A Neovim bufferline for people with addictive personalities  
* [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim): Find, Filter, Preview, Pick. All lua, all the time.  
* [nvim-telescope/telescope-fzy-native.nvim](https://github.com/nvim-telescope/telescope-fzy-native.nvim): FZY style sorter that is compiled  
* [cljoly/telescope-repo.nvim](https://github.com/cljoly/telescope-repo.nvim): 🦘 Jump into the repositories (git, mercurial…) of your filesystem with telescope.nvim, without any setup  
* [kyazdani42/nvim-tree.lua](https://github.com/kyazdani42/nvim-tree.lua): A file explorer tree for neovim written in lua  
* [crivotz/nvim-colorizer.lua](https://github.com/crivotz/nvim-colorizer.lua): The fastest Neovim colorizer.  
* [junegunn/limelight.vim](https://github.com/junegunn/limelight.vim): 🔦 All the world's indeed a stage and we are merely players  
* [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim): Git integration for buffers  
* [kdheepak/lazygit.nvim](https://github.com/kdheepak/lazygit.nvim): Plugin for calling lazygit from within neovim.  
* [nacro90/numb.nvim](https://github.com/nacro90/numb.nvim): Peek lines just when you intend  
* [dyng/ctrlsf.vim](https://github.com/dyng/ctrlsf.vim): A text searching plugin mimics Ctrl-Shift-F on Sublime Text 2  
* [kevinhwang91/nvim-hlslens](https://github.com/kevinhwang91/nvim-hlslens): Hlsearch Lens for Neovim  
* [fedepujol/move.nvim](https://github.com/fedepujol/move.nvim): Gain the power to move lines and blocks and auto-indent them!  
* [tpope/vim-endwise](https://github.com/tpope/vim-endwise): endwise.vim: Wisely add  
* [tpope/vim-jdaddy](https://github.com/tpope/vim-jdaddy): jdaddy.vim: JSON manipulation and pretty printing  
* [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive): fugitive.vim: A Git wrapper so awesome, it should be illegal  
* [folke/trouble.nvim](https://github.com/folke/trouble.nvim): 🚦 A pretty diagnostics, references, telescope results, quickfix and location list to help you solve all the trouble your code is causing.  
* [folke/which-key.nvim](https://github.com/folke/which-key.nvim): 💥 Create key bindings that stick. WhichKey is a lua plugin for Neovim 0.5 that displays a popup with possible keybindings of the command you started typing.  
* [christoomey/vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator): Seamless navigation between tmux panes and vim splits  
* [rafi/awesome-vim-colorschemes](https://github.com/rafi/awesome-vim-colorschemes): Collection of awesome color schemes for Neo/vim, merged for quick use.  
* [stevearc/dressing.nvim](https://github.com/stevearc/dressing.nvim): Neovim plugin to improve the default vim.ui interfaces  
* [rcarriga/nvim-notify](https://github.com/rcarriga/nvim-notify): A fancy, configurable, notification manager for NeoVim  
* [airblade/vim-rooter](https://github.com/airblade/vim-rooter): Changes Vim working directory to project root.  
* [goolord/alpha-nvim](https://github.com/goolord/alpha-nvim): a lua powered greeter like vim-startify / dashboard-nvim  
* [lambdalisue/suda.vim](https://github.com/lambdalisue/suda.vim): 🥪 An alternative sudo.vim for Vim and Neovim, limited support sudo in Windows  
* [numtostr/FTerm.nvim](https://github.com/numtostr/FTerm.nvim): 🔥 No-nonsense floating terminal plugin for neovim 🔥  
* [fgheng/winbar.nvim](https://github.com/fgheng/winbar.nvim): winbar config for neovim  
* [beauwilliams/focus.nvim](https://github.com/beauwilliams/focus.nvim): Auto-Focusing and Auto-Resizing Splits/Windows for Neovim written in Lua. A full suite of window management enhancements. Vim splits on steroids!  
* [kevinhwang91/nvim-bqf](https://github.com/kevinhwang91/nvim-bqf): Better quickfix window in Neovim, polish old quickfix window.  
* [dhruvasagar/vim-table-mode](https://github.com/dhruvasagar/vim-table-mode): VIM Table Mode for instant table creation.  
