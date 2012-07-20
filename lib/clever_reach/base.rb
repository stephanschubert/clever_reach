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

      # The 'apiKey' MUST come first in the *ordered* hash.
      body = { 'apiKey' => @api_key }.merge(options)

      resp = client.request(name) do
        soap.body = body
      end

      ResponseDecorator.new(resp)
    end

  end
end
