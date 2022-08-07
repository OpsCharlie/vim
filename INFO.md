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

