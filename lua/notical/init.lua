M = {}

M.setup = function()
    print("Notical has been setup")
end

M.hello = function()
    print("hello from notical another test, yet another test")
end

M.popup = function()
    local width = 50
    local height = 10
    local buf = vim.api.nvim_create_buf(false, true)

    local current_ui = vim.api.nvim_list_uis()[1]

    P(current_ui)

    local opts = {
        relative = 'editor',
        width = width,
        height = height,
        col = (current_ui.width / 2) - (width / 2),
        row = (current_ui.height / 2) - (height / 2),
        anchor = 'NW',
        style = 'minimal',
        focusable = false,
    }

    vim.api.nvim_open_win(buf, 1, opts)
end

M.hello()
M.popup()

return M
