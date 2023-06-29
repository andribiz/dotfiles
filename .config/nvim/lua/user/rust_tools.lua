-- Update this path
local extension_path = '/Users/andrix/.vscode/extensions/vadimcn.vscode-lldb-1.8.1/'
local codelldb_path = extension_path .. 'adapter/codelldb'
local liblldb_path = extension_path .. 'lldb/lib/liblldb.dylib'

local opts = {
    -- ... other configs
    dap = {
        adapter = require('rust-tools.dap').get_codelldb_adapter(
            codelldb_path, liblldb_path)
    },
    server = {
        on_attach = function(client, bufnr)
            require("nvim-navic").attach(client, bufnr)
            require("nvim-navbuddy").attach(client, bufnr)
        end,
    },
    -- server = {
    --     -- standalone file support
    --     -- setting it to false may improve startup time
    --     standalone = false,
    -- }
}
require("rust-tools").setup(opts)
