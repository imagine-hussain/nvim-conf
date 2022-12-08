local status_ok, extensions = pcall(require, "lsp_extension")

if not status_ok then
  return
end

extensions.inlay_hints {
  highlight = "Comment",
  prefix = " » ",
  aligned = false,
  only_current_line = false,
  enabled = {
      "TypeHint",
      "ChainingHint",
      "ParameterHint"
  },
}
--[[ nnoremap <Leader>T :lua require'lsp_extensions'.inlay_hints() ]]

-- Run when opening new file or new buffer
vim.cmd[[autocmd BufEnter,BufWinEnter,TabEnter *.rs :lua require'lsp_extensions'.inlay_hints{}]]


