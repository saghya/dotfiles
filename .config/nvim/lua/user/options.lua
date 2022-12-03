local options = {
    number = true,
    mouse = "a",
    showtabline = 2,
    tabstop = 4,
    softtabstop = 4,
    shiftwidth = 4,
    expandtab = true,
    scrolloff = 8,
    termguicolors = true,
    laststatus = 0,
    completeopt = { "menu", "menuone", "noselect" },
    clipboard = "unnamedplus",
    hidden = true,
    backup = false,
    guicursor = { "i:ver1", "a:blinkon1" },
    cursorline = true,
    swapfile = false,
    ignorecase = true,
    smartcase = true,
    smartindent = true,
    splitbelow = true,
    splitright = true,
    fillchars = { stl = "─", stlnc = "─", vert = "│" },
}

vim.opt.shortmess:append "c"
vim.opt.iskeyword:append("-")
vim.opt.whichwrap:append("<,>,[,],h,l")

for k, v in pairs(options) do
    vim.opt[k] = v
end

vim.cmd [[autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o]]
vim.cmd [[let &statusline='%#VertSplit# ']]
vim.cmd [[set nowrap]]

