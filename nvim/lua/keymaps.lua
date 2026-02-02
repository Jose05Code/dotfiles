
-- LSP
vim.keymap.set("n","K",vim.lsp.buf.hover,{desc = "LSP Hover"})
vim.keymap.set("n","gd",vim.lsp.buf.definition,{desc = "LSP Go to definition"})
vim.keymap.set("n","K",vim.lsp.buf.references,{desc = "LSP References"})
vim.keymap.set("n","K",vim.lsp.buf.rename,{desc = "LSP Rename"})

--Nvim Tree
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", {noremap = true, silent = true})

vim.keymap.set("n", "<leader>t", "<cmd>ToggleTerm<cr>", {noremap = true, silent = true})

-- Make tab indent
vim.keymap.set("v", "<Tab>", ">gv", {noremap = true, silent = true})
vim.keymap.set("v", "<S-Tab>", "<gv", {noremap = true, silent = true})

