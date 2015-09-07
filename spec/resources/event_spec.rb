require 'spec_helper'

describe Billogram::Event do
  it_behaves_like "a resource with endpoint", "billogram_event"

  describe "initialization" do
    subject { described_class.new(fixture("event")) }

    it { is_expected.to respond_to(:created_at) }
    it { is_expected.to respond_to(:type) }

    describe "relations" do
      its(:data) { is_expected.to be_a(Billogram::Data) }
    end
  end
end
