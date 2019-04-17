require 'fileutils'
require_relative 'lib/config'
require_relative 'lib/core'

module Woodsh
  CONFIG = Config.new('config').freeze

  Core.setup()
  Core.start()
end
