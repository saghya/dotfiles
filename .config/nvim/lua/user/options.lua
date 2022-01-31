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
}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
    vim.opt[k] = v
end


vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work

