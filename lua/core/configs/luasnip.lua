-- Cringe

local luasnip_opts = {
  -- Add paths for including more VS Code style snippets in luasnip
  vscode_snippet_paths = {},
  -- Extend filetypes
  filetype_extend = {
    javascript = { "javascriptreact" },
  },
}

local loader_avail, loader = pcall(require, "luasnip/loaders/from_vscode")
if loader_avail then
  if luasnip_opts.vscode_snippet_paths ~= nil then
    loader.lazy_load { paths = luasnip_opts.vscode_snippet_paths }
  end
  loader.lazy_load()
end

local luasnip_avail, luasnip = pcall(require, "luasnip")

if not luasnip_avail then
  return
end

if type(luasnip_opts.filetype_extend) == "table" then
  for filetype, snippets in pairs(luasnip_opts.filetype_extend) do
    luasnip.filetype_extend(filetype, snippets)
  end
end
