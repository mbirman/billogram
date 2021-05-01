# frozen_string_literal: true

require 'webmock/rspec'

WebMock.disable_net_connect!(allow_localhost: true)

RSpec.configure do |config|
  config.before do
    WebMock
      .stub_request(:any, /#{ENV['BILLOGRAM_BASE_URI']}.*/)
      .to_return(status: 200, body: {}.to_json)
  end
end
