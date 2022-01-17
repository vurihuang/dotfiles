local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end

local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {
	-- [[                               __                ]],
	-- [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
	-- [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
	-- [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
	-- [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
	-- [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
  --  [[
  [[                                                           ]],
  [[      _____                                                ]],
  [[     /  _  \__  _  __ ____   __________   _____   ____     ]],
  [[    /  /_\  \ \/ \/ // __ \ /  ___/  _ \ /     \_/ __ \    ]],
  [[   /    |    \     /\  ___/ \___ (  <_> )  Y Y  \  ___/    ]],
  [[   \____|__  /\/\_/  \___  >____  >____/|__|_|  /\___  >   ]],
  [[           \/            \/     \/            \/     \/    ]],
  [[                                                           ]],
}
dashboard.section.buttons.val = {
	dashboard.button("r", "  Recent files", ":Telescope oldfiles <cr>"),
	dashboard.button("f", "  Find file", ":Telescope find_files <cr>"),
	dashboard.button("t", "  Find text", ":Telescope live_grep <cr>"),
	dashboard.button("p", "  Find project", "Telescope projects<cr>"),
	dashboard.button("C", "©  Config", ":e ~/.config/nvim/init.lua <cr>"),
  dashboard.button('P', '♇  Plugin', ':e ~/.config/nvim/lua/user/plugins.lua <cr>'),
	dashboard.button("q", "Quit", ":qa<CR>"),
}

local function footer()
-- NOTE: requires the fortune-mod package to work
	-- local handle = io.popen("fortune")
	-- local fortune = handle:read("*a")
	-- handle:close()
	-- return fortune
	return "https://github.com/upeoe"
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
-- vim.cmd([[autocmd User AlphaReady echo 'ready']])
alpha.setup(dashboard.opts)

