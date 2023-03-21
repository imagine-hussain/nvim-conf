local _M = {}

function _M.add_cmp_source(source)
  local cmp_ok, cmp = pcall(require, "cmp")
  if cmp_ok then
    local config = cmp.get_config()
    table.insert(config.sources, source)
    cmp.setup(config)
  end
end

function _M.conditional_func(condition, func, ...)
  if (condition == nil and true or condition) and type(func) == "function" then
    return func(...)
  end
end

return _M
