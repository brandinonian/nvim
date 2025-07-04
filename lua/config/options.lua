local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

-- Line wrapping
opt.wrap = false

-- Search settings
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- Appearance
opt.termguicolors = true
opt.background = "dark"
--opt.signcolumn = "yes"
--opt.cursorline = false

-- Backspace
opt.backspace = "indent,eol,start"

-- Clipboard
opt.clipboard:append("unnamedplus")

-- Split windows
opt.splitright = true
opt.splitbelow = true

-- Consider dash as part of word
opt.iskeyword:append("-")

-- Decrease update time
opt.updatetime = 50

-- Decrease mapped sequence wait time
opt.timeoutlen = 300

-- Scroll settings
opt.scrolloff = 8
opt.sidescrolloff = 8

-- Enable mouse mode
opt.mouse = "a"

-- Enable persistent undo
opt.undofile = true

-- Confirm before closing unsaved buffer
opt.confirm = true
