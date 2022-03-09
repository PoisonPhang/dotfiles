local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

-- local lsp_installer_servers = require("nvim-lsp-installer.servers")
--
-- local server_available = lsp_installer_servers.get_server("rust-analyzer")
--
-- if server_available then
-- 	local opts = {
-- 		tools = { -- rust-tools options
-- 			autoSetHints = true,
-- 			hover_with_actions = true,
-- 			inlay_hints = {
-- 				show_parameter_hints = false,
-- 				parameter_hints_prefix = "",
-- 				other_hints_prefix = "",
-- 			},
-- 		},
--
-- 		-- all the opts to send to nvim-lspconfig
-- 		-- these override the defaults set by rust-tools.nvim
-- 		-- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
-- 		server = {
-- 			-- on_attach is a callback called when the language server attachs to the buffer
-- 			-- on_attach = on_attach,
-- 			settings = {
-- 				-- to enable rust-analyzer settings visit:
-- 				-- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
-- 				["rust-analyzer"] = {
-- 					-- enable clippy on save
-- 					checkOnSave = {
-- 						command = "clippy",
-- 					},
-- 				},
-- 			},
-- 		},
-- 	}
--
-- 	require("rust-tools").setup(opts)
-- end

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
	local opts = {
		on_attach = require("poison.lsp.handlers").on_attach,
		capabilities = require("poison.lsp.handlers").capabilities,
	}

	if server.name == "jsonls" then
		local jsonls_opts = require("poison.lsp.settings.jsonls")
		opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
	end

	if server.name == "sumneko_lua" then
		local sumneko_opts = require("poison.lsp.settings.sumneko_lua")
		opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
	end

	if server.name == "pyright" then
		local pyright_opts = require("poison.lsp.settings.pyright")
		opts = vim.tbl_deep_extend("force", pyright_opts, opts)
	end

	if server.name == "rust_analyzer" then
		local rustopts = {
			tools = {
				autoSetHints = true,
				hover_with_actions = true,
				inlay_hints = {
					show_parameter_hints = false,
					parameter_hints_prefix = "",
					other_hints_prefix = "",
				},
			},
			server = vim.tbl_deep_extend("force", server:get_default_options(), opts, {
				settings = {
					["rust-analyzer"] = {
						checkOnSave = {
							command = "clippy",
						},
					},
				},
			}),
		}
		require("rust-tools").setup(rustopts)
		server:attach_buffers()
	else
		server:setup(opts)
	end
end)
