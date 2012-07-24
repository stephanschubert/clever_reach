require "clever_reach/version"

module CleverReach
  autoload :Base,              'clever_reach/base'
  autoload :Configuration,     'clever_reach/configuration'
  autoload :Errors,            'clever_reach/errors'
  autoload :ResponseDecorator, 'clever_reach/response_decorator'

  def self.config
    Configuration.instance
  end

  def self.configure
    yield config
  end
end
