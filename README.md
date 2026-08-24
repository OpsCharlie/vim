# nvim

## Dependencies

```bash
sudo apt install curl git gcc inotify-tools \
                 python3-pip python3-venv \
                 ripgrep fd-find luarocks jq rust
```

### python env

```bash
python3 -m venv ~/venv/3.12.3
echo '[ -f ~/venv/3.12.3/bin/activate ] && source ~/venv/3.12.3/bin/activate' >> ~/.bashrc
```

### neovim

```bash
# This is done via the __deploy.sh script
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage
chmod +x nvim-linux-x86_64.appimage
ln -s nvim-linux-x86_64.appimage nvim
```

### nodejs/npm

```bash
# https://github.com/nvm-sh/nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
source ~/.bashrc
nvm install --lts --default
```

### golang

```bash
# install go
sudo apt install golang
# set go bin in path in .bashrc or .zshrc
if [ -d "$HOME/go/bin/" ]; then
    PATH="$HOME/go/bin/:$PATH"
fi

# or install go via snap
sudo snap install go --classic
```

## Mason

In nvim, run `:MasonToolsInstall` and install the following tools:

```ini
ansible-language-server
bash-debug-adapter
bash-language-server
black
codespell
debugpy
delve
djlint
docker-compose-language-service
golangci-lint
gopls
grammarly-languageserver
jq-lsp
json-lsp
lua-language-server
markdownlint
php-debug-adapter
powershell-editor-services (sudo snap install powershell)
prettier
pyright
ruff
shellcheck
shellharden
shfmt
systemd-language-server
systemdlint
```

## Keymaps

| Key          | Mode           | Description                             |
|--------------|----------------|-----------------------------------------|
| `<ESC><ESC>` | n              | Clear search                            |
| `<CR>`       | n              | New line in normal mode                 |
| `<SPACE>`    | n              | Add space in normal mode                |
| `<S-TAB>`    | n              | Previous buffer                         |
| `<TAB>`      | n              | Next buffer                             |
| `<F2>`       | n              | Format logstash config                  |
| `<`          | v              | Indent line                             |
| `>`          | v              | Indent line                             |
| `K`          | n              | Hover Document (LSP)                    |
| `K`          | n,v,ft=ansible | Ansible doc                             |
| `N`          | n              | Center search result                    |
| `dm`         | n              | Delete mark on current line             |
| `gD`         | n              | Goto Declaration LSP                    |
| `gI`         | n              | Goto Implementation LSP                 |
| `gd`         | n              | Goto Definition LSP                     |
| `gr`         | n              | References LSP                          |
| `gy`         | n              | Goto Type Definition LSP                |
| `n`          | n              | Center search result                    |
| `<C-h>`      | n              | Tmux navigate left                      |
| `<C-w>z`     | n              | Toggle Zoom                             |
| `<C-j>`      | n              | Tmux navigate down                      |
| `<C-k>`      | n              | Tmux navigate up                        |
| `<C-l>`      | n              | Tmux navigate right                     |
| `<C-+>`      | n              | Increase Neovide scale                  |
| `<C-->`      | n              | Decrease Neovide scale                  |
| `<C-=>`      | n              | Reset Neovide scale                     |
| `<C-J>`      | i              | Accept copilot suggestion               |
| `<C-t>`      | n              | Tab next                                |
| `<C-S-t>`    | n              | Tab previous                            |
| `<C-S-t>`    | i              | Tab previous                            |
| `<C-S-n>`    | n              | New tab                                 |
| `<C-n>`      | n              | Toggle Snacks Explorer                  |
| `<M-n>`      | n              | Jump to Snacks Explorer                 |
| `<leader>,`  | n              | Find Keymaps                            |
| `<leader>/`  | n              | Grep Current Dir                        |
| `<leader>:`  | n              | Command History                         |
| `<leader>D`  | n              | Toggle Diagnostic Display               |
| `<leader>N`  | n,ft=ansible   | Ansible name all tasks                  |
| `<leader>a`  | n,ft=ansible   | Insert ansible.builtin.                 |
| `<leader>ba` | n              | Bookmark Add                            |
| `<leader>bd` | n              | Buffer Delete (and file if scratch)     |
| `<leader>ca` | n              | Code Action LSP / Ansible lint fix      |
| `<leader>ca` | n,ft=ansible   | Ansible lint fix                        |
| `<leader>cf` | n              | Code Format File LSP                    |
| `<leader>cp` | n,v            | Prompt Actions (CopilotChat)            |
| `<leader>fb` | n              | Find Buffers                            |
| `<leader>fd` | n              | Find Diagnostics Buffer                 |
| `<leader>ff` | n              | Find Files                              |
| `<leader>fg` | n              | Find Git Files                          |
| `<leader>fm` | n              | Find Marks                              |
| `<leader>fs` | n              | Find Symbols LSP                        |
| `<leader>gB` | n,v            | Git Browse Github                       |
| `<leader>gL` | n              | Git Blame Line                          |
| `<leader>gS` | n              | Git Stash                               |
| `<leader>gb` | n              | Git Blame                               |
| `<leader>gd` | n              | LSP Definition                          |
| `<leader>gg` | n              | Git Grep                                |
| `<leader>gl` | n              | Git Log                                 |
| `<leader>gr` | n              | LSP References                          |
| `<leader>gs` | n              | Git Status                              |
| `<leader>lg` | n              | Lazygit                                 |
| `<leader>n`  | n,i,ft=ansible | Ansible name task                       |
| `<leader>r`  | n              | LSP Rename All References               |
| `<leader>sb` | n              | Scratch Buffer                          |
| `<leader>sf` | n              | Find Scratch Buffer                     |
| `<leader>tH` | n              | Toggle Hardtime                         |
| `<leader>tW` | n              | Toggle Words (LSP reference highlights) |
| `<leader>tc` | n              | Toggle Copilot Chat                     |
| `<leader>tn` | n              | Toggle numbers                          |
| `<leader>to` | t              | Toggle Opencode                         |
| `<leader>tt` | n              | Toggle Terminal                         |
