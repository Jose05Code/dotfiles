-- Advertise cmp capabilities if present
local caps = vim.lsp.protocol.make_client_capabilities()
pcall(function() caps = require("cmp_nvim_lsp").default_capabilities(caps) end)

vim.lsp.config("clangd", {
  cmd = { "clangd" },  -- or full path, e.g. "/usr/bin/clangd-18"
  filetypes = { "c", "cpp", "objc", "objcpp" },
  root_markers = { "compile_commands.json", "compile_flags.txt", ".git" },
  capabilities = caps,
})

vim.lsp.enable({ "clangd" })

