-- open shortcuts cheatsheet 
vim.keymap.set({"n", "v"}, "<leader>c", ":sp ~/.config/nvim/maps.txt<cr>")
vim.keymap.set({"n", "v"}, "<leader>cv", ":vsp ~/.config/nvim/maps.txt<cr>")

vim.g.mapleader = ","
vim.keymap.set({"n", "v", "i"}, "lkj", "<Esc>")

-- essential shortcuts
vim.keymap.set("n", ";", ":")
vim.keymap.set("v", ";", ":")
vim.keymap.set("n", "<leader>w", ":w<cr>")
vim.keymap.set("n", "<leader>q", ":q<cr>")
vim.keymap.set("n", "<leader>fq", ":q!<cr>")

-- vimdow navigation
vim.keymap.set({"n", "v", "i"}, "<C-k>", "<C-w><Up>")
vim.keymap.set({"n", "v", "i"}, "<C-j>", "<C-w><Down>")
vim.keymap.set({"n", "v", "i"}, "<C-h>", "<C-w><Left>")
vim.keymap.set({"n", "v", "i"}, "<C-l>", "<C-w><Right>")

-- netrw file explorer
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

-- Move visually selected lines up and down, auto indent if applicable
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

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

-- yank into system clipboard, h/t : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
-- same thing but for a line
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

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

-- edit and source config files
vim.keymap.set("n", "<leader>vv", ":vsp $MYVIMRC<CR>")
vim.keymap.set("n", "<leader>vz", ":vsp ~/.zshrc<CR>")
vim.keymap.set("n", "<leader>sv", ":source $MYVIMRC<CR>")
vim.keymap.set("n", "<leader>sz", ":source ~/.zshrc<CR>")

-- apache reload for website
vim.keymap.set("n", "<leader>rr", ":!sudo apache2 restart<CR><CR>")

