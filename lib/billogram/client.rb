module Billogram
  class Client
    include HTTParty

    extend Forwardable

    delegate [:get, :post, :put, :delete] => self

    format :json

    def initialize(username, password, base_uri)
      self.class.default_options.merge!(base_uri: base_uri, basic_auth: {username: username, password: password})
    end
  end
end
