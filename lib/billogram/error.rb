module Billogram
  class Error < StandardError

    class BadRequest < Error; end
    class Unauthorized < Error; end
    class Forbidden < Error; end
    class NotFound < Error; end
    class InternalServerError < Error; end

    def self.from_response(response)
      status  = response.response.code.to_i
      body    = response.body.to_s
      headers = response.headers
      message = error_message(response)

      if klass =  case status
                  when 400      then BadRequest
                  when 401      then Unauthorized
                  when 403      then Forbidden
                  when 404      then NotFound
                  when 500      then InternalServerError
                  else               Billogram::Error
                  end
        klass.new(message)
      end
    end

    private

    def self.error_message(response)
      if data = response["data"]
        data.fetch("message", "")
      end
    end
  end
end
