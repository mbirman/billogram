require "httparty"
require "billogram/client"
require "billogram/resource"
require 'billogram/resources/customer'
require 'billogram/resources/invoice'
require 'billogram/resources/item'
require "billogram/version"

module Billogram
  class << self
    attr_accessor :username, :password, :base_uri

    def client
      @client ||= Client.new(username, password, base_uri)
    end

    def configure
      yield self if block_given?
    end
  end
end
