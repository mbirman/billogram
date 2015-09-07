require 'spec_helper'

describe Billogram::Customer do
  it_behaves_like "a resource with endpoint", "customer"

  describe "initialization" do
    subject { described_class.new(fixture("customer")) }

    it { is_expected.to respond_to(:customer_no) }
    it { is_expected.to respond_to(:name) }
    it { is_expected.to respond_to(:phone) }
    it { is_expected.to respond_to(:email) }
    it { is_expected.to respond_to(:notes) }
    it { is_expected.to respond_to(:org_no) }
    it { is_expected.to respond_to(:vat_no) }
    it { is_expected.to respond_to(:created_at) }
    it { is_expected.to respond_to(:updated_at) }
    it { is_expected.to respond_to(:company_type) }

    its(:id) { is_expected.to eq(subject.customer_no) }

    describe "relations" do
      its(:contact) { is_expected.to be_a(Billogram::Contact) }
      its(:address) { is_expected.to be_a(Billogram::Address) }
      its(:delivery_address) { is_expected.to be_a(Billogram::Address) }
    end
  end
end
