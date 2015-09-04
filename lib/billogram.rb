require "httparty"
require "billogram/client"
require "billogram/error"
require "billogram/relation"
require "billogram/relation_builder"
require "billogram/resource"
require "billogram/resources/address"
require "billogram/resources/bookkeeping"
require "billogram/resources/callbacks"
require "billogram/resources/contact"
require "billogram/resources/customer"
require "billogram/resources/data"
require "billogram/resources/detailed_sums"
require "billogram/resources/domestic_bank_account"
require "billogram/resources/event"
require "billogram/resources/info"
require "billogram/resources/international_bank_account"
require "billogram/resources/invoice"
require "billogram/resources/invoice_defaults"
require "billogram/resources/item"
require "billogram/resources/regional_sweden"
require "billogram/resources/payment"
require "billogram/resources/settings"
require "billogram/resources/tax"
require "billogram/version"

require "billogram/inflections"

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
