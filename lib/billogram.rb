require 'httparty'
require 'billogram/client'
require 'billogram/endpoint'
require 'billogram/error'
require 'billogram/relation'
require 'billogram/relation_builder'
require 'billogram/resource'
require 'billogram/request'
require 'billogram/resources/address'
require 'billogram/resources/automatic_reminder'
require 'billogram/resources/automatic_collection'
require 'billogram/resources/bookkeeping'
require 'billogram/resources/bookkeeping_object'
require 'billogram/resources/callbacks'
require 'billogram/resources/contact'
require 'billogram/resources/customer'
require 'billogram/resources/data'
require 'billogram/resources/detailed_sums'
require 'billogram/resources/domestic_bank_account'
require 'billogram/resources/edi'
require 'billogram/resources/electricity_collection'
require 'billogram/resources/event'
require 'billogram/resources/info'
require 'billogram/resources/international_bank_account'
require 'billogram/resources/invoice'
require 'billogram/resources/invoice_defaults'
require 'billogram/resources/item'
require 'billogram/resources/logotype'
require 'billogram/resources/payment'
require 'billogram/resources/payment_settings'
require 'billogram/resources/regional_sweden'
require 'billogram/resources/report'
require 'billogram/resources/settings'
require 'billogram/resources/tax'
require 'billogram/version'

module Billogram
  class << self
    BASE_URI = 'https://billogram.com/api/v2/'

    attr_accessor :username, :password
    attr_writer :base_uri

    def client
      @client ||= Client.new(username, password, base_uri)
    end

    def configure
      yield self if block_given?
    end

    def base_uri
      @base_uri ||= BASE_URI
    end
  end
end
