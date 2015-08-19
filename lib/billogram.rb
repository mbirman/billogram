require "httparty"
require "billogram/client"
require "billogram/error"
require "billogram/relation_builder"
require "billogram/resource"
require 'billogram/resources/address'
require 'billogram/resources/bookkeeping'
require 'billogram/resources/callback'
require 'billogram/resources/contact'
require 'billogram/resources/customer'
require 'billogram/resources/data'
require 'billogram/resources/delivery_address'
require 'billogram/resources/event'
require 'billogram/resources/info'
require 'billogram/resources/invoice'
require 'billogram/resources/item'
require 'billogram/resources/regional_sweden'
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
