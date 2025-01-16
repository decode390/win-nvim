local g = vim.g
local o = vim.o

-- Better editor UI
o.number = true
o.numberwidth = 5
o.relativenumber = true
o.signcolumn = 'yes:2'
o.cursorline = true

o.ignorecase = true
o.smartcase = true

o.scrolloff = 8

o.clipboard = 'unnamedplus'

o.smoothscroll = true

-- Better editing experience
o.expandtab = true
-- o.smarttab = true
-- o.cindent = true
-- o.autoindent = true
o.wrap = true
o.textwidth = 300
o.tabstop = 2
o.shiftwidth = 0
o.softtabstop = -1 -- If negative, shiftwidth value is used


g.mapleader = ' '
g.maplocalleader = ' '

--g.python3_host_prog = 'C:\\Users\\Miguel\\AppData\\Local\\Programs\\Python\\Python313\\python.exe'

--vim.opt.undofile = true
--vim.opt.undodir = vim.fn.expand('C:\\Users\\Miguel\\AppData\\Local\\nvim\\undo')
--o.tabline = '%t'
