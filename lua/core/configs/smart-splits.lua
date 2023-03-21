local status_ok, smart_splits = pcall(require, "smart-splits")
if status_ok then
  smart_splits.setup {
    ignored_filetypes = {
      "nofile",
      "quickfix",
      "qf",
      "prompt",
    },
    ignored_buftypes = { "nofile" },
  }
end
