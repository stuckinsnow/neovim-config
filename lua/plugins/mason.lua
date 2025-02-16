local LSPS = {
  "tailwindcss",
  "gopls",
  "html",
  "emmet_language_server",
  "cssls",
}

return {
  "williamboman/mason-lspconfig.nvim",
  opts = {
    ensure_installed = LSPS,
  },
}
