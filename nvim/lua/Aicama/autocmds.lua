vim.api.nvim_create_augroup("Aicama_general", {clear = true})

vim.api.nvim_create_autocmd("TextYankPost", {
    group = "Aicama_general",
    callback = function() vim.highlight.on_yank() end,
})

-- Darkman theme sync
local mode_file = vim.fn.expand("~/.cache/darkman/mode")
local function apply_darkman_theme()
    local f = io.open(mode_file, "r")
    if f then
        local mode = f:read("*line")
        f:close()
        if mode == "dark" then
            vim.o.background = "dark"
        elseif mode == "light" then
            vim.o.background = "light"
        end
    end
end

-- Apply on startup
apply_darkman_theme()

-- Watch for changes
vim.api.nvim_create_autocmd({"FocusGained", "BufEnter"}, {
    group = "Aicama_general",
    callback = apply_darkman_theme,
})
