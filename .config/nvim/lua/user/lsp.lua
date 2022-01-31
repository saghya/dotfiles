local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "lspconfig".clangd.setup{}
require "lspconfig".pyright.setup{}
