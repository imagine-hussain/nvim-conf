local status_ok, notify = pcall(require, "notify")
if status_ok then
  notify.setup(astronvim.user_plugin_opts("plugins.notify", { stages = "fade" }))
  vim.notify = function(msg, ...)
    -- Get clangd multiple offset error to be quiet
    if msg:match("offset_encodings") then
      return
    end
    notify(msg, ...)
  end

  --[[ vim.notify = notify ]]
  --[[ local notify = vim.notify ]]
  --[[ vim.notify = function(msg, ...) ]]
  --[[   if msg:match("multiple client offset_encodings detected for this buffer, this is not supported yet") then ]]
  --[[     return ]]
  --[[   end ]]
  --[[   notify(msg, ...) ]]
  --[[ end ]]
end


