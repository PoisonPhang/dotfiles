local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("poison.lsp.lsp-installer")
require("poison.lsp.handlers").setup()
require("poison.lsp.null-ls")
