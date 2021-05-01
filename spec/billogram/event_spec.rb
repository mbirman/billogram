# frozen_string_literal: true

require 'spec_helper'

describe Billogram::Event do
  it_behaves_like :resource_with_endpoint, 'billogram_event'

  describe 'initialization' do
    subject(:event) { described_class.new(fixture('event')) }

    it { is_expected.to respond_to(:created_at) }
    it { is_expected.to respond_to(:type) }

    it 'has relations' do
      expect(event.data).to be_a(Billogram::Data)
    end
  end
end
