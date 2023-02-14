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

local ayu_ok, _ = pcall(require, 'ayu')
if ayu_ok then
  vim.cmd[[set background=dark]]
  vim.cmd[[let g:ayucolor="mirage"]] -- for mirage version of theme
  vim.cmd[[let g:ayu_italic_comment = 1]] -- defaults to 0.
  vim.cmd[[let g:ayu_sign_contrast = 1]] -- " defaults to 0. If set to 1, SignColumn and FoldColumn will have a higher contrast instead of using the Normal background
  vim.cmd[[let g:ayu_extended_palette = 1]] -- " defaults to 0. If set to 1, enables extended palette. Adds more colors to some highlights (function keyword, loops, conditionals, imports)
end

-- Sonokai
vim.cmd[[let g:monokaipro_filter = 'espresso']]
-- vim.cmd[[let g:monokaipro_filter = 'machine']]
-- vim.cmd[[let g:monokaipro_filter = 'default']]
-- vim.cmd[[let g:monokaipro_filter = 'atlantis']]
-- vim.cmd[[let g:monokaipro_filter = 'andromeda']] -- noice
-- vim.cmd[[let g:monokaipro_filter = 'shusia']] -- mid
-- vim.cmd[[let g:monokaipro_filter = 'maia']]

-- set the actual theme
--[[ vim.cmd("colorscheme gruvbox-material") ]]
-- vim.cmd("colorscheme gruvbox-material")
--[[ vim.cmd('set background=light') ]]
vim.cmd([[colorscheme kanagawa]])

