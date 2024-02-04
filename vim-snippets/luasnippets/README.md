# Generate ansible snippets

## Run generate.py

```sh
./generate.py --style dictionary --no-description --comment-non-required
```

## Convert to luascript

At the moment, the convert script is executed inside neovim itself by  
the command `:ConvertSnippets`

## Update

Update the `package.json` to include yaml.ansible

```json
        "language": [
          "ansible",
          "yaml.ansible"
        ],
```
