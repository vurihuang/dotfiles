return {
  "goolord/alpha-nvim",
  opts = function()
    local dashboard = require("alpha.themes.dashboard")
    dashboard.section.header.val = {
      [[                                                           ]],
      [[      _____                                                ]],
      [[     /  _  \__  _  __ ____   __________   _____   ____     ]],
      [[    /  /_\  \ \/ \/ // __ \ /  ___/  _ \ /     \_/ __ \    ]],
      [[   /    |    \     /\  ___/ \___ (  <_> )  Y Y  \  ___/    ]],
      [[   \____|__  /\/\_/  \___  >____  >____/|__|_|  /\___  >   ]],
      [[           \/            \/     \/            \/     \/    ]],
      [[                                                           ]],
    }
  end,
}
