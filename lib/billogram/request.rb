# frozen_string_literal: true

module Billogram
  class Request
    attr_reader :url, :type, :params

    def initialize(type, url, params = {})
      @url = url
      @type = type
      @params = params
    end

    def content
      case type
      when :post, :put
        { body: params.to_json }
      when :get
        { query: params }
      when :delete
        {}
      end
    end

    def execute
      response.success? ? response['data'] : raise_from(response)
    end

    def raise_from(response)
      raise Billogram::Error.from_response(response)
    end

    def response
      @response ||= Billogram.client.send(type, "/#{url}", content)
    end
  end
end
