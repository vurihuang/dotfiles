-- -- Pull in the wezterm API
-- local wezterm = require("wezterm")
--
-- -- This table will hold the configuration.
-- local config = {
-- 	-- font = wezterm.font("Hack Nerd Font"),
-- 	-- font_size = 22,
-- 	color_scheme = "Darcula (base16)",
-- 	adjust_window_size_when_changing_font_size = false,
-- }
--
-- -- In newer versions of wezterm, use the config_builder which will
-- -- help provide clearer error messages
-- if wezterm.config_builder then
-- 	config = wezterm.config_builder()
-- end
--
-- -- This is where you actually apply your config choices
--
-- config.font = wezterm.font("Hack Nerd Font", { font_size = 26 })
--
-- -- and finally, return the configuration to wezterm
-- return config

local wezterm = require("wezterm")
local scheme = wezterm.get_builtin_color_schemes()["nord"]
local gpus = wezterm.gui.enumerate_gpus()

-- /etc/ssh/sshd_config
-- AcceptEnv TERM_PROGRAM_VERSION COLORTERM TERM TERM_PROGRAM WEZTERM_REMOTE_PANE
-- sudo systemctl reload sshd

---------------------------------------------------------------
--- functions
---------------------------------------------------------------
-- selene: allow(unused_variable)
---@diagnostic disable-next-line: unused-function, unused-local
local function enable_wayland()
	local session = os.getenv("DESKTOP_SESSION")
	if session == "hyprland" then
		return true
	end
	-- local wayland = os.getenv("XDG_SESSION_TYPE")
	-- if wayland == "wayland" then
	-- 	return true
	-- end
	return false
end

--- load local_config
-- Write settings you don't want to make public, such as ssh_domains
package.path = os.getenv("HOME") .. "/.local/share/wezterm/?.lua;" .. package.path
local function load_local_config(module)
	local m = package.searchpath(module, package.path)
	if m == nil then
		return {}
	end
	return dofile(m)
	-- local ok, _ = pcall(require, "local")
	-- if not ok then
	-- 	return {}
	-- end
	-- return require("local")
end

---------------------------------------------------------------
--- Config
---------------------------------------------------------------
local config = {
	font_size = 24,
	font = wezterm.font("CodeNewRoman Nerd Font Mono"),
	check_for_updates = true,
	use_ime = true,
	ime_preedit_rendering = "Builtin",
	use_dead_keys = false,
	warn_about_missing_glyphs = false,
	-- enable_kitty_graphics = false,
	animation_fps = 1,
	cursor_blink_ease_in = "Constant",
	cursor_blink_ease_out = "Constant",
	cursor_blink_rate = 0,
	enable_wayland = enable_wayland(),
	-- https://github.com/wez/wezterm/issues/1772
	-- enable_wayland = true,
	color_scheme = "Catppuccin Mocha",
	-- color_scheme = "Dracula (Official)",
	-- color_scheme = "cyberpunk",
	color_scheme_dirs = { os.getenv("HOME") .. "/.config/wezterm/colors/" },
	hide_tab_bar_if_only_one_tab = true,
	adjust_window_size_when_changing_font_size = false,
	selection_word_boundary = " \t\n{}[]()\"'`,;:│=&!%",
	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},
	use_fancy_tab_bar = false,
	colors = {
		tab_bar = {
		    -- hide_tab_bar_if_only_one_tab = true,
			background = scheme.background,
			new_tab = { bg_color = "#2e3440", fg_color = scheme.ansi[8], intensity = "Bold" },
			new_tab_hover = { bg_color = scheme.ansi[1], fg_color = scheme.brights[8], intensity = "Bold" },
			-- format-tab-title
			-- active_tab = { bg_color = "#121212", fg_color = "#FCE8C3" },
			-- inactive_tab = { bg_color = scheme.background, fg_color = "#FCE8C3" },
			-- inactive_tab_hover = { bg_color = scheme.ansi[1], fg_color = "#FCE8C3" },
		},
		selection_fg = 'none',
		selection_bg = 'rgba(50%, 50%, 50%, 50%)',
	},
	exit_behavior = "CloseOnCleanExit",
	tab_bar_at_bottom = false,
	window_close_confirmation = "AlwaysPrompt",
	window_background_opacity = 1,
	window_decorations = 'TITLE | RESIZE',
	-- visual_bell = {
	-- 	fade_in_function = "EaseIn",
	-- 	fade_in_duration_ms = 150,
	-- 	fade_out_function = "EaseOut",
	-- 	fade_out_duration_ms = 150,
	-- },
	-- separate <Tab> <C-i>
	enable_csi_u_key_encoding = true,
	leader = { key = "Space", mods = "CTRL|SHIFT" },
	webgpu_preferred_adapter = gpus[1],
	front_end = "OpenGL",
	keys = {
		{
			key = "1",
			mods = "CMD",
			action = wezterm.action.Multiple({
					wezterm.action.SendKey({mods = "CTRL",key = " "}),
					wezterm.action.SendKey({key = "1"})
			})
		},
		{
			key = "2",
			mods = "CMD",
			action = wezterm.action.Multiple({
					wezterm.action.SendKey({mods = "CTRL",key = " "}),
					wezterm.action.SendKey({key = "2"})
			})
		},
		{
			key = "3",
			mods = "CMD",
			action = wezterm.action.Multiple({
					wezterm.action.SendKey({mods = "CTRL",key = " "}),
					wezterm.action.SendKey({key = "3"})
			})
		},
		{
			key = "4",
			mods = "CMD",
			action = wezterm.action.Multiple({
					wezterm.action.SendKey({mods = "CTRL",key = " "}),
					wezterm.action.SendKey({key = "4"})
			})
		},
		{
			key = "5",
			mods = "CMD",
			action = wezterm.action.Multiple({
					wezterm.action.SendKey({mods = "CTRL",key = " "}),
					wezterm.action.SendKey({key = "5"})
			})
		},
		{
			key = "6",
			mods = "CMD",
			action = wezterm.action.Multiple({
					wezterm.action.SendKey({mods = "CTRL",key = " "}),
					wezterm.action.SendKey({key = "6"})
			})
		}
	},
}

