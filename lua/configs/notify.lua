local status_ok, notify = pcall(require, "notify")

local supress_list = {
  "offset_encodings", -- clangd multiple offset error when multiple lsp's attached
  "Client 1 quit with exit code 1 and signal 0", -- JDTLS Cringe
  "Error running config for nvim%-jdtls: /Users/hussainnawaz/", -- Bad JDTLS config
}

if status_ok then
  notify.setup {
    stages = "fade",
  }

  vim.notify = function(msg, ...)
    for _, v in ipairs(supress_list) do
      if msg:match(v) then
        return
      end
    end
    notify(msg, ...)
  end
end

