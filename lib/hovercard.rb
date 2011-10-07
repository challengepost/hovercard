require "active_support/dependencies"

module Hovercard

  mattr_accessor :app_root

  def self.setup
    yield self
  end

end

require "hovercard/engine"