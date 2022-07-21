-- use {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'}

vim.o.foldcolumn = '1'
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = -1
vim.o.foldenable = true

-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

-- option 1: coc.nvim as LSP client
-- use {'neoclide/coc.nvim', branch = 'master', run = 'yarn install --frozen-lockfile'}
-- require('ufo').setup()
--

-- option 2: nvim lsp as LSP client
-- tell the server the capability of foldingRange
-- nvim hasn't added foldingRange to default capabilities, users must add it manually
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.foldingRange = {
--     dynamicRegistration = false,
--     lineFoldingOnly = true
-- }
-- local language_servers = {} -- like {'gopls', 'clangd'}
-- for _, ls in ipairs(language_servers) do
--     require('lspconfig')[ls].setup({
--         capabilities = capabilities,
--         other_fields = ...
--     })
-- end
-- require('ufo').setup()
--

-- option 3: treesitter as a main provider instead
local status_ok, ufo = pcall(require, "ufo")
if status_ok then
  ufo.setup(astronvim.user_plugin_opts("plugins.ufo", {
  provider_selector = function(bufnr, filetype, buftype)
    if bufnr >= 10000 then
      return ""
    end
    if filetype == "latex" then
      return ""
    end
    if buftype == "help" then
      return ""
    end
  -- provider_selector = function()
    return {'treesitter', 'indent'}
  end,
  }))
end
--

-- option 4: disable all providers for all buffers
-- Not recommend, AFAIK, the ufo's providers are the best performance in Neovim
-- require('ufo').setup({
--     provider_selector = function(bufnr, filetype, buftype)
--         return ''
--     end
-- })
