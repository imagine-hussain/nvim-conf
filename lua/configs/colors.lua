-- Material Gruvox
vim.cmd('let g:gruvbox_material_foreground="material"')
vim.cmd('let g:gruvbox_material_background="hard"')


-- Kanagawa
-- Default options:
local kanagawa_ok, kanagawa = pcall(require, 'kanagawa')
if kanagawa_ok then
  kanagawa.setup({
      undercurl = true,           -- enable undercurls
      commentStyle = { italic = true },
      functionStyle = {},
      keywordStyle = { italic = true},
      statementStyle = { bold = true },
      typeStyle = {},
      variablebuiltinStyle = { italic = true},
      specialReturn = true,       -- special highlight for the return keyword
      specialException = true,    -- special highlight for exception handling keywords
      transparent = false,        -- do not set background color
      dimInactive = false,        -- dim inactive window `:h hl-NormalNC`
      globalStatus = false,       -- adjust window separators highlight for laststatus=3
      terminalColors = true,      -- define vim.g.terminal_color_{0,17}
      colors = {},
      overrides = {},
      theme = "default"           -- Load "default" theme or the experimental "light" theme
  })
end



-- set the actual theme
--[[ vim.cmd("colorscheme gruvbox-material") ]]
-- vim.cmd("colorscheme gruvbox-material")
--[[ vim.cmd('set background=light') ]]
--[[ vim.cmd("colorscheme gruvbox-material") ]]
vim.cmd([[colorscheme kanagawa]])

