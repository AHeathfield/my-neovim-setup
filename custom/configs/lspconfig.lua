local base = require("plugins.configs.lspconfig")
local on_attach = base.on_attach
local capabilities = base.capabilities

local lspconfig = require "lspconfig"
local util = require "lspconfig.util"

-- Clangd for C++
lspconfig.clangd.setup {
  on_attach = function(client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
}

-- Rust configuration remains, but Java is now handled by nvim-java
lspconfig.rust_analyzer.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"rust"},
  root_dir = util.root_pattern("Cargo.toml"),
})


vim.diagnostic.config({
  virtual_text = true,
  signs = true,          -- Keeps error/warning signs in the sign column
  underline = true,     -- Disables squiggly underlines
  update_in_insert = false, -- Avoids updating diagnostics while typing
})
