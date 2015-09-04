require 'spec_helper'

describe Billogram::Event do
  subject { described_class.new(fixture("event")) }

  its(:endpoint) { is_expected.to eq('billogram_event') }

  it { is_expected.to respond_to(:created_at) }
  it { is_expected.to respond_to(:type) }

  describe "relations" do
    its(:data) { is_expected.to be_a(Billogram::Data) }
  end
end
