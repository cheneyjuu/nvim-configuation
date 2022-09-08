local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

local lspconfig = require("lspconfig")
local lsp_status = require("lsp-status")

local servers = { "jsonls", "sumneko_lua", "tsserver", "tailwindcss", "cssls", "cssmodules_ls", "vuels", "yamlls", "emmet_ls", "rust_analyzer", "jdtls", "volar"}

lsp_status.config({
    current_function = false,
    show_filename = true,
    diagnostics = false,
    status_symbol = "",
    select_symbol = nil,
    update_interval = 200,
})

lsp_installer.setup {
	ensure_installed = servers
}

for _, server in pairs(servers) do
	local opts = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
	}
	local has_custom_opts, server_custom_opts = pcall(require, "user.lsp.settings." .. server)
	if has_custom_opts then
    opts = vim.tbl_deep_extend("force", server_custom_opts, opts)
	end
	lspconfig[server].setup(opts)
end
