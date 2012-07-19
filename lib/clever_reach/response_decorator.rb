module CleverReach
  class ResponseDecorator < SimpleDelegator

    def initialize(response)
      @response = response
    end

    def to_hash
      data = @response.body[response_hash_key][:return][:data]
      clean! data.dup
    end

    private

    def response_hash_key
      @response.body.keys.find { |k| k.to_s =~ /_response$/ }
    end

    def clean!(hash)
      hash.reject! do |k,v|
        if v.is_a? Hash
          clean!(v); false
        else
          k.to_s =~ /^@/
        end
      end
    end

  end
end
