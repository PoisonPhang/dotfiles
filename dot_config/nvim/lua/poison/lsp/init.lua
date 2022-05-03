local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
	return
end

local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

local status_ok, rust_tools = pcall(require, "rust-tools")
if not status_ok then
	return
end

-- General language server options
local opts = {
	on_attach = require("poison.lsp.handlers").on_attach,
	capabilities = require("poison.lsp.handlers").capabilities,
}

require("nvim-lsp-installer").setup({
	ensure_installed = { "rust_analyzer", "sumneko_lua", "jsonls" },
	automatic_installation = true,
})

-- Setup specific servers

-- jsonls
local jsonls_opts = require("poison.lsp.settings.jsonls")
jsonls_opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
lspconfig.jsonls.setup(jsonls_opts)

-- sumneko_lua
local sumneko_opts = require("poison.lsp.settings.sumneko_lua")
sumneko_opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
lspconfig.sumneko_lua.setup(sumneko_opts)

-- pyright
local pyright_opts = require("poison.lsp.settings.pyright")
pyright_opts = vim.tbl_deep_extend("force", pyright_opts, opts)
lspconfig.pyright.setup(pyright_opts)

-- rust
rust_tools.setup({
	server = opts,
})

require("poison.lsp.handlers").setup()
require("poison.lsp.null-ls")
