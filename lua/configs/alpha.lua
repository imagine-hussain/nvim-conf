local status_ok, alpha = pcall(require, "alpha")
if status_ok then
  local alpha_button = astronvim.alpha_button
  alpha.setup(astronvim.user_plugin_opts("plugins.alpha", {
    layout = {
      { type = "padding", val = vim.fn.max { 2, vim.fn.floor(vim.fn.winheight(0) * 0.2) } },
      {
        type = "text",
        val = astronvim.user_plugin_opts("header", {
          "                      ███    ██ ██    ██ ██ ███    ███     ",
          "                      ████   ██ ██    ██ ██ ████  ████     ",
          "                      ██ ██  ██ ██    ██ ██ ██ ████ ██     ",
          "                      ██  ██ ██  ██  ██  ██ ██  ██  ██     ",
          "                      ██   ████   ████   ██ ██      ██     ",
          "",
          "  The Electron Revolution and its consequences have been a disaster for the",
          " human race.  They have greatly increased the convenience of those of us who",
          "   use 'advanced' editors, they have destabilized society, have made life",
          "    unfulfilling, have subjected human beings to indignities, have led to",
          "      widespread psychological suffering - in the Third World, hardware",
          " suffering as well - and have inflicted severe damage on the natural world.",
          "     The continued development of technology will worsen the situation.",
          " It will certainly subject human being to greater indignities and inflict",
          "  greater damage on the natural world, it will probably lead to greater",
          "    social disruption and psychological suffering, and it may lead to",
          "             increased physical a even for 'advanced' hardware.",
        }, false),
        opts = { position = "center", hl = "DashboardHeader" },
      },
      { type = "padding", val = 5 },
      {
        type = "group",
        val = {
          alpha_button("LDR f f", "  Find File  "),
          alpha_button("LDR f o", "  Recents  "),
          alpha_button("LDR f w", "  Find Word  "),
          alpha_button("LDR f n", "  New File  "),
          alpha_button("LDR f m", "  Bookmarks  "),
          alpha_button("LDR S l", "  Last Session  "),
        },
        opts = { spacing = 1 },
      },
    },
    opts = {},
  }))
end
-- " █████  ███████ ████████ ██████   ██████",
-- "██   ██ ██         ██    ██   ██ ██    ██",
-- "███████ ███████    ██    ██████  ██    ██",
-- "██   ██      ██    ██    ██   ██ ██    ██",
-- "██   ██ ███████    ██    ██   ██  ██████",
-- " ",
--
