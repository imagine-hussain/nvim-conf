local status_ok, indent_o_matic = pcall(require, "indent-o-matic")

if status_ok then
  indent_o_matic.setup {

    -- Skip multi-line comments / strings when reading because
    -- those can be misleading
    skip_multiline = true,

    -- How many lines it will read before giving up and falling back
    max_lines = 2048,

    -- Global (used as a fallback)
    standard_widths = { 2, 4, 8 },

    -- C: Only 3, 4, 8
    filetype_c = { 3, 4, 8 },

    filetype_out = {
      -- Don't try to add indentation
      max_lines = 0,
    },

    -- Default (for when no filetype detected)
    filetype_ = { 2, 4 },
  }
end
