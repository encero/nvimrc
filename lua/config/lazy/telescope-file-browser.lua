return {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    config = function()
        require("telescope").load_extension "file_browser"

        require("telescope").setup({
            extensions = {
                file_browser = {
                    hijack_netrw = true
                },
            },
        })

        vim.keymap.set("n", "<leader>b", function()
                require("telescope").extensions.file_browser.file_browser()
            end,
            { desc = "File [b]rowser" }
        )
        vim.keymap.set("n", "<leader>B", function()
                require("telescope").extensions.file_browser.file_browser({path= "%:p:h"})
            end,
            { desc = "File [B]rowser current file" }
        )
    end
}
