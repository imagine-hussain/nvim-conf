vim.g.colors_name = "default_theme"
-- vim.g.colors_name="gruvbox-material"

package.loaded["default_theme"] = nil
package.loaded["default_theme.base"] = nil
package.loaded["default_theme.treesitter"] = nil
package.loaded["default_theme.lsp"] = nil
package.loaded["default_theme.others"] = nil

require "default_theme"
