require 'spec_helper'

describe Billogram::Client do
  subject { Billogram.client }

  [:get, :post, :put, :delete].each do |verb|
    it "delegates #{verb}" do
      url = "http://example.com"
      expect(described_class).to receive(verb).with(url)
      subject.send(verb, url)
    end
  end
end
