local indent_blankline_status_ok, indent_blankline = pcall(require, "indent_blankline")
if not indent_blankline_status_ok then
    return
end

indent_blankline.setup {
    char = "¦",   -- '|', '¦', '┆', '┊'
    filetype_exclude = { "help", "terminal", "dashboard", "packer" },
    buftype_exclude = {"terminal"},
    use_treesitter = true,
    show_trailing_blankline_indent = false,
    show_first_indent_level = false,
}

