-- This is necessary for VimTeX to load properly. The "indent" is optional.
-- Note that most plugin managers will do this automatically.
vim.cmd("filetype plugin indent on")

-- This enables Vim's and neovim's syntax-related features. Without this, some
-- VimTeX features will not work (see ":help vimtex-requirements" for more
-- info).
vim.cmd("syntax enable")

vim.cmd("let g:vimtex_quick_fix_mode = 0")

vim.cmd("let g:vimtex_syntax_conceal_disable=0")

vim.cmd([[let g:vimtex_syntax_conceal = {
          \ 'accents': 1,
          \ 'cites': 1,
          \ 'fancy': 1,
          \ 'greek': 1,
          \ 'math_bounds': 1,
          \ 'math_delimiters': 1,
          \ 'math_fracs': 1,
          \ 'math_super_sub': 1,
          \ 'math_symbols': 1,
          \ 'sections': 0,
          \ 'styles': 1,
          \}]])
vim.cmd("g:vimtex_syntax_enabled")
vim.cmd("g:vimtex_syntax_nested")
vim.cmd("g:vimtex_syntax_autoload_packages")
vim.cmd("let g:tex_flavor='latex'")

-- Viewer options: One may configure the viewer either by specifying a built-in
-- viewer method:
-- vim.cmd("let g:vimtex_view_method = 'zathura'")

-- Or with a generic interface:
-- vim.cmd("let g:vimtex_view_general_viewer = 'okular'")
-- vim.cmd("let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'")

-- VimTeX uses latexmk as the default compiler backend. If you use it, which is
-- strongly recommended, you probably don't need to configure anything. If you
-- want another compiler backend, you can change it as follows. The list of
-- supported backends and further explanation is provided in the documentation,
-- see ":help vimtex-compiler".
-- vim.cmd("let g:vimtex_compiler_method = 'latexrun'")

-- Most VimTeX mappings rely on localleader and this can be changed with the
-- following line. The default is usually fine and is the symbol "\".
-- let maplocalleader = ","
