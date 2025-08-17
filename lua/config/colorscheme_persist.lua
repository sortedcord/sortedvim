-- lua/config/colorscheme_persist.lua
local M = {}
local scheme_file = vim.fn.stdpath("state") .. "/last_colorscheme.txt"

function M.save(scheme)
  local f = io.open(scheme_file, "w")
  if f then
    f:write(scheme)
    f:close()
  end
end

function M.load()
  local f = io.open(scheme_file, "r")
  if f then
    local scheme = f:read("*l")
    f:close()
    if scheme and #scheme > 0 then
      -- Delay until after startup so the theme plugin is available
      vim.schedule(function()
        pcall(vim.cmd.colorscheme, scheme)
      end)
    end
  end
end

return M