for _, gpu in ipairs(wezterm.gui.enumerate_gpus()) do
	if gpu.backend == "Vulkan" and gpu.device_type == "IntegratedGpu" then
		config.webgpu_preferred_adapter = gpu
		config.front_end = "WebGpu"
		break
	end
end

-- don't like hyperlink in terminal
-- config.hyperlink_rules = {
-- 	-- Matches: a URL in parens: (URL)
-- 	{
-- 		regex = "\\((\\w+://\\S+)\\)",
-- 		format = "$1",
-- 		highlight = 1,
-- 	},
-- 	-- Matches: a URL in brackets: [URL]
-- 	{
-- 		regex = "\\[(\\w+://\\S+)\\]",
-- 		format = "$1",
-- 		highlight = 1,
-- 	},
-- 	-- Matches: a URL in curly braces: {URL}
-- 	{
-- 		regex = "\\{(\\w+://\\S+)\\}",
-- 		format = "$1",
-- 		highlight = 1,
-- 	},
-- 	-- Matches: a URL in angle brackets: <URL>
-- 	{
-- 		regex = "<(\\w+://\\S+)>",
-- 		format = "$1",
-- 		highlight = 1,
-- 	},
-- 	-- Then handle URLs not wrapped in brackets
-- 	{
-- 		-- Before
-- 		--regex = '\\b\\w+://\\S+[)/a-zA-Z0-9-]+',
-- 		--format = '$0',
-- 		-- After
-- 		regex = "[^(]\\b(\\w+://\\S+[)/a-zA-Z0-9-]+)",
-- 		format = "$1",
-- 		highlight = 1,
-- 	},
-- 	-- implicit mailto link
-- 	{
-- 		regex = "\\b\\w+@[\\w-]+(\\.[\\w-]+)+\\b",
-- 		format = "mailto:$0",
-- 	},
-- }
-- table.insert(config.hyperlink_rules, {
-- 	regex = [[["]?([\w\d]{1}[-\w\d]+)(/){1}([-\w\d\.]+)["]?]],
-- 	format = "https://github.com/$1/$3",
-- }}

return config
