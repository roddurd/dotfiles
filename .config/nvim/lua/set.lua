-- fat cursor block like vim. also highlight line
vim.o.guicursor = ""
vim.o.cursorline = true

-- relative line numbers
vim.o.nu = true
vim.o.relativenumber = true

-- netrw explorer
-- disable banner
vim.g.netrw_banner = 0
-- tree view
vim.g.netrw_liststyle = 3
-- open in current pane
vim.g.netrw_browse_split = 0

-- split behavior
vim.o.splitright = true
vim.o.splitbelow = true

-- the amount of milliseconds nvim will wait for another key in a chord
vim.o.timeoutlen = 300

-- 4 space indentation
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true

-- word wrap
vim.o.wrap = true

-- backup options
vim.o.swapfile = true
vim.o.backup = false
vim.o.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.o.undofile = true

-- keep searches highlighted
vim.o.hlsearch = true
-- show what your search is doing as you type it
vim.o.incsearch = true
-- only match case when you have uppercase(s) in search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- backspace works properly
vim.o.backspace = "indent,eol,start"

-- good terminal colors
if vim.env.TERM_PROGRAM == "Apple_Terminal" then
    vim.cmd('colorscheme koehler')
else
    vim.o.termguicolors = true
end


-- 8 lines of padding above/below while scrolling, keeps you centered
vim.o.scrolloff = 8
vim.o.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- speedy
vim.o.updatetime = 50

-- color the 80th coloumn
vim.o.colorcolumn = "80"

-- faster macros
vim.g.lazyredraw = true
