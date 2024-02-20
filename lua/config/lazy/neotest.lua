return {
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",
            "nvim-neotest/neotest-plenary",
            "encero/neotest-go",
            "rouge8/neotest-rust",


            "nvim-neotest/nvim-nio", -- neotest-go dev dependency
        },
        config = function()
            -- get neotest namespace (api call creates or returns namespace)
            local neotest_ns = vim.api.nvim_create_namespace("neotest")
            vim.diagnostic.config({
                virtual_text = {
                    format = function(diagnostic)
                        local message =
                            diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
                        return message
                    end,
                },
            }, neotest_ns)
            local neotest = require("neotest")

            neotest.setup({
                -- your neotest config here
                adapters = {
                    require("neotest-go"),
                    require("neotest-rust"),
                },
                summary = {
                    enabled = true,
                    follow = true,
                },
                status = {
                    enabled = true,
                    signs = true,
                    virtual_text = false,
                }
            })

            vim.keymap.set("n", "<leader>tc", function()
                neotest.run.run()
            end, { desc = "[T]est [C]urrent test" })

            vim.keymap.set("n", "<leader>tf", function()
                neotest.run.run(vim.fn.expand("%"))
            end, { desc = "[T]est [F]ile" })

            vim.keymap.set("n", "<leader>ts", function()
                neotest.summary.toggle()
            end, { desc = "[T]est [S]ummary" })
        end,
    },
}
