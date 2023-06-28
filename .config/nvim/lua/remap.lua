vim.g.mapleader = ","

-- open shortcuts cheatsheet
vim.keymap.set({ "n", "v" }, "<leader>c", ":sp ~/.config/nvim/maps.txt<cr>")
vim.keymap.set({ "n", "v" }, "<leader>cv", ":vsp ~/.config/nvim/maps.txt<cr>")
vim.keymap.set({ "v", "i" }, "lkj", "<Esc>")

-- essential shortcuts
vim.keymap.set("n", ";", ":")
vim.keymap.set("v", ";", ":")
vim.keymap.set("n", "<leader>w", ":w<cr>")
vim.keymap.set("n", "<leader>q", ":q<cr>")
vim.keymap.set("n", "<leader>fq", ":q!<cr>")

-- vimdow creation and navigation
vim.keymap.set({ "n", "v" }, "<leader>sh", "<C-w>h")     -- horizontal
vim.keymap.set({ "n", "v" }, "<leader>sv", "<C-w>v")     -- vertical
vim.keymap.set({ "n", "v" }, "<leader>s=", "<C-w>=")     -- make splits equal


-- file explorer
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<cr>")

-- Move visually selected lines up and down, auto indent if applicable
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- toggle highlight last search results
vim.keymap.set("n", ",/", ":set hlsearch!<cr>")
-- pressing * searches for the current word
vim.keymap.set("v", "*", "y/\\V<C-R>=escape(@\",'/\\')<CR><CR>")

-- concat line below while keeping cursor position
vim.keymap.set("n", "J", "mzJ`z")
-- keep cursor in middle while scrolling/searching
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- paste but deleted selected text into void register so yanked text stays
vim.keymap.set("x", "<leader>p", [["_dP]])
-- cut character into void register, in normal mode only
vim.keymap.set("n", "x", [["_x]])

-- yank into system clipboard, h/t : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
-- same thing but for a line
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- quickfix shortcuts
-- TODO: replace these mappings with something non-conflicting
-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- replace word under cursor everywhere in file
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- make the characters on the screen rain down.
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

-- toggle colorcolumn at col 80
vim.keymap.set("n","<leader>cc", ':execute "set colorcolumn=" . (&colorcolumn == "" ? "80" : "")<CR>')

-- apache reload for website
vim.keymap.set("n", "<leader>rr", ":!sudo apache2 restart<CR><CR>")
