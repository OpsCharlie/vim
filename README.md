# nvim

## Dependencies

```txt
curl git gcc jq python3-pip python3-venv ripgrep
```

### python env

```bash
python3 -m venv ~/venv/3.12.3
echo '[ -f ~/venv/3.12.3/bin/activate ] && source ~/venv/3.12.3/bin/activate' >> ~/.bashrc
```

### neovim

```bash
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage
chmod +x nvim-linux-x86_64.appimage
ln -s nvim-linux-x86_64.appimage nvim
```

### nodejs/npm

```bash
# https://github.com/nvm-sh/nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
source ~/.bashrc
nvm install --lts
```

## Mason

```ini
ansible-language-server
bash-language-server
beautysh
codespell
djlint
docker-compose-language-service
golangci-lint
json-lsp
lua-language-server
markdownlint
prettier
pylama
python-lsp-server
shellcheck
stylua
systemdlint
yaml-language-server
```
