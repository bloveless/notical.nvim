local M = {}

M.clear = function()
  for key, _ in pairs(package.loaded) do
    if string.sub(key, 1, 7) == 'notical' then
      package.loaded[key] = nil
    end
  end
end

return M
