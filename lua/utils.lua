local api = vim.api

local M = {}

function M.fzy_edit_ag_selection(selection)
  if not selection then
    return
  end
  local parts = vim.split(selection, ":")
  local path, line = parts[1], parts[2]
  vim.cmd("e +" .. line .. " " .. path)
end

-- local map helper
local function map(mode, key, result, opts, defaults)
  opts = vim.tbl_extend("force", { silent = true }, defaults or {}, opts or {})
  return api.nvim_set_keymap(mode, key, result, opts)
end

-- normal mode
function M.nmap(key, result, opts)
  return map("n", key, result, opts)
end
-- visual and select mode
function M.vmap(key, result, opts)
  return map("v", key, result, opts)
end
-- visual mode
function M.xmap(key, result, opts)
  return map("x", key, result, opts)
end
-- operator pending mode
function M.omap(key, result, opts)
  return map("o", key, result, opts)
end
-- select mode
function M.smap(key, result, opts)
  return map("s", key, result, opts)
end

function M.nnoremap(key, result, opts)
  return map("n", key, result, opts, { noremap = true })
end
function M.vnoremap(key, result, opts)
  return map("v", key, result, opts, { noremap = true })
end
function M.xnoremap(key, result, opts)
  return map("x", key, result, opts, { noremap = true })
end
function M.inoremap(key, result, opts)
  return map("i", key, result, opts, { noremap = true })
end
function M.onoremap(key, result, opts)
  return map("o", key, result, opts, { noremap = true })
end
function M.snoremap(key, result, opts)
  return map("s", key, result, opts, { noremap = true })
end

return M
