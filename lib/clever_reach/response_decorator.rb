module CleverReach
  class ResponseDecorator < SimpleDelegator

    def initialize(response)
      super
      @response = response
    end

    def valid?
      # Let's be flexible when checking for the status.
      answer_hash[:status] =~ /success/i
    end

    def status_code
      answer_hash[:statuscode].to_i
    end

    def to_hash
      data = answer_hash[:data]
      clean! data.dup
    end

    private # ----------------------------------------------

    def response_hash_key
      @response.body.keys.find { |k| k.to_s =~ /_response$/ }
    end

    def answer_hash
      @response.body[response_hash_key][:return]
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
