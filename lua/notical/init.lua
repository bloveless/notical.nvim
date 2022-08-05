M = {}

M.setup = function()
  vim.keymap.set('n', '<leader>no', M.popup, { silent = true })
  vim.keymap.set('n', '<leader>nr', function()
    require('notical.dev').clear()
    require('notical').setup()
    require('notical').popup()
  end, { silent = true })
end

M.popup = function()
  local width = 50
  local height = 10
  local buf = vim.api.nvim_create_buf(false, true)

  local current_ui = vim.api.nvim_list_uis()[1]

  local closing_keys = { '<esc>', '<cr>', '<leader>' }
  for _, key in pairs(closing_keys) do
    vim.api.nvim_buf_set_keymap(buf, 'n', key, '<cmd>close<cr>', { silent = true, nowait = true, noremap = true })
  end

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

  local lines = {
    'These', 'are', 'some', 'test', 'lines'
  }

  vim.api.nvim_buf_set_option(buf, 'modifiable', true)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
  vim.api.nvim_buf_set_option(buf, 'modifiable', false)
  vim.api.nvim_open_win(buf, 1, opts)
end

return M
