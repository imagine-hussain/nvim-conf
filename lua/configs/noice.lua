local status_ok, noice = pcall(require, "noice")

if not status_ok then
  return
end

-- override the default split view to always enter the split when it opens
noice.setup({
  cmdline = {
    view = "cmdline_popup", -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
    opts = { buf_options = { filetype = "vim" } }, -- enable syntax highlighting in the cmdline
    icons = {
      ["/"] = { icon = " ", hl_group = "DiagnosticWarn" },
      ["?"] = { icon = " ", hl_group = "DiagnosticWarn" },
      [":"] = { icon = " ", hl_group = "DiagnosticInfo", firstc = false },
    },
  },
  history = {
    -- options for the message history that you get with `:Noice`
    view = "split",
    opts = { enter = true },
    filter = { event = "msg_show", ["not"] = { kind = { "search_count", "echo" } } },
  },
  throttle = 1000 / 30, -- how frequently does Noice need to check for ui updates? This has no effect when in blocking mode.
  ---@type table<string, NoiceViewOptions>
  views = {}, -- @see the section on views below
  ---@type NoiceRouteConfig[]
  routes = {}, -- @see the section on routes below
  ---@type table<string, NoiceFilter>
  status = {}, --@see the section on statusline components below
})
