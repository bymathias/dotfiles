-- lua/config/options.lua

vim.o.number = true
vim.o.relativenumber = true
vim.o.mouse = "a"
vim.o.showmode = false

-- Deferred: setting clipboard early increases startup time
vim.schedule(function()
  vim.o.clipboard = "unnamedplus"
end)

vim.o.breakindent = true
vim.o.wrap = false
vim.o.scrolloff = 10
vim.o.sidescrolloff = 10

vim.o.undofile = true
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false

vim.o.ignorecase = true
vim.o.smartcase = true -- overrides ignorecase when pattern has uppercase

vim.o.signcolumn = "yes"
vim.o.colorcolumn = ""
vim.o.pumheight = 10
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.ttimeoutlen = 50

vim.o.splitright = true
vim.o.splitbelow = true

vim.o.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" } -- vim.opt required for table values
vim.opt.fillchars = { eob = " " }                            -- vim.opt required for table values

vim.o.inccommand = "split"
vim.o.cursorline = true
vim.o.confirm = true
vim.o.autoread = true

-- Required for render-markdown.nvim; concealcursor="" shows raw syntax on the cursor line
vim.o.conceallevel = 2
vim.o.concealcursor = ""

-- Treesitter-based folding; foldlevel=99 keeps all folds open on file open
vim.o.foldmethod = "expr"
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.o.foldlevel = 99

vim.opt.diffopt:append("linematch:60")
