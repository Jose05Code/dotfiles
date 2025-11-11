vim.api.nvim_create_augroup("Aicama_general", {clear = true})

vim.api.nvim_create_autocmd("TextYankPost", {
    group = "Aicama_general",
    callback = function() vim.highlight.on_yank() end,
})
