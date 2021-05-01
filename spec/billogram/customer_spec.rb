# frozen_string_literal: true

require 'spec_helper'

describe Billogram::Customer do
  subject { described_class.new(fixture('customer')) }

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
  it_behaves_like 'resource with endpoint', 'customer'


    it 'has relations' do
      expect(customer.contact).to be_a(Billogram::Contact)
      expect(customer.address).to be_a(Billogram::Address)
      expect(customer.delivery_address).to be_a(Billogram::Address)
    end
  end
  it { is_expected.to alias_id(:customer_no) }
end
