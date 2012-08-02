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
      options  = args.last.is_a?(Hash) ? args.pop : {}
      response = request(name, options)

      ResponseDecorator.new(response).tap do |r|
        raise Errors.lookup(r.status_code) unless r.valid?
      end
    end

    private # ----------------------------------------------

    def request(method_name, body)
      # The 'apiKey' MUST come first in the *ordered* hash.
      body = { 'apiKey' => @api_key }.merge(body)

      client.request(method_name) do
        soap.body = body
      end
    end

  end
end
