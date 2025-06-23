return {
  "olimorris/codecompanion.nvim",
  opts = {},
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  keys = {
    {"<leader>cc", function() require("codecompanion").toggle() end, desc = "Toggle CodeCompanion"},
  },
    setup = function()
        require("codecompanion").setup({
            adapters = {
                copilot = function ()
                    return require("codecompanion.adapters").extend("copilot", {
                        api_key = "cmd: cat ~/secrets/copilot/apikey",
                    })
                end,
            },
            strategies = {
                chat = {
                    adapter = "copilot",
                },
                cmd = {
                    adapter = "copilot",
                },
                inline = {
                    adapter = "copilot",
                },
            },
        })
    end,
}
