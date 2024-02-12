return {
    {
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!).
        build = "make install_jsregexp",

        dependencies = { "rafamadriz/friendly-snippets" },

        config = function()
            local ls = require("luasnip")

            vim.keymap.set({ 'i', 's' }, '<m-j>', function()
                if ls.expand_or_jumpable() then
                    ls.expand_or_jump()
                end
            end)

            vim.keymap.set({ 'i', 's' }, '<m-k>', function()
                if ls.jumpable(-1) then
                    ls.jump(-1)
                end
            end)

            vim.keymap.set({ 'i', 's' }, '<m-l>', function()
                if ls.choice_active() then
                    ls.change_choice(1)
                end
            end)
        end,
    }
}
