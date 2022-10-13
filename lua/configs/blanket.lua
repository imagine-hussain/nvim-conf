local status_ok, blanket = pcall(require, "blanket")
if not status_ok then
  return
end

blanket.setup{
    -- can use env variables and anything that could be interpreted by expand(), see :h expandcmd()
    -- OPTIONAL
    report_path = vim.fn.getcwd().."/target/site/jacoco/jacoco.xml",
    -- refresh gutter every time we enter java file
    -- defauls to empty - no autocmd is created
    filetypes = "java",
    -- for debugging purposes to see whether current file is present inside the report
    -- defaults to false
    silent = true,
    -- can set the signs as well
    signs = {
        priority = 10,
        incomplete_branch = "█",
        uncovered = "█",
        covered = "█",
        sign_group = "Blanket"
    },
}

