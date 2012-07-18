require "clever_reach/version"

module CleverReach
  autoload :Configuration, 'clever_reach/configuration'
  autoload :Client, 'clever_reach/client'

  def self.config
    Configuration.instance
  end

  def self.configure
    yield config
  end
end
