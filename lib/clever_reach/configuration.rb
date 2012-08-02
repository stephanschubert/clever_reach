require 'singleton'

module CleverReach
  class Configuration
    include Singleton

    @@defaults = {
      wsdl_url: 'http://api.cleverreach.com/soap/interface_v5.1.php?wsdl'
    }

    attr_accessor :wsdl_url, :api_key, :list_id

    def self.defaults
      @@defaults
    end

    def initialize
      @@defaults.each { |k,v| send("#{k}=", v) }
    end
  end
end
