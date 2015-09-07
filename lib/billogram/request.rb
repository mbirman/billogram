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
      Billogram.client.send(type, url, content)
    end
  end
end
