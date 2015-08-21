$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'billogram'
require 'webmock/rspec'
require 'helper'
require 'dotenv'
Dotenv.load

Billogram.configure do |config|
  config.username = ENV["BILLOGRAM_USERNAME"]
  config.password = ENV["BILLOGRAM_PASSWORD"]
  config.base_uri = ENV["BILLOGRAM_BASE_URI"]
end
