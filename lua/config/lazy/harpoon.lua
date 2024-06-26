return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local harpoon = require("harpoon")

        -- REQUIRED
        harpoon:setup({
            settings = {
                sync_on_ui_close = true,
            }
        })
        -- REQUIRED

        vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, { desc = "[A]ppend harpofon"})
        vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon toggle"})

        vim.keymap.set("n", "<M-j>", function() harpoon:list():select(1) end)
        vim.keymap.set("n", "<M-k>", function() harpoon:list():select(2) end)
        vim.keymap.set("n", "<M-l>", function() harpoon:list():select(3) end)
        vim.keymap.set("n", "<M-;>", function() harpoon:list():select(4) end)

        -- Toggle previous & next buffers stored within Harpoon list
        -- vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
        -- vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
    end
}
