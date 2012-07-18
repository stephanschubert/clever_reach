require "cleverreach/version"

module Cleverreach
  autoload :Configuration, 'cleverreach/configuration'

  def self.config
    Configuration.instance
  end

  def self.configure
    yield config
  end
end
