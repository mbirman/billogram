require 'spec_helper'

describe Billogram::Report do
  it_behaves_like "a resource with endpoint", "report"

  describe "initialization" do
    subject { described_class.new } 

    it { is_expected.to respond_to(:filename) }
    it { is_expected.to respond_to(:type) }
    it { is_expected.to respond_to(:file_type) }
    it { is_expected.to respond_to(:info) }
    it { is_expected.to respond_to(:created_at) }
    it { is_expected.to respond_to(:content) }

    its(:id) { is_expected.to eq(subject.filename) }
  end
end
