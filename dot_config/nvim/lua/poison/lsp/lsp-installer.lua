local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

local status_ok, lspconfig = pcall(require, "lspconfig")
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

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
-- lsp_installer.on_server_ready(function(server)
--   local opts = {
--     on_attach = require("poison.lsp.handlers").on_attach,
--     capabilities = require("poison.lsp.handlers").capabilities,
--   }
--
--   if server.name == "jsonls" then
--     local jsonls_opts = require("poison.lsp.settings.jsonls")
--     opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
--   end
--
--   if server.name == "sumneko_lua" then
--     local sumneko_opts = require("poison.lsp.settings.sumneko_lua")
--     opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
--   end
--
--   if server.name == "pyright" then
--     local pyright_opts = require("poison.lsp.settings.pyright")
--     opts = vim.tbl_deep_extend("force", pyright_opts, opts)
--   end
--
--   if server.name == "rust_analyzer" then
--     require("rust-tools").setup({
--       server = vim.tbl_deep_extend("force", server:get_default_options(), opts),
--     })
--     server:attach_buffers()
--     require("rust-tools").start_standalone_if_required()
--   else
--     server:setup(opts)
--   end
-- end)
