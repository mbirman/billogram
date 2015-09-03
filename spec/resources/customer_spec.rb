require 'spec_helper'

describe Billogram::Customer do
  subject { described_class.new(fixture("customer")) }

  its(:endpoint) { is_expected.to eq('customer') }

  it { is_expected.to respond_to(:customer_no) }
  it { is_expected.to respond_to(:name) }
  it { is_expected.to respond_to(:notes) }
  it { is_expected.to respond_to(:org_no) }
  it { is_expected.to respond_to(:vat_no) }
  it { is_expected.to respond_to(:created_at) }
  it { is_expected.to respond_to(:updated_at) }
  it { is_expected.to respond_to(:company_type) }

  describe "relations" do
    its(:contact) { is_expected.to be_a(Billogram::Contact) }
    its(:address) { is_expected.to be_a(Billogram::Address) }
    its(:delivery_address) { is_expected.to be_a(Billogram::Address) }
  end
end
