# nvim

## Dependencies

```bash
sudo apt install curl git gcc jq python3-pip python3-venv ripgrep fd-find
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
shfmt
systemd-language-server
systemdlint
```
