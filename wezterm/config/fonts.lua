local wezterm = require("wezterm")
local font = "ComicShannsMono Nerd Font"

return {
	font_size = 24,
	font = wezterm.font(font),
	freetype_load_target = "Normal", ---@type 'Normal'|'Light'|'Mono'|'HorizontalLcd'
	freetype_render_target = "Normal", ---@type 'Normal'|'Light'|'Mono'|'HorizontalLcd'
}
