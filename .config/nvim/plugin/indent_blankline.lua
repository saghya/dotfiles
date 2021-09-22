require("indent_blankline").setup {
    char = "¦",   -- '|', '¦', '┆', '┊'
    filetype_exclude = { "help", "terminal", "dashboard", "packer" },
    buftype_exclude = {"terminal"},
    use_treesitter = true,
    show_trailing_blankline_indent = false,
    show_first_indent_level = false,
}
