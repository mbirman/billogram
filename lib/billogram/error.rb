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

      if klass =  case status
                  when 400      then Billogram::BadRequest
                  when 401      then Billogram::Unauthorized
                  when 403      then Billogram::Forbidden
                  when 404      then Billogram::NotFound
                  when 500      then Billogram::InternalServerError
                  else               Billogram::Error
                  end
        klass.new(response)
      end
    end
  end
end
