local function load_fail_error(file, err)
  vim.api.nvim_err_writeln(
    "Failed to load " .. file .. "\n\n" .. "Error Message: " .. err
  )
end

_G.utils = require "utils"

local function main()
  for _, source_file in ipairs {
    "core.settings",
    "core.lazy",
    "core.mappings",
    -- "core.autocmds",
    "core.colours",
  } do
    local status_ok, err = pcall(require, source_file)
    if not status_ok then
      load_fail_error(source_file, err)
    end
  end
end

main()
