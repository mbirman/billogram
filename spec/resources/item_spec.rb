require 'spec_helper'

describe Billogram::Item do
  subject { described_class.new(fixture("item")) }

  its(:endpoint) { is_expected.to eq('item') }

  it { is_expected.to respond_to(:item_no) }
  it { is_expected.to respond_to(:title) }
  it { is_expected.to respond_to(:description) }
  it { is_expected.to respond_to(:price) }
  it { is_expected.to respond_to(:vat) }
  it { is_expected.to respond_to(:unit) }
  it { is_expected.to respond_to(:created_at) }
  it { is_expected.to respond_to(:updated_at) }

  its(:id) { is_expected.to eq(subject.item_no) }

  describe "relations" do
    its(:bookkeeping) { is_expected.to be_a(Billogram::Bookkeeping) }
  end
end
