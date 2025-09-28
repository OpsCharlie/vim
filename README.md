# nvim

## Dependencies

```bash
sudo apt install curl git gcc inotify-tools \
                 python3-pip python3-venv \
                 ripgrep fd-find luarocks jq
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

| Key          | Mode           | Description                 |
|--------------|----------------|-----------------------------|
| `<ESC><ESC>` | n              | Clear search                |
| `<CR>`       | n              | New line in normal mode     |
| `<SPACE>`    | n              | Add space in normal mode    |
| `<`          | v              | Indent line                 |
| `>`          | v              | Indent line                 |
| `<C-t>`      | n              | Tab next                    |
| `<C-S-t>`    | n              | Tab previous                |
| `<C-S-t>`    | i              | Tab previous                |
| `<C-S-n>`    | n              | New tab                     |
| `n`          | n              | Center search result        |
| `N`          | n              | Center search result        |
| `<leader>tn` | n              | Toggle numbers              |
| `<leader>tH` | n              | Hardtime toggle             |
| `dm`         | n              | Delete mark on current line |
| `K`          | n              | Hover Document (LSP)        |
| `<leader>gd` | n              | LSP Definition              |
| `<leader>gr` | n              | LSP References              |
| `<leader>r`  | n              | LSP Rename All References   |
| `<leader>ca` | n              | Action LSP                  |
| `<leader>cf` | n              | Format File LSP             |
| `<leader>D`  | n              | Diagnostic Display Toggle   |
| `<leader>tt` | n              | Toggle Terminal             |
| `<C-n>`      | n              | Toggle Snacks Explorer      |
| `<M-n>`      | n              | Jump to Snacks Explorer     |
| `<leader>:`  | n              | Command History             |
| `<leader>bd` | n              | Delete Buffer               |
| `<leader>fb` | n              | Find Buffers                |
| `<leader>ff` | n              | Find Files                  |
| `<leader>fg` | n              | Find Git Files              |
| `<leader>fm` | n              | Find Marks                  |
| `<leader>/`  | n              | Grep Current Dir            |
| `<leader>gf` | n              | Grep Current Dir            |
| `<leader>,`  | n              | Find Keymaps                |
| `<leader>fs` | n              | Find Symbols LSP            |
| `<leader>gB` | n,v            | Git Browse Github           |
| `<leader>lg` | n              | Lazygit                     |
| `<leader>gl` | n              | Git Log                     |
| `<leader>gL` | n              | Git Blame Line              |
| `<leader>gb` | n              | Git Blame                   |
| `<leader>gs` | n              | Git Status                  |
| `<leader>gg` | n              | Git Grep                    |
| `<leader>gS` | n              | Git Stash                   |
| `<leader>fd` | n              | Find Diagnostics Buffer     |
| `gd`         | n              | Goto Definition LSP         |
| `gD`         | n              | Goto Declaration LSP        |
| `gr`         | n              | References LSP              |
| `gI`         | n              | Goto Implementation LSP     |
| `gy`         | n              | Goto Type Definition LSP    |
| `<C-w>z`     | n              | Toggle Zoom                 |
| `<S-TAB>`    | n              | Previous buffer             |
| `<TAB>`      | n              | Next buffer                 |
| `<leader>n`  | n,i,ft=ansible | Ansible name task           |
| `<leader>N`  | n,ft=ansible   | Ansible name all tasks      |
| `<leader>a`  | n,ft=ansible   | Insert ansible.builtin.     |
| `<leader>ca` | n,ft=ansible   | Ansible lint fix            |
| `K`          | n,v,ft=ansible | Ansible doc                 |
| `<C-+>`      | n              | Increase Neovide scale      |
| `<C-->`      | n              | Decrease Neovide scale      |
| `<C-=>`      | n              | Reset Neovide scale         |
| `<C-J>`      | i              | Accept copilot suggestion   |
| `<leader>to` | t              | Toggle Opencode             |
| `<C-h>`      | t              | Tmux navigate left          |
| `<C-j>`      | t              | Tmux navigate down          |
| `<C-k>`      | t              | Tmux navigate up            |
| `<C-l>`      | t              | Tmux navigate right         |
| `<C-w>z`     | t              | Toggle zoom                 |
| `<F2>`       | n              | Format logstash config      |
