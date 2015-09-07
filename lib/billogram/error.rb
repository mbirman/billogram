module Billogram
  class Error < StandardError

    class BadRequest < Error; end
    class Unauthorized < Error; end
    class Forbidden < Error; end
    class NotFound < Error; end
    class InternalServerError < Error; end

    def self.from_response(response)
      if klass =  case response.code.to_i
                  when 400      then BadRequest
                  when 401      then Unauthorized
                  when 403      then Forbidden
                  when 404      then NotFound
                  when 500      then InternalServerError
                  else               Billogram::Error
                  end
        klass.new(response["data"]["message"])
      end
    end
  end
end
