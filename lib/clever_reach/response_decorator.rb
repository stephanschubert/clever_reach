module CleverReach
  class ResponseDecorator < SimpleDelegator

    def initialize(response)
      @response = response
    end

    def to_hash
      data = @response.body[response_hash_key][:return][:data]
      data.reject { |k,v| k.to_s =~ /^@/ }
    end

    private

    def response_hash_key
      @response.body.keys.find { |k| k.to_s =~ /_response$/ }
    end

  end
end
