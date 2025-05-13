local copilot = {
    "github/copilot.vim",
    config = function()
        vim.keymap.set("i", "<C-_>", 'copilot#Accept("\\<CR>")',
            { expr = true, replace_keycodes = false })

        vim.g.copilot_no_tab_map = true
    end
}

return {}

