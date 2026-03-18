# Generate ansible snippets

## Run generate.py

### SnipMate format (default)
```sh
./generate.sh --user --style dictionary --no-description --comment-non-required
```

### VSCode/Blink format (for blink.cmp)
```sh
./generate.sh --format vscode --user --comment-non-required
```

## Options

- `--format`: Output format (`snipmate` or `vscode`). Default: `snipmate`
- `--user`: Include user-installed collection modules
- `--style`: YAML style (`multiline` or `dictionary`). Default: `multiline`
- `--no-description`: Remove option descriptions
- `--comment-non-required`: Comment non-required options

## Update

For blink.cmp, update `package.json` to include `yaml.ansible`:

```json
"language": [
  "ansible",
  "yaml.ansible"
]
```
