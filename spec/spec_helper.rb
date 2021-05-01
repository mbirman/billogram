# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)

require 'simplecov'
SimpleCov.start

require 'billogram'
require 'dotenv'

Dir['./spec/support/**/*.rb'].sort.each { |f| require f }

Dotenv.load

Billogram.configure do |config|
  config.username = ENV['BILLOGRAM_USERNAME']
  config.password = ENV['BILLOGRAM_PASSWORD']
  config.base_uri = ENV['BILLOGRAM_BASE_URI']
end
