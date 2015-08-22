module Billogram
  class Client
    include HTTParty
    format :json

    def initialize(username, password, base_uri)
      self.class.default_options.merge!(base_uri: base_uri, basic_auth: {username: username, password: password})
    end

    def get(*args)
      handle_request(:get, *args)
    end

    def post(*args)
      handle_request(:post, *args)
    end

    def put(*args)
      handle_request(:put, *args)
    end

    def delete(*args)
      handle_request(:delete, *args)
    end

    def handle_request(method, *args)
      response = self.class.send(method, *args)
      return response if response.code == 200
      raise Billogram::Error.from_response(response)
    end
  end
end
