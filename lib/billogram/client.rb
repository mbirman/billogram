module Billogram
  class Client
    include HTTParty
    format :json

    def initialize(username, password, base_uri)
      self.class.default_options.merge!(base_uri: base_uri, basic_auth: {username: username, password: password})
    end

    def get(*args)
      self.class.get(*args)
    end
  end
end
