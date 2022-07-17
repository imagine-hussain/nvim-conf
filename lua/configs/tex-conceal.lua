
vim.cmd("hi Conceal ctermbg=None")
vim.cmd("set conceallevel=1")

-- a = accents/ligatures
-- b = bold and italic
-- d = delimiters
-- m = math symbols
-- g = Greek
-- s = superscripts/subscripts
vim.cmd("let g:tex_conceal='abdmsg'")
-- inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
