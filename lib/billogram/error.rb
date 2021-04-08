module Billogram
  class Error < StandardError

    class BadRequest < Error; end
    class Unauthorized < Error; end
    class Forbidden < Error; end
    class NotFound < Error; end
    class InternalServerError < Error; end

    class << self
      def from_response(response)
        message = response["data"]&.[]("message")
        error_class(response).new(message)
      end

      def error_class(response)
        case response.code.to_i
        when 400  then BadRequest
        when 401  then Unauthorized
        when 403  then Forbidden
        when 404  then NotFound
        when 500  then InternalServerError
        else           Billogram::Error
        end
      end
    end
  end
end
