local augment = {
    {
        'augmentcode/augment.vim',
        init = function()
            vim.g.augment_workspace_folders = { "~/iridium" }
            vim.g.augment_disable_tab_mapping = true
        end,
        config = function(opts)
            -- require("augment").setup(opts)

            vim.keymap.set("i", "<C-_>", '<cmd>call augment#Accept()<CR>', { desc = "Accept augment suggestion" })
            vim.keymap.set({ "n", "v" }, "<leader>ic", "<cmd>Augment chat<CR>", { desc = "Open augment chat" })
            vim.keymap.set({ "n", "v" }, "<leader>it", "<cmd>Augment chat-toggle<CR>", { desc = "Toggle augment chat" })
        end,
    },
}

return {}
