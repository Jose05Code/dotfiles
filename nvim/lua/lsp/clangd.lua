-- Better diagnostic UI/behavior
vim.diagnostic.config({
  virtual_text = true,       -- inline messages
  signs = true,              -- gutter signs
  underline = true,
  update_in_insert = false,  -- only update on Normal mode for less flicker
  severity_sort = true,
})
vim.opt.signcolumn = "yes"   -- keep gutter visible

-- Capabilities (so cmp & LSP play nicely)
local caps = vim.lsp.protocol.make_client_capabilities()
pcall(function()
  caps = require("cmp_nvim_lsp").default_capabilities(caps)
end)

-- Start clangd (native API, no lspconfig)
vim.lsp.config("clangd", {
  cmd = { "clangd", "--background-index", "--clang-tidy" },
  filetypes = { "c", "cpp", "objc", "objcpp" },
  root_markers = { "compile_commands.json", "compile_flags.txt", ".git" },
  capabilities = caps,
})

vim.lsp.enable({ "clangd" })

