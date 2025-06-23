vim.keymap.set('i', 'jk', '<esc>', { silent = true })

vim.g.mapleader = " "
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<M-J>", "<C-w>j")
vim.keymap.set("n", "<M-K>", "<C-w>k")
vim.keymap.set("n", "<M-H>", "<C-w>h")
vim.keymap.set("n", "<M-L>", "<C-w>l")

vim.keymap.set("n", "<M-<>", "5<C-w><")
vim.keymap.set("n", "<M->>", "5<C-w>>")


-- move lines up/down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z") -- concat with line below

-- move half page but keep screen centered
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- next find but keep screen centered
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")


-- paste and keep yanked
vim.keymap.set("x", "<leader>p", [["_dP]])

-- yank to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- delete to null register
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])


vim.keymap.set("n", "Q", "<nop>") -- disable macros

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- fix list next back
vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lprev<CR>zz")

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, {desc="Diagnostic prev"})
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, {desc="Diagnostic next"})
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, {desc="Diagnostic in window"})
vim.keymap.set('n', '<leader>E', vim.diagnostic.setloclist, {desc="diagnostic loc list"} )

-- Primogen uses this, start replacing curent word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set(
    "n",
    "<leader>ee",
    "oif err != nil {<CR>}<Esc>Oreturn err<Esc>"
)

vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

