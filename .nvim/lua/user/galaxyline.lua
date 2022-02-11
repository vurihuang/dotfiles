local gl = require('galaxyline')
local gps = require('nvim-gps')
local gls = gl.section
local condition = require('galaxyline.condition')
local provider_buffer = require('galaxyline.providers.buffer')
local provider_fileinfo = require('galaxyline.providers.fileinfo')

gl.short_line_list = {'NvimTree','vista','dbui','packer'}

local colors = {
  bg = "#282c34",
  yellow = "#fabd2f",
  cyan = "#008080",
  darkblue = "#081633",
  green = "#afd700",
  orange = "#FF8800",
  purple = "#5d4d7a",
  magenta = "#d16d9e",
  grey = "#c0c0c0",
  blue = "#0087d7",
  red = "#ec5f67",
  violet = "#a9a1e1",
}

local mode_colors = {
	c  = colors.magenta, ['!'] = colors.red,
	i  = colors.green,   ic    = colors.yellow, ix     = colors.yellow,
	n  = colors.blue,
	no = colors.blue,    nov   = colors.blue,   noV    = colors.blue,
	r  = colors.cyan,    rm    = colors.cyan,   ['r?'] = colors.cyan,
	R  = colors.purple,  Rv    = colors.purple,
	s  = colors.orange,  S     = colors.orange, ['']   = colors.orange,
	t  = colors.purple,
	v  = colors.red,     V     = colors.red,
}

local mode_icons = {
	c = '🅒 ', ['!'] = '🅒 ',
	i = '🅘 ', ic    = '🅘 ', ix     = '🅘 ',
	n = '🅝 ',
	R = '🅡 ', Rv    = '🅡 ',
	r = '🅡 ', rm    = '🅡 ', ['r?'] = '🅡 ',
	s = '🅢 ', S     = '🅢 ',
	t = '🅣 ',
	v = '🅥 ', V     = '🅥 ', ['']   = '🅥 ',
}

local num_icons = {'➊ ', '❷ ', '➌ ', '➍ ', '➎ ', '➏ ', '➐ ', '➑ ', '➒ ', 'ﳁ '}

local function get_filename()
  local file = vim.fn.expand('%:.')
  if vim.fn.empty(file) == 1 then return '' end
  return file
end

local function get_file_ext_icon()
  if vim.bo.filetype == 'help' then
    return ''
  end
  local icon = ''
  local color = ''
  if vim.bo.readonly then
    icon = ''
    color = colors.yellow
  end
  if vim.bo.modifiable then
    if vim.bo.modified then
      icon = ''
      color = colors.orange
    end
  end
  if string.len(color) ~= 0 then
      vim.api.nvim_command('hi GalaxyFileExtIcon guifg=' .. color .. ' guibg=' .. colors.bg)
  end
  return icon
end

-- bar left
gls.left[1] = {
  RainbowRed = {
    provider = function() return '▊ ' end,
    highlight = {colors.blue,colors.bg}
  },
}

gls.left[2] = {
  ViMode = {
    provider = function()
      local color = ''
      local icon = ''
      if mode_colors[vim.fn.mode()] == nil then
        color = mode_colors['']
        icon = mode_icons['']
      else
        color = mode_colors[vim.fn.mode()]
        icon = mode_icons[vim.fn.mode()]
      end

      vim.api.nvim_command('hi GalaxyViMode guifg=' .. color .. ' guibg=' .. colors.bg)
      return icon .. num_icons[math.min(10, provider_buffer.get_buffer_number())]
    end,
  },
}

gls.left[3] ={
  FileIcon = {
    provider = 'FileIcon',
    condition = condition.buffer_not_empty,
    highlight = {provider_fileinfo.get_file_icon_color,colors.bg},
  },
}

gls.left[4] = {
  FileName = {
    provider = function()
      return get_filename()
    end,
    condition = condition.buffer_not_empty,
    highlight = {colors.fg,colors.bg,'bold'},
    separator = ' ',
  }
}

gls.left[5] = {
  FileExtIcon = {
    provider = function()
      return get_file_ext_icon()
    end,
    condition = condition.buffer_not_empty,
    highlight = {colors.fg,colors.bg,'bold'},
    separator = ' ',
  }
}

gls.left[6] = {
  GPS = {
    provider = function()
      return gps.get_location()
    end,
    condition = function()
      return gps.is_available()
    end,
    separator = ' ',
  }
}

gls.left[7] = {
  DiagnosticError = {
    provider = 'DiagnosticError',
    icon = '  ',
    highlight = {colors.red,colors.bg}
  }
}
gls.left[8] = {
  DiagnosticWarn = {
    provider = 'DiagnosticWarn',
    icon = '  ',
    highlight = {colors.yellow,colors.bg},
  }
}

gls.left[9] = {
  DiagnosticHint = {
    provider = 'DiagnosticHint',
    icon = '  ',
    highlight = {colors.cyan,colors.bg},
  }
}

gls.left[10] = {
  DiagnosticInfo = {
    provider = 'DiagnosticInfo',
    icon = '  ',
    highlight = {colors.blue,colors.bg},
  }
}

-- bar right
gls.right[1] = {
  GitIcon = {
    provider = function() return '  ' end,
    condition = condition.check_git_workspace,
    separator = ' ',
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.violet,colors.bg,'bold'},
  }
}

gls.right[2] = {
  GitBranch = {
    provider = 'GitBranch',
    condition = condition.check_git_workspace,
    highlight = {colors.violet,colors.bg,'bold'},
  }
}

gls.right[3] = {
  DiffAdd = {
    provider = 'DiffAdd',
    condition = condition.hide_in_width,
    separator = ' ',
    icon = ' ', -- no need margin left.
    highlight = {colors.green,colors.bg},
  }
}
gls.right[4] = {
  DiffModified = {
    provider = 'DiffModified',
    condition = condition.hide_in_width,
    icon = '  ',
    highlight = {colors.orange,colors.bg},
  }
}
gls.right[5] = {
  DiffRemove = {
    provider = 'DiffRemove',
    condition = condition.hide_in_width,
    icon = '  ',
    highlight = {colors.red,colors.bg},
  }
}

gls.right[6] = {
  LineInfo = {
    provider = 'LineColumn',
    separator = ' ',
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.fg,colors.bg},
  },
}

gls.right[7] = {
  ScrollBar = {
    provider = 'LinePercent',
    separator = ' ',
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.fg,colors.bg,'bold'},
  }
}

gls.right[8] = {
  RainbowBlue = {
    provider = function() return ' ▊' end,
    highlight = {colors.blue,colors.bg}
  },
}

-- short line
gls.short_line_left[1] = {
  BufferType = {
    provider = 'FileTypeName',
    separator = ' ',
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.blue,colors.bg,'bold'}
  }
}

gls.short_line_left[2] = {
  SFileName = {
    provider =  'SFileName',
    condition = condition.buffer_not_empty,
    highlight = {colors.fg,colors.bg,'bold'}
  }
}

gls.short_line_right[1] = {
  BufferIcon = {
    provider= 'BufferIcon',
    highlight = {colors.fg,colors.bg}
  }
}

