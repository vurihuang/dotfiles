local Config = require('config')

return Config:init()
    :append(require('config.default'))
    :append(require('config.appearance'))
    :append(require('config.fonts')).options
