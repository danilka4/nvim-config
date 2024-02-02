vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
        -- Create your keybindings here...
        local opts = { buffer = bufnr, remap = false }

        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "<leader>F", function() vim.lsp.buf.format() end, opts)
        -- Custom implementation of K for R files
        if vim.bo.filetype ~= "r" and vim.bo.filetype ~= "rmd" then
            vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        end
        --vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        --vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, opts)
        --vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
        --vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
        --vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    end
})

require('mason').setup({})
require('mason-lspconfig').setup({
    -- Replace the language servers listed here
    -- with the ones you want to install
    ensure_installed = { 'clangd', 'lua_ls', 'texlab', 'r_language_server', 'pyright', 'tsserver', 'rust_analyzer', 'html'},
})


local lspconfig = require('lspconfig')
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

require('mason-lspconfig').setup_handlers({
    function(server_name)
        lspconfig[server_name].setup({
            capabilities = lsp_capabilities,
        })
    end,
})

--local executable = 'zathura'
--local args = {
--    '--synctex-editor-command',
--    [[nvim-texlabconfig -file '%%%{input}' -line %%%{line} -server ]] .. vim.v.servername,
--    '--synctex-forward',
--    '%l:1:%f',
--    '%p',
--}
--
--require 'lspconfig'.texlab.setup({
--    setting = {
--            texlab = {
--                forwardSearch = {
--                    executable = executable,
--                args = args,
--                },
--            },
--        },
--})
-- -v, --verbosity...     Increase message verbosity (-vvvv for max verbosity)

require('lsp-zero')
require 'lspconfig'.texlab.setup {
    cmd = {'texlab', '-vvvv'}
}

require 'lspconfig'.lua_ls.setup {
    settings = {
        Lua = {
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {
                    'vim',
                    'require'
                },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
}


local cmp = require 'cmp'
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["UltiSnips#Anon"](args.body)
        end
    },
    mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        ['<Tab>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },
    sources = cmp.config.sources(
        {
            { name = 'nvim_lsp' },
            { name = 'ultisnips' },
        },
        {
            { name = 'buffer' },
        },
        { {
            name = "dictionary",
            keyword_length = 2,
        }, }
    )
})

require("cmp_dictionary").setup({
    -- The following are default values.
    exact_length = 2,
    first_case_insensitive = false,
    async = false,
    --sqlite = true,
    max_number_items = -1,
    debug = false,
    filetype = {
        md = "/home/lizzy/Documents/latex/authors.dict",
        vimwiki = "/home/lizzy/Documents/latex/authors.dict",
    },
})

cmp.setup.cmdline('/', {
    sources = {
        { name = 'buffer' }
    }
})

cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})

local tex_type_switch = {
    Text          = "String",
    Interface     = "Misc",
    Property      = "Thesis",
    Struct        = "Book",
    Event         = "Article",
    Operator      = "Part",
    TypeParameter = "Collection",
}

cmp.setup.filetype('tex', {
    formatting = {
        format = function(entry, vim_item)
            if tex_type_switch[vim_item.kind] then
            vim_item.kind = tex_type_switch[vim_item.kind]
            return vim_item
            end
            return vim_item
        end
    },
})

vim.g.use_nerd_icons = true

vim.diagnostic.config({
    virtual_text = true
})
