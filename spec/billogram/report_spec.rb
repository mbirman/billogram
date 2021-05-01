# frozen_string_literal: true

require 'spec_helper'

describe Billogram::Report do
  it_behaves_like :resource_with_endpoint, 'report'

  describe 'initialization' do
    subject(:report) { described_class.new }

    it { is_expected.to respond_to(:filename) }
    it { is_expected.to respond_to(:type) }
    it { is_expected.to respond_to(:file_type) }
    it { is_expected.to respond_to(:info) }
    it { is_expected.to respond_to(:created_at) }
    it { is_expected.to respond_to(:content) }

    it 'has id' do
      expect(report.id).to eq(report.filename)
    end
  end
end
