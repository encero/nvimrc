return {
    "nvim-telescope/telescope.nvim",

    tag = "0.1.5",

    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter-context",
    },

    config = function()
        require('telescope').setup({
            pickers = {
                buffers = {
                    mappings = {
                        n = {
                            ["x"] = "delete_buffer",
                        },
                        i = {
                            ["<M-x>"] = "delete_buffer",
                        }
                    }
                }
            }
        })

        vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles,
            { desc = '[?] Find recently opened files' })
        vim.keymap.set('n', '<leader><space>', function()
            require('telescope.builtin').buffers {
                sort_lasused = true,
                sort_mru = true,
            }
        end, { desc = '[ ] Find existing buffers' })
        vim.keymap.set('n', '<leader>/', function()
            require('telescope.builtin').current_buffer_fuzzy_find()
        end, { desc = '[/] Fuzzily search in current buffer' })

        vim.keymap.set('n', '<leader>sf', function()
            local ok, _ = pcall(require('telescope.builtin').git_files)
            if not ok then
                vim.api.nvim_echo({ { "git_files failed, failing back to find_files" } }, false, {})
                require('telescope.builtin').find_files()
            end
        end
        , { desc = '[S]earch Git [F]iles ' })
        vim.keymap.set('n', '<leader>sa', require('telescope.builtin').find_files, { desc = '[S]earch [A]ll Files' })
        vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
        vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
        vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
        vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
        vim.keymap.set('n', '<leader>ls', require('telescope.builtin').resume, { desc = '[L]ast [S]earch' })
    end
}
