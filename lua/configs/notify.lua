local status_ok, notify = pcall(require, "notify")

local silenced = {
  "offset_encodings", -- clangd multiple offset error when multiple lsp's attached
  --[[ "Client 1 quit with exit code 1 and signal 0", -- Why is java lsp trying to attach to .py files? ]]
  --[[ "Error running config for nvim%-jdtls: /Users/hussainnawaz/", -- Bad JDTLS config ]]
  "message with no corresponding", -- `end` with no `start`- -- java
}

if status_ok then
  notify.setup {
    stages = "fade",
  }

  vim.notify = function(msg, ...)
    for _, v in ipairs(silenced) do
      if msg:match(v) then
        return
      end
    end
    notify(msg, ...)
  end
end

