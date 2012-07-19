require 'savon'

module CleverReach
  class Base
    attr_reader :api_key

    def initialize
      @api_key = CleverReach.config.api_key
    end

    def client
      @client ||= Savon.client(CleverReach.config.wsdl_url)
    end

    def method_missing(name, *args)
      options = args.last.is_a?(Hash) ? args.pop : {}
      options.update api_key: @api_key

      resp = client.request(name, options)
      ResponseDecorator.new(resp)
    end

  end
end
