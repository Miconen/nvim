local utils = require 'base.utils'
local maps = utils.get_mappings_template()

-- General
require 'base.mappings.general'(maps)

-- DAP
require 'base.mappings.debug'(maps)

-- Packages
require 'base.mappings.packages'(maps)

-- Telescope
require 'base.mappings.telescope'(maps)

-- Git
require 'base.mappings.git'(maps)

-- Miscellanous
require 'base.mappings.miscellaneous'(maps)

utils.set_mappings(maps)
