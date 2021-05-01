require 'spec_helper'

describe Billogram::Client do
  subject { Billogram.client }

  let(:url) { 'http://example.com' }

  [:get, :post, :put, :delete].each do |verb|
    it "delegates #{verb} to the class" do
      expect(described_class).to receive(verb).with(url)

      subject.send(verb, url)
    end
  end
end
