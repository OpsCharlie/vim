return {
  filetypes = { "ps1", "psm1", "psd1" },
  bundle_path = "~/.local/share/nvim/mason/packages/powershell-editor-services/",
  settings = {
    powershell = {
      codeFormatting = {
        Preset = "OTBS",
      },
    },
  },
  init_options = {
    enableProfileLoading = false,
  },
}
