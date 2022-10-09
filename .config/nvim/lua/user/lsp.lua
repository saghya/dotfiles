-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
    return
end
capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

-- lsp setup
local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
    return
end

