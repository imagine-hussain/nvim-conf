local status_ok, notify = pcall(require, "notify")

--[[ if status_ok then ]]
--[[   notify.setup { ]]
--[[     stages = "fade", ]]
--[[   } ]]
--[[   vim.notify = notify ]]
--[[ end ]]

if status_ok then
  notify.setup {
    stages = "fade",
  }

  vim.notify = function(msg, ...)
    -- Get clangd multiple offset error to be quiet
    if msg:match("offset_encodings") then
      return
    end
    -- From JDTLS
    if msg:match("with no corresponding") then
      return
    end

    -- bad attaches
    if msg:match("Client 1 quit with exit code 1 and signal 0") then
      return
    end

    notify(msg, ...)
  end
end


--[[ vim.notify = notify ]]
--[[ local notify = vim.notify ]]
--[[ vim.notify = function(msg, ...) ]]
--[[   if msg:match("multiple client offset_encodings detected for this buffer, this is not supported yet") then ]]
--[[     return ]]
--[[   end ]]
--[[   notify(msg, ...) ]]
--[[ end ]]



