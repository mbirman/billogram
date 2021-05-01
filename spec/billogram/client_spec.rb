# frozen_string_literal: true

require 'spec_helper'

describe Billogram::Client do
  subject(:client) { Billogram.client }

  let(:url) { ENV['BILLOGRAM_BASE_URI'] }

  [:get, :post, :put, :delete].each do |verb|
    it "delegates #{verb} to the class" do
      expect(described_class).to receive(verb).with(url)

      client.send(verb, url)
    end
  end
end
