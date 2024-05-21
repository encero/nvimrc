local telescope = require("telescope.builtin")

vim.api.nvim_create_user_command("DI", function ()
    telescope.live_grep({
        default_text = "nuf"
    })
end, {})
