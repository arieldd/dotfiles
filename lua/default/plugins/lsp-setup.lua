return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "WhoIsSethDaniel/mason-tool-installer.nvim",

            { "folke/neodev.nvim", opts = {} },
        },
        config = function()
            local telescope_builtin = require("telescope.builtin")

            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("DefaultLspConfig", { clear = true }),
                callback = function(event)
                    local map = function(keys, func, desc)
                        vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
                    end

                    map("gd", telescope_builtin.lsp_definitions, "[G]oto [D]efinition")
                    map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
                    map("gi", telescope_builtin.lsp_implementations, "[G]oto [I]mplementation")
                    map("gr", telescope_builtin.lsp_references, "[G]oto [R]eferences")
                    map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
                    map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
                    map("<leader>ds", telescope_builtin.lsp_document_symbols, "[D]ocument [S]ymbols")
                    map("<leader>ws", telescope_builtin.lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
                    map("<leader>D", telescope_builtin.lsp_type_definitions, "Type [D]efinition")
                    map("K", vim.lsp.buf.hover, "Hover Documentation")

                    local client = vim.lsp.get_client_by_id(event.data.client_id)
                    if client and client.server_capabilities.documentHighlightProvider then
                        vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                            buffer = event.buf,
                            callback = vim.lsp.buf.document_highlight,
                        })

                        vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                            buffer = event.buf,
                            callback = vim.lsp.buf.clear_references,
                        })
                    end
                end,
            })

            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities(), {
                offsetEncoding = { "utf-16" },
                general = {
                    positionsEncodings = { "utf-16" },
                },
            })

            require("mason").setup()

            local servers = {
                clangd = {
                    filetyoes = { "c", "cpp", "objc", "objcpp" },
                },
                gopls = {},
                pyright = {},
                -- Set up in dedicated plugin
                -- rust_analyzer = {},
                tsserver = {},
                lua_ls = {},
                htmx = {},
            }
            local ensure_installed = vim.tbl_keys(servers or {})
            vim.list_extend(ensure_installed, {
                "stylua",
                "clang-format",
                "prettier",
                "eslint_d",
            })
            require("mason-tool-installer").setup({ ensure_installed = ensure_installed })
            require("mason-lspconfig").setup({
                handlers = {
                    function(server_name)
                        local server = servers[server_name] or {}
                        server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
                        require("lspconfig")[server_name].setup(server)
                    end,
                },
            })
        end,
    },
}
