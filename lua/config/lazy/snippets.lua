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

            local s = ls.snippet
            local sn = ls.snippet_node
            local isn = ls.indent_snippet_node
            local t = ls.text_node
            local i = ls.insert_node
            local f = ls.function_node
            local c = ls.choice_node
            local d = ls.dynamic_node
            local r = ls.restore_node

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

            ls.add_snippets("all", {
                s("nojira", {
                    t "JIRA: NO-JIRA ", i(1, "description"),
                }),
                s("jira", {
                    t "JIRA: ", i(1, "IR-xxx"), t" ", i(2, "description"),
                }),
            })

        end,
    }
}
