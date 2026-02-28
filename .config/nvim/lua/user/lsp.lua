-- lsp.lua

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
local ok_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if ok_cmp then
  capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
end

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { "clangd", "pyright", "bashls" }

-- Neovim 0.11+ (preferred): vim.lsp.config + vim.lsp.enable
if vim.fn.has("nvim-0.11") == 1 then
  -- Set defaults for ALL servers (use name '*' for defaults)
  vim.lsp.config("*", {
    capabilities = capabilities,
    -- You can also put a global on_attach here if you want.
  })

  -- Enable the server configs (provided by nvim-lspconfig's lsp/ runtime files)
  vim.lsp.enable(servers)

else
  -- Legacy fallback (Neovim < 0.11): require('lspconfig').server.setup(...)
  local ok_lspconfig, lspconfig = pcall(require, "lspconfig")
  if not ok_lspconfig then
    return
  end

  for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup({
      capabilities = capabilities,
      -- on_attach = my_custom_on_attach,
    })
  end
end

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    local opts = { buffer = ev.buf }
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
    vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set("n", "<space>wl", function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
    vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<space>f", function()
      vim.lsp.buf.format({ async = true })
    end, opts)
  end,
})

