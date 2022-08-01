M = {}

M.setup = function()
    vim.api.nvim_create_user_command('Notical', function(opts)
        M.hello()
    end, {})
end

function M.hello()
    print("hello from notical without save")
end

M.hello()

return M
